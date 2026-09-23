# PowerDynamicsOpenAPIModels.jl

The dynamics domain: machine, exciter, governor, and inverter-control models —
`RoundRotorMachine`, `SEXS`, `SteamTurbineGov1`, `RenewableEnergyConverterTypeA`,
`RECurrentControlB`, and the renewable controller types.

A dynamic model is attached to a static injector through that injector's `dynamic_injector`
id, so these types travel in the same document as the operations components rather than in
one of their own.

## Part of PowerOpenAPIModels

One of seven packages in the [PowerOpenAPIModels](https://github.com/Sienna-Platform/PowerOpenAPIModels)
monorepo, each registered separately so an application loads only what it needs. All seven
are **generated from [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas)** and
carry no PowerSystems.jl or InfrastructureSystems.jl dependency: they are the wire format
those packages read and write, not the data model itself.

- Full API reference and the other six packages: <https://sienna-platform.github.io/PowerOpenAPIModels/>
- Per-type field tables: the [`docs/`](docs) directory in this package
- Monorepo README, regeneration, and release process: [the repository root](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)

Depends on `PowerCoreOpenAPIModels`, which it re-exports.

## Installation

```julia
using Pkg
Pkg.add("PowerDynamicsOpenAPIModels")
```

## Usage

```julia
using PowerDynamicsOpenAPIModels, JSON

exciter = SEXS(;
    id = 1,
    ta_tb = 0.1,
    tb = 10.0,
    k = 100.0,
    te = 0.1,
    v_lim = MinMax(; min = 0.0, max = 5.0),
)

text = JSON.json(encode(exciter))
back = decode(SEXS, JSON.parse(text))

back.v_lim.max == 5.0
declared_unit(SEXS, Val(:te))   # "s"
```

An optional field left unset encodes to no key at all, so a document never gains keys its
producer did not write:

```julia
haskey(JSON.parse(text), "v_ref")   # false
```

## Generated code

`src/` is generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate, never the
Julia sources here.

## Testing

```julia
using Pkg
Pkg.test("PowerDynamicsOpenAPIModels")
```

## License

BSD 3-Clause. See [LICENSE](LICENSE).
