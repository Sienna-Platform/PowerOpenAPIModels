# PowerInvestmentsOpenAPIModels.jl

The capacity-expansion domain: candidate technologies (`SupplyTechnology`,
`StorageTechnology`, `DemandSideTechnology`, the transport technologies), financial data
(`TechnologyFinancialData`, `PortfolioFinancialData`), policy requirements (carbon caps and
taxes, capacity reserve margins, energy-share and hourly-matching requirements), and the
`RequirementAssociation` rows that bind a requirement to the entities subject to it.

These are the types a `PortfolioDocument` is made of, the investment-side counterpart to the
operations `SystemDocument`.

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
Pkg.add("PowerInvestmentsOpenAPIModels")
```

## Usage

```julia
using PowerInvestmentsOpenAPIModels, JSON

requirement = MaximumCapacityRequirements(;
    id = 1,
    name = "cap_req",
    available = true,
    target_year = 2035,
    max_capacity_mw = 500.0,
)

text = JSON.json(encode(requirement))
back = decode(MaximumCapacityRequirements, JSON.parse(text))

back.target_year == 2035
```

A requirement applies to entities through an association row, which carries nothing but the
two ids it relates:

```julia
assoc = RequirementAssociation(; requirement_id = 1, entity_id = 2)
decode(RequirementAssociation, JSON.parse(JSON.json(encode(assoc))))
```

Assembling those rows into a validated portfolio — ids unique, every reference resolvable — is
`PortfolioDocument` in the umbrella
[`PowerOpenAPIModels`](https://github.com/Sienna-Platform/PowerOpenAPIModels/tree/main/PowerOpenAPIModels.jl)
package.

## Generated code

`src/` is generated — edit the schema in
[SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas) and regenerate, never the
Julia sources here.

## Testing

```julia
using Pkg
Pkg.test("PowerInvestmentsOpenAPIModels")
```

## License

BSD 3-Clause. See [LICENSE](LICENSE).
