# InfrastructureCoreOpenAPIModels.jl

Domain-neutral transport types shared by every Sienna OpenAPI model package: function data
(linear, quadratic, piecewise), value pairs (`MinMax`, `FromTo`, `UpDown`, `InOut`), the
supplemental-attribute and data-source association rows, and the `UnitSystem` enum.

This is the base of the dependency chain — it owns the model-type registry, the unit
vocabulary, and the `APIModel` supertypes the other six packages build on. It deliberately
carries **no power-system concept and no `Power*` dependency**, so a consumer that only
speaks the generic data model never loads a power schema. Its own test suite asserts that.

## Part of PowerOpenAPIModels

One of seven packages in the [PowerOpenAPIModels](https://github.com/Sienna-Platform/PowerOpenAPIModels)
monorepo, each registered separately so an application loads only what it needs. All seven
are **generated from [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas)** and
carry no PowerSystems.jl or InfrastructureSystems.jl dependency: they are the wire format
those packages read and write, not the data model itself.

- Full API reference and the other six packages: <https://sienna-platform.github.io/PowerOpenAPIModels/>
- Per-type field tables: the [`docs/`](docs) directory in this package
- Monorepo README, regeneration, and release process: [the repository root](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)

## Installation

```julia
using Pkg
Pkg.add("InfrastructureCoreOpenAPIModels")
```

## Usage

Every generated type is a keyword-constructible struct that encodes to, and decodes from,
JSON-ready data. `encode` returns a plain object ready for `JSON.json`; `decode` validates
the incoming data against the schema the package embeds and rebuilds the typed struct.

```julia
using InfrastructureCoreOpenAPIModels, JSON

bounds = MinMax(; min = 0.0, max = 1.0)

text = JSON.json(encode(bounds))          # "{\"max\":1.0,\"min\":0.0}"
back = decode(MinMax, JSON.parse(text))   # MinMax(1.0, 0.0, Dict{String, Any}())

back.max == 1.0
```

Optional fields default to `ABSENT`, which encodes to no key at all — distinct from a field
the document set to `null`. Decoding enforces the schema, so a missing required field or a
value of the wrong type raises rather than producing a half-built struct:

```julia
decode(LinearFunctionData, Dict("constant_term" => 1.0))
# ERROR: schema validation failed while decoding LinearFunctionData
#   : required
```

Reading a document means turning a type name into a type, which is what the registry is for.
Each package registers its own types on load:

```julia
InfrastructureCoreOpenAPIModels.model_type("MinMax") === MinMax
```

## Generated code

`src/` is generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate, never the
Julia sources here. The [monorepo README](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)
documents the generator.

## Testing

```julia
using Pkg
Pkg.test("InfrastructureCoreOpenAPIModels")
```

Cross-package checks live in the umbrella `PowerOpenAPIModels` suite, the only one that sees
all seven at once.

## License

BSD 3-Clause. See [LICENSE](LICENSE).
