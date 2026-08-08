# Patches to openapi-generator's julia-client (for a future upstream PR)

Generator version: **7.20.0** (`openapi-generator-cli-7.20.0.jar`, per `Dockerfile`).

## The divergence

The same JSON document, with an optional field omitted, loads to a different
effective value in Julia than in Python. Example, `TransformerCircuit`:

```json
"control_limits": {
  "$ref": "../../Core/common.json#/definitions/MinMax",
  "default": { "min": 0.9, "max": 1.1 }
}
```

Pydantic (via `datamodel-code-generator` on the Python side) keeps the
declared default. Before this patch, `openapi-generator`'s julia-client
emitted:

```julia
control_limits = nothing # spec type: Union{ Nothing, MinMax }
```

`TransformerCircuit()` in Julia therefore has `control_limits === nothing`;
the same document loaded in Python has `control_limits == {"min": 0.9, "max":
1.1}`. Scalar defaults (`tap=1.0`, `parameter_units="DEVICE_BASE"`, ...) are
unaffected and already round-trip correctly — only two schema kinds are lost:
an object default on a `$ref`-typed property (`control_limits`,
`Source.active_power_limits`, ...) and an array default (`*.requirements:
default: []`).

## Root cause, localized

`AbstractJuliaCodegen.toDefaultValue(Schema)` —
`modules/openapi-generator/src/main/java/org/openapitools/codegen/languages/AbstractJuliaCodegen.java:393-427`
in the openapi-generator source tree — only renders boolean, date, date-time,
integer/long/number, and string defaults:

```java
public String toDefaultValue(Schema schema) {
    if (schema.getDefault() != null) {
        if (ModelUtils.isBooleanSchema(schema)) { ... }
        else if (ModelUtils.isDateSchema(schema)) { ... }
        else if (ModelUtils.isDateTimeSchema(schema)) { ... }
        else if (ModelUtils.isIntegerSchema(schema) || ... isNumberSchema(schema)) { ... }
        else if (ModelUtils.isStringSchema(schema)) { ... }
    }
    return "nothing";
}
```

Every other schema kind — an object (`$ref`-typed property) or an array —
falls through to the literal string `"nothing"`, unconditionally, without
even inspecting `schema.getDefault()`. `model.mustache` then has nothing
usable to render:

```
{{{name}}} = {{#defaultValue}}{{{defaultValue}}}{{/defaultValue}}{{^defaultValue}}nothing{{/defaultValue}}
```

Confirmed by running the generator with `--global-property debugModels=true`
and inspecting the emitted `CodegenModel` JSON:

- **Array defaults are visible to the template but not rendered.** A
  `type: array, default: []` property's `jsonSchema` field (the per-property
  JSON Schema string openapi-generator hands to every template) still
  contains `"default": []`. The information reaches template-data; only
  `toDefaultValue` fails to turn it into `Int64[]`/`T[]`. This part is a
  contained fix: add an `isArraySchema(schema)` (and, for completeness,
  `isMapSchema(schema)`) branch to `AbstractJuliaCodegen.toDefaultValue`.
- **Object ($ref) defaults are gone before the template stage, for a
  different reason.** `control_limits`'s own `jsonSchema` is just
  `{"$ref": "#/components/schemas/MinMax"}` — no `default`, and no
  `description` either (compare: the same property's `vendorExtensions` DOES
  still carry its `x-unit-discriminator`/`x-units` siblings). So somewhere in
  `CodegenProperty` construction, a `$ref` property's sibling `default` (and
  `description`) are dropped while its `x-*` vendor extensions survive. I
  traced this to before-or-during `DefaultCodegen.fromProperty` (the "original
  schema" restore path at `DefaultCodegen.java:4251-4299` is the mechanism
  that is *supposed* to carry sibling `default`/`description` back onto the
  property, and empirically does not for this case) but did not pin the exact
  call site with full certainty — that needs a JVM debugger session against
  `openapi-generator-cli`, which is out of scope here. This part of the fix is
  therefore generator-wide (`DefaultCodegen`, not Julia-specific) and is the
  part most worth raising as its own upstream issue before a PR, since a
  `toDefaultValue` change alone cannot fix it: the data has to survive to
  reach that method at all.

## Minimal reproduction

```yaml
# minimal.yaml
openapi: 3.0.3
info: {title: repro, version: "1"}
paths: {}
components:
  schemas:
    MinMax:
      type: object
      properties: {min: {type: number}, max: {type: number}}
    Widget:
      type: object
      properties:
        limits:
          $ref: '#/components/schemas/MinMax'
          default: {min: 0.9, max: 1.1}
        tags:
          type: array
          default: []
          items: {type: string}
```

