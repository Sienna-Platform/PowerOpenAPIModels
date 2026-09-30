# The API

Everything these packages expose falls into five groups: the **generated types** themselves,
the **`encode`/`decode` pair** that moves them to and from JSON, the **model-type registry**
that turns a type name in a document into a Julia type, the **unit annotations** that say
what a number means, and the two **document containers** that hold a whole system or
portfolio.

The surface is deliberately small. There is no client, no HTTP, and no mutation API: these
are transport types, and the code that builds a `System` out of them lives in
PowerSystems.jl.

## Generated types

Every schema becomes one Julia struct, keyword-constructible, with a field per property:

```@example api
using PowerOpenAPIModels, JSON

bus = ACBus(;
    id = 1,
    number = 1,
    name = "bus1",
    available = true,
    bustype = ACBusType("REF"),
    base_voltage = 138.0,
)
```

Three shapes exist, distinguished by their supertype:

| Supertype | Schema shape | Example |
| --- | --- | --- |
| [`APIModel`](@ref InfrastructureCoreOpenAPIModels.APIModel) | an object | `ACBus`, `Line`, `MinMax` |
| [`EnumAPIModel`](@ref InfrastructureCoreOpenAPIModels.EnumAPIModel) | a string with a fixed value set | `ACBusType`, `UnitSystem` |
| [`OneOfAPIModel`](@ref InfrastructureCoreOpenAPIModels.OneOfAPIModel) | a `oneOf` selected by a discriminator | `ValueCurve`, `TimeSeriesAssociation` |

Every generated struct is **immutable**. Build a modified copy rather than assigning to a
field.

### Required and optional fields

A required property becomes a plain typed field with no default: leave it out and the
constructor errors. An optional property defaults to `ABSENT`, a sentinel distinct from
`nothing`:

- `ABSENT` — the key is not in the document at all. It encodes to no key.
- `nothing` — the key is in the document with the value `null`, where the schema allows it.

```@example api
line_without_b = !haskey(encode(ACBus(; id = 1, number = 1, name = "b", available = true)), "angle")
```

That distinction is what lets a document round-trip without gaining keys its producer never
wrote.

### Unknown properties

Every object type carries an `additional_properties` dictionary. A key the schema does not
model is kept there rather than dropped, so a document written by a newer producer survives a
read-then-write cycle intact:

```@example api
decoded = decode(MinMax, Dict{String, Any}("min" => 0.0, "note" => "from a newer producer"))
decoded.additional_properties
```

## Encoding and decoding

Two functions — [`encode`](@ref InfrastructureCoreOpenAPIModels.encode) and
[`decode`](@ref InfrastructureCoreOpenAPIModels.decode) — both exported by
`InfrastructureCoreOpenAPIModels` and therefore by every package that depends on it.

`encode` returns JSON-ready data — an object, not a string — so it composes with whatever
JSON library the caller already uses:

```@example api
text = JSON.json(encode(bus))
```

```@example api
back = decode(ACBus, JSON.parse(text))
back.base_voltage
```

Decoding validates against the schema each package embeds, so malformed input fails at the
boundary rather than deep inside a consumer:

```julia
decode(Line, Dict("id" => 1))
# ERROR: schema validation failed while decoding Line
#   : required
```

Pass `false` as the third argument to skip validation when the data is already known good and
the check is measurably hot.

## Enums

An enum is a wrapper struct that validates on construction, so an invalid value cannot exist:

```@example api
string(ACBusType("REF"))
```

```julia
ACBusType("SWING")   # ERROR: ArgumentError: invalid ACBusType value "SWING"
```

`string` unwraps one; the raw value is in the `value` field.

## Discriminated unions

A `oneOf` becomes a wrapper struct holding the selected variant in `value`. On decode the
discriminator property picks the variant; on encode the variant is written directly, with no
wrapper object around it:

```@example api
curve = ValueCurve(
    InputOutputCurve(;
        function_data = InputOutputCurveFunctionData(
            LinearFunctionData(; constant_term = 0.0, proportional_term = 25.0),
        ),
    ),
)
decode(ValueCurve, JSON.parse(JSON.json(encode(curve)))).value
```

Dispatch on [`OneOfAPIModel`](@ref InfrastructureCoreOpenAPIModels.OneOfAPIModel) to unwrap one generically instead of enumerating members.

## The model-type registry

A document names its component types as strings. The registry is what turns a name back into
a type, and every package registers its own types when it loads — so what a build can read
depends on which packages are loaded, and asking for an unknown name is an error, never a
silent skip.

```@example api
InfrastructureCoreOpenAPIModels.model_type("ACBus")
```

