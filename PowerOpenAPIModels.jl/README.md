# PowerOpenAPIModels.jl

The umbrella package: re-exports all six generated Sienna OpenAPI model packages, and adds
the two hand-written containers that hold a whole document — `SystemDocument` and
`PortfolioDocument`.

Install this one to get every type at once. Install a single domain package instead if the
application only speaks one domain.

## Part of PowerOpenAPIModels

One of seven packages in the [PowerOpenAPIModels](https://github.com/Sienna-Platform/PowerOpenAPIModels)
monorepo, each registered separately so an application loads only what it needs. The six
model packages are **generated from [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas)**
and carry no PowerSystems.jl or InfrastructureSystems.jl dependency: they are the wire format
those packages read and write, not the data model itself.

| Package | Role |
| --- | --- |
| [`InfrastructureCoreOpenAPIModels`](../InfrastructureCoreOpenAPIModels.jl) | Domain-neutral types, model-type registry, unit vocabulary |
| [`InfrastructureTimeSeriesOpenAPIModels`](../InfrastructureTimeSeriesOpenAPIModels.jl) | The six time series association types |
| [`PowerCoreOpenAPIModels`](../PowerCoreOpenAPIModels.jl) | Topology, curves, costs, power enums |
| [`PowerOperationsOpenAPIModels`](../PowerOperationsOpenAPIModels.jl) | Branches, injections, services, market |
| [`PowerInvestmentsOpenAPIModels`](../PowerInvestmentsOpenAPIModels.jl) | Technologies, financials, requirements |
| [`PowerDynamicsOpenAPIModels`](../PowerDynamicsOpenAPIModels.jl) | Dynamic machine and inverter models |

- Full API reference: <https://sienna-platform.github.io/PowerOpenAPIModels/>
- Monorepo README, regeneration, and release process: [the repository root](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)

## Installation

```julia
using Pkg
Pkg.add("PowerOpenAPIModels")
```

## Usage

### One type

Every re-exported type encodes to, and decodes from, JSON-ready data. `encode` returns a
plain object ready for `JSON.json`; `decode` validates against the schema the package embeds
and rebuilds the typed struct.

```julia
using PowerOpenAPIModels, JSON

bus = ACBus(;
    id = 1,
    number = 1,
    name = "bus1",
    available = true,
    bustype = ACBusType("REF"),
    base_voltage = 138.0,
)

text = JSON.json(encode(bus))
back = decode(ACBus, JSON.parse(text))
```

### A whole document

`SystemDocument` is the container a system serializes to: typed component buckets, the
association rows, and the id counter that keeps references resolvable. Its accessors are not
exported — reach them qualified, so `get_name` here never collides with a consumer's own.

```julia
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

P.write_document(doc, "system.json")
back = P.read_document("system.json")   # validates: ids unique, references resolvable
```

`read_document` runs `validate_document`, so an unresolved reference or a duplicate id raises
`DocumentFormatError` rather than being read and silently dropped. `PortfolioDocument` is the
investment-side counterpart, read back with `read_portfolio_document`.

The full walkthrough — supplemental attributes, time series associations, `ext`, and the
accessor list — is in
[the API documentation](https://sienna-platform.github.io/PowerOpenAPIModels/dev/api/#Documents).

## Generated code

The six model packages' `src/` directories are generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate. The two
document containers in this package are hand-written, because typed heterogeneous
`components` buckets are not expressible in OpenAPI; their fields are asserted against the
schemas in the test suite instead.

## Testing

```julia
using Pkg
Pkg.test("PowerOpenAPIModels")
```

This suite carries the cross-package invariants — no type defined twice across the six, no
unresolved inline schema copy, no unit method emitted by a package that does not own the type
— plus the document round trips and serde against real
[PowerFlowFileParser](https://github.com/Sienna-Platform/PowerFlowFileParser.jl) output.
Set `SCHEMA_DIR` to a SiennaSchemas checkout to also run the schema-drift checks on the two
hand-written containers; without one they warn and skip.

## License

BSD 3-Clause. See [LICENSE](LICENSE).