```
openapi-generator generate -i minimal.yaml -g julia-client -o /tmp/repro
grep -A1 'limits\|tags' /tmp/repro/src/models/model_widget.jl
```

Julia (7.20.0): `limits = nothing # spec type: ...`, `tags::Union{Nothing,
Vector} = nothing`. Pydantic on the same document: `limits.default ==
{'min': 0.9, 'max': 1.1}`, `tags.default == []`.

## Local mechanism: post-processing script (not a template override)

A template-only fix is not viable: by the time `model.mustache` sees a
`$ref`-typed property, `{{defaultValue}}` has already been collapsed to the
literal string `"nothing"` by `AbstractJuliaCodegen.toDefaultValue` (Java, run
before templating), and the schema's actual default object was dropped from
`CodegenProperty` before that. No mustache variable on that property
(`jsonSchema`, `vendorExtensions`, `defaultValue`) carries the composite value
forward, and a template override cannot recover data the Java layer discarded.

So the fix lives in `scripts/materialize_defaults.jl`, run by `make generate`
immediately after `scripts/reorganize.jl` (same target, so `make generate`
alone reproduces the fixed output — see `Makefile`):

1. Reads `SiennaSchemas/dist/openapi-<domain>-bundled.json` — the same
   pre-bundled, fully `$ref`-resolved specs `scripts/emit_units.jl` already
   depends on for `x-unit` annotations. Unlike the raw per-fragment schema
   files openapi-generator consumes, these keep the sibling `default` next to
   a resolved `$ref`, in both the `components.schemas` and the legacy
   Swagger2-style `definitions` bucket some shared schemas end up in. This
   is the collection step, and it is read-only against SiennaSchemas.
2. For every `(type, property)` whose default is a JSON object or array,
   `include()`s every already-generated `model_*.jl` (all four domains, one
   throwaway namespace, no name collisions because `reorganize.jl` already
   dedupes Core types out of the domain packages) against a minimal
   stand-in `OpenAPI` module — abstract `APIModel`/`OneOfAPIModel` plus
   no-op validation. This deliberately reuses the type and branch resolution
   openapi-generator *already emitted* (`OpenAPI.property_type`, including
   the 3-arg discriminator form on every `oneOf` wrapper struct) rather than
   re-deriving Julia type names or discriminator rules independently — a
   second, independent guess at "which oneOf branch does `curve_type:
   INPUT_OUTPUT` select" is exactly the kind of guess that produces a
   silently wrong default.
3. Renders the JSON default as Julia source text recursively (nested
   `@kwdef` constructor calls for plain objects, `T[...]` for arrays,
   `Wrapper(branch(...))` for a `oneOf`), then rewrites the two places
   `model.mustache` wrote the literal text `"nothing"`: the struct's own
   field initializer and the docstring's constructor-signature block.

This fixes both defect classes from one script: the array case (a codegen
gap only) and the object/`$ref` case (a data-loss-before-templating problem
a Java-side fix will eventually need two changes for, per above).

## Verification

- `julia test/validate.jl` passes (packages load, no duplicate types,
  `SystemDocument` still matches its schema, every registered type is an
  `APIModel`).
- Constructing with no arguments now matches the schema default at the field
  level (`MinMax` is a mutable struct, so `==` between two instances is
  reference identity, not a value comparison — the check has to compare
  fields, not whole-struct equality):
  `TransformerCircuit().control_limits.min == 0.9 &&
  TransformerCircuit().control_limits.max == 1.1`,
  `Source().active_power_limits.min == 0.0 &&
  Source().active_power_limits.max == 0.0`,
  `SupplyTechnology().requirements == Int64[]` (a `Vector` **is** compared
  by value, so `==` is fine there).
- `power-openapi-models/scripts/check_cross_language.py --julia
  <this repo>`: the *values* now agree — every field this patch touches
  round-trips to the same MW/kV/etc. numbers pydantic produces. The script
  itself still reports a textual divergence on those fields, because its
  `normalize_default` compares `str(python_default)` against the literal
  Julia source text after `=`: `str({'min': 0.9, 'max': 1.1})` (a Python
  dict repr) can never equal `"MinMax(; max=1.1, min=0.9)"` (valid Julia; a
  `{...}` dict literal is not — Julia's curly braces are type-parameter
  syntax) as *strings*, no matter how the value is rendered. This is a
  known limitation of that checker's text-based comparison, not of this
  fix; retiring it fully needs a structural (parse-both-sides-into-JSON)
  comparison in `check_cross_language.py` itself, which lives in the
  `power-openapi-models` repo and is out of this task's scope.
