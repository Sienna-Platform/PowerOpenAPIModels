# InfrastructureCoreOpenAPIModels

Domain-neutral transport types shared by every other package in the family: function data,
value pairs, the association rows, and the `UnitSystem` enum. It also owns the pieces the
rest of the API is built from — the [`APIModel`](@ref) supertypes, [`encode`](@ref) and
[`decode`](@ref), the model-type registry, and the unit vocabulary.

It carries no power-system concept and no `Power*` dependency by design.

```@autodocs
Modules = [InfrastructureCoreOpenAPIModels]
```