Reference: [`register_model_type!`](@ref InfrastructureCoreOpenAPIModels.register_model_type!),
[`has_model_type`](@ref InfrastructureCoreOpenAPIModels.has_model_type),
[`model_type`](@ref InfrastructureCoreOpenAPIModels.model_type),
[`DocumentFormatError`](@ref InfrastructureCoreOpenAPIModels.DocumentFormatError).

## Units

Every convertible field carries its unit from the schema's `x-unit` annotation, reachable
without parsing anything. Three cases:

**Fixed** — the unit follows from the type:

```@example api
declared_unit(ACBus, Val(:base_voltage)), declared_quantity(ACBus, Val(:base_voltage))
```

**Discriminated** — the unit follows from a basis the record carries itself, so it is read
from the instance:

```@example api
zone(units) = LoadZone(;
    id = 1,
    name = "zone1",
    peak_active_power = 100.0,
    peak_reactive_power = 50.0,
    base_power = 100.0,
    power_units = UnitSystem(units),
)

(
    declared_unit(zone("NATURAL_UNITS"), Val(:peak_active_power)),
    declared_unit(zone("COMPONENT_BASE"), Val(:peak_active_power)),
)
```

There is no system-wide unit basis: data per-unitized against a shared base records that base
in the component's own `base_power` and travels as `COMPONENT_BASE`.

**Per-unit** — the value needs a base, and `unit_base` names the sibling field holding it:

```@example api
unit_base(ACBus, Val(:magnitude))
```

Unannotated fields fall through to a generic `false`, so a caller can ask about any field:

```@example api
has_declared_unit(ACBus, Val(:name))
```

The vocabulary converts a unit to its quantity's canonical unit. It is keyed by the
**pair**, because a unit is only meaningful for a quantity, and `pu` is deliberately absent
from it — a per-unit value needs a base, not a factor:

```@example api
(
    conversion_factor("ActivePower", "kW"),
    conversion_factor("Angle", "deg"),
    has_conversion_factor("Voltage", "pu"),
)
```

## Documents

`PowerOpenAPIModels` adds the two containers that hold a complete data set. They are
hand-written rather than generated, because typed heterogeneous `components` buckets are not
expressible in OpenAPI — so their fields are asserted against the schemas in the test suite
instead.

Their accessors are not exported: reach them qualified, so `get_name` here never collides
with a consumer's own.

```@example document
using PowerOpenAPIModels
const P = PowerOpenAPIModels

doc = P.SystemDocument(; name = "example", frequency = 60.0)

bus_id = P.next_id!(doc)
P.add_component!(doc, ACBus(;
    id = bus_id,
    number = 1,
    name = "bus1",
    available = true,
    bustype = ACBusType("REF"),
))
P.set_ext!(doc, bus_id, Dict("Zone" => "1"))

path = joinpath(mktempdir(), "system.json")
P.write_document(doc, path)
back = P.read_document(path)

(P.get_name(back), P.component_type_names(back), eltype(P.get_components(back, "ACBus")))
```

Ids are the document's reference mechanism, so `next_id!` is the only way to mint one, and
reading a document reserves every id it already contains. `read_document` runs
`validate_document`: a duplicate id or an association pointing at a component that is not
there raises [`DocumentFormatError`](@ref InfrastructureCoreOpenAPIModels.DocumentFormatError) instead of being read and quietly dropped.

`PortfolioDocument` is the investment-side counterpart with the same shape, read back with
`read_portfolio_document`.

Reference: [`SystemDocument`](@ref PowerOpenAPIModels.SystemDocument),
[`PortfolioDocument`](@ref PowerOpenAPIModels.PortfolioDocument),
[`next_id!`](@ref PowerOpenAPIModels.next_id!),
[`add_component!`](@ref PowerOpenAPIModels.add_component!),
[`add_supplemental_attribute!`](@ref PowerOpenAPIModels.add_supplemental_attribute!),
[`add_time_series_association!`](@ref PowerOpenAPIModels.add_time_series_association!),
[`get_components`](@ref PowerOpenAPIModels.get_components),
[`component_type_names`](@ref PowerOpenAPIModels.component_type_names),
[`set_ext!`](@ref PowerOpenAPIModels.set_ext!),
[`get_ext`](@ref PowerOpenAPIModels.get_ext),
[`validate_document`](@ref PowerOpenAPIModels.validate_document),
[`write_document`](@ref PowerOpenAPIModels.write_document),
[`read_document`](@ref PowerOpenAPIModels.read_document),
[`read_portfolio_document`](@ref PowerOpenAPIModels.read_portfolio_document).

## Choosing a package

Depend on the narrowest package that covers the types in play. `PowerOpenAPIModels` pulls in
all six; a parser that only emits operations components needs
`PowerOperationsOpenAPIModels`, and a consumer of time series catalogs needs only
`InfrastructureTimeSeriesOpenAPIModels`. Each package re-exports the ones it depends on, so
narrowing costs no `using` lines.
