# PowerOperationsOpenAPIModels.jl

The operations domain: branches (`Line`, `MonitoredLine`, the transformer and HVDC families),
injections (`ThermalStandard`, `RenewableDispatch`, `HydroTurbine`, `EnergyReservoirStorage`,
the load types), services and reserves, outages, and market structures (`TradingHub`,
`MarketStage`, bids and bilateral transactions).

This is the largest of the three domain packages — roughly a hundred component types — and
the one a production, unit-commitment, or power-flow application usually needs.

## Part of PowerOpenAPIModels

One of seven packages in the [PowerOpenAPIModels](https://github.com/Sienna-Platform/PowerOpenAPIModels)
monorepo, each registered separately so an application loads only what it needs. All seven
are **generated from [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas)** and
carry no PowerSystems.jl or InfrastructureSystems.jl dependency: they are the wire format
those packages read and write, not the data model itself.

- Full API reference and the other six packages: <https://sienna-platform.github.io/PowerOpenAPIModels/>
- Per-type field tables: the [`docs/`](docs) directory in this package
- Monorepo README, regeneration, and release process: [the repository root](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)

Depends on `PowerCoreOpenAPIModels` (topology, curves, enums), which it re-exports, so
`using PowerOperationsOpenAPIModels` also brings `ACBus`, `MinMax`, `encode`, and `decode`
into scope.

## Installation

```julia
using Pkg
Pkg.add("PowerOperationsOpenAPIModels")
```

## Usage

```julia
using PowerOperationsOpenAPIModels, JSON

line = Line(;
    id = 1,
    name = "line1",
    available = true,
    active_power_flow = 0.0,
    reactive_power_flow = 0.0,
    arc = 2,
    r = 0.01,
    x = 0.1,
    base_power = 100.0,
    power_units = UnitSystem("NATURAL_UNITS"),
    rating = 250.0,
    angle_limits = MinMax(; min = -1.57, max = 1.57),
)

text = JSON.json(encode(line))
back = decode(Line, JSON.parse(text))

back.rating == 250.0
```

Decoding validates against the embedded schema, so a document missing a required field fails
loudly instead of yielding a partly-built component:

```julia
raw = Dict(encode(line)); delete!(raw, "angle_limits")
decode(Line, raw)   # ERROR: schema validation failed while decoding Line
```

### Units

A component records the basis its own numbers are in, and the unit of a field follows that
basis rather than a document-wide setting:

```julia
declared_unit(Line, Val(:base_power))                      # "MVA" — fixed by the type
declared_unit(line, Val(:active_power_flow))               # "MW"  — follows power_units
declared_unit(
    Line(; parameter_units = ImpedanceUnitBasis("COMPONENT_BASE"), ...),
    Val(:r),
)                                                          # "pu"  — follows parameter_units
```

## Generated code

`src/` is generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate, never the
Julia sources here.

## Testing

```julia
using Pkg
Pkg.test("PowerOperationsOpenAPIModels")
```

## License

BSD 3-Clause. See [LICENSE](LICENSE).
