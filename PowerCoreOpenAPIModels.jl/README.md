# PowerCoreOpenAPIModels.jl

The power-system types shared across operations, investments, and dynamics: topology
(`ACBus`, `Arc`, `Area`, `LoadZone`), the cost and value curve family (`ValueCurve`,
`CostCurve`, `FuelCurve`, and the input-output / incremental / average-rate forms), and the
power enums (`ACBusType`, `PrimeMovers`, `ThermalFuels`, unit-basis discriminators).

A type lives here rather than in a domain package when more than one domain references it —
that is what keeps `ACBus` a single type instead of one copy per domain.

## Part of PowerOpenAPIModels

One of seven packages in the [PowerOpenAPIModels](https://github.com/Sienna-Platform/PowerOpenAPIModels)
monorepo, each registered separately so an application loads only what it needs. All seven
are **generated from [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas)** and
carry no PowerSystems.jl or InfrastructureSystems.jl dependency: they are the wire format
those packages read and write, not the data model itself.

- Full API reference and the other six packages: <https://sienna-platform.github.io/PowerOpenAPIModels/>
- Per-type field tables: the [`docs/`](docs) directory in this package
- Monorepo README, regeneration, and release process: [the repository root](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)

Depends on `InfrastructureCoreOpenAPIModels`. The three domain packages
(`PowerOperationsOpenAPIModels`, `PowerInvestmentsOpenAPIModels`, `PowerDynamicsOpenAPIModels`)
depend on this one.

## Installation

```julia
using Pkg
Pkg.add("PowerCoreOpenAPIModels")
```

## Usage

```julia
using PowerCoreOpenAPIModels, JSON

bus = ACBus(;
    id = 1,
    number = 1,
    name = "bus1",
    available = true,
    bustype = ACBusType("REF"),
    base_voltage = 138.0,
    voltage_limits = MinMax(; min = 0.95, max = 1.05),
)

text = JSON.json(encode(bus))
back = decode(ACBus, JSON.parse(text))

back.voltage_limits isa MinMax   # nested models come back typed, not as Dicts
string(back.bustype) == "REF"
```

An enum is a validating wrapper struct, so an invalid value is rejected at construction
rather than at read time:

```julia
ACBusType("SWING")   # ERROR: ArgumentError: invalid ACBusType value "SWING"
```

### Units

Every convertible field carries its unit from the schema. A fixed unit resolves from the type;
a unit that depends on the record's own basis resolves from the instance:

```julia
declared_unit(ACBus, Val(:base_voltage))    # "kV"
declared_quantity(ACBus, Val(:angle))       # "Angle"
unit_base(ACBus, Val(:magnitude))           # :base_voltage — the field the pu value is on
conversion_factor("Angle", "deg")           # 0.017453292519943295
```

`pu` has no conversion factor on purpose: it needs a base, which is what `unit_base` names.

## Generated code

`src/` is generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate, never the
Julia sources here.

## Testing

```julia
using Pkg
Pkg.test("PowerCoreOpenAPIModels")
```

## License

BSD 3-Clause. See [LICENSE](LICENSE).
