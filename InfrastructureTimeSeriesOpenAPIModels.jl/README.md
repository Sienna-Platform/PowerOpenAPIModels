# InfrastructureTimeSeriesOpenAPIModels.jl

The six canonical time series association types — `SingleTimeSeries`,
`NonSequentialTimeSeries`, `Deterministic`, `DeterministicSingleTimeSeries`, `Probabilistic`,
and `Scenarios` — plus the `TimeSeriesAssociation` wrapper that selects among them on the
`time_series_type` discriminator.

An association is **metadata**: it links one time series to the component or supplemental
attribute that owns it, and names where the values live (`uri`). Dense arrays never travel
inline. Which of the six a row uses decides which timing fields it carries, which is why each
is its own schema rather than one row with everything nullable.

Like `InfrastructureCoreOpenAPIModels`, this package is domain-neutral and carries **no
`Power*` dependency**; its test suite asserts that.

## Part of PowerOpenAPIModels

One of seven packages in the [PowerOpenAPIModels](https://github.com/Sienna-Platform/PowerOpenAPIModels)
monorepo, each registered separately so an application loads only what it needs. All seven
are **generated from [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas)** and
carry no PowerSystems.jl or InfrastructureSystems.jl dependency: they are the wire format
those packages read and write, not the data model itself.

- Full API reference and the other six packages: <https://sienna-platform.github.io/PowerOpenAPIModels/>
- Per-type field tables: the [`docs/`](docs) directory in this package
- Monorepo README, regeneration, and release process: [the repository root](https://github.com/Sienna-Platform/PowerOpenAPIModels#readme)

Depends on `InfrastructureCoreOpenAPIModels`, which supplies `encode`/`decode`, the model-type
registry, and the shared value types.

## Installation

```julia
using Pkg
Pkg.add("InfrastructureTimeSeriesOpenAPIModels")
```

## Usage

```julia
using InfrastructureTimeSeriesOpenAPIModels, Dates, JSON

series = SingleTimeSeries(;
    association_id = 1,
    owner_id = 2,
    owner_type = "ACBus",
    owner_category = OwnerCategory("Component"),
    name = "max_active_power",
    features = TimeSeriesFeatures(),
    uri = "time_series_storage.h5",   # where the values live; never inline
    element_type = "Float64",
    element_shape = Int64[],
    initial_timestamp = DateTime(2024, 1, 1),
    resolution = "PT1H",
    length = 24,
    time_series_type = "SingleTimeSeries",
)

text = JSON.json(encode(series))
back = decode(SingleTimeSeries, JSON.parse(text))

back.initial_timestamp == DateTime(2024, 1, 1)
```

A catalog row of unknown kind decodes through the wrapper, which reads `time_series_type` and
returns the variant it names:

```julia
wrapper = decode(TimeSeriesAssociation, JSON.parse(text))
wrapper.value isa SingleTimeSeries
```

## Generated code

`src/` is generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate, never the
Julia sources here.

## Testing

```julia
using Pkg
Pkg.test("InfrastructureTimeSeriesOpenAPIModels")
```

## License

BSD 3-Clause. See [LICENSE](LICENSE).
