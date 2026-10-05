# PowerOpenAPIModels.jl

The umbrella package: re-exports all six generated Sienna OpenAPI model packages. It adds no
code of its own; the two document containers live in the packages that own their types —
`SystemDocument` in `PowerCoreOpenAPIModels`, `PortfolioDocument` in
`PowerInvestmentsOpenAPIModels`.

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

## Generated code

The six model packages' `src/` directories are generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate.

## Testing

```julia
using Pkg
Pkg.test("PowerOpenAPIModels")
```

This suite carries the cross-package invariants — no type defined twice across the six, no
unresolved inline schema copy, no unit method emitted by a package that does not own the type
— plus the document round trips and serde against real
[PowerFlowFileParser](https://github.com/Sienna-Platform/PowerFlowFileParser.jl) output.
The document tests live here too, because reading a document resolves component types from
every domain package. Set `SCHEMA_DIR` to a SiennaSchemas checkout to also run the
schema-drift checks on the two hand-written containers; without one they warn and skip.

## License

BSD 3-Clause. See [LICENSE](LICENSE).
