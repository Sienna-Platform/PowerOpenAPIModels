#!/usr/bin/env julia
# Basic validation: packages load, exports resolve, no duplicate type definitions, and the
# hand-written SystemDocument container still matches its schema.

using Pkg, Test

Pkg.develop([
    PackageSpec(path="InfrastructureCoreOpenAPIModels.jl"),
    PackageSpec(path="InfrastructureTimeSeriesOpenAPIModels.jl"),
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
    PackageSpec(path="PowerOpenAPIModels.jl"),
])

# A failed `using` throws, so loading the packages is itself the load check.
using InfrastructureCoreOpenAPIModels
using InfrastructureTimeSeriesOpenAPIModels
using PowerCoreOpenAPIModels
using PowerOperationsOpenAPIModels
using PowerInvestmentsOpenAPIModels
using PowerDynamicsOpenAPIModels
using PowerOpenAPIModels
using Dates
using TimeZones

@testset "No duplicate type definitions" begin
    pkgs = [
        InfrastructureCoreOpenAPIModels,
        InfrastructureTimeSeriesOpenAPIModels,
        PowerCoreOpenAPIModels,
        PowerOperationsOpenAPIModels,
        PowerInvestmentsOpenAPIModels,
        PowerDynamicsOpenAPIModels,
    ]
    seen = Dict{Symbol, Module}()
    duplicates = String[]
    for pkg in pkgs
        for name in names(pkg)
            isdefined(pkg, name) || continue
            val = getfield(pkg, name)
            (val isa Type && parentmodule(val) == pkg) || continue
            if haskey(seen, name)
                push!(duplicates, "$name in both $(seen[name]) and $pkg")
            end
            seen[name] = pkg
        end
    end
    @test isempty(duplicates)
end

# The check above catches one name claimed by two packages. It cannot see the other way a
# generated type gets duplicated: openapi-generator materializes an anonymous copy of a
# shared schema at every reference site it cannot resolve to a named component, then
# disambiguates the copies with a numeric suffix. Those copies are byte-identical to the
# original apart from the name, and they fragment the API -- a value deserialized at one
# field site cannot be passed where another site's copy is expected. The cure is an
# `inlineSchemaNameMappings` entry per copy in the SiennaSchemas generator config, so a
# `<Base><N>` type whose `<Base>` also exists means such an entry is missing.
#
# Keyed on the base existing, not on the suffix: `SteamTurbineGov1` is a real
# PowerSystems type name and must not be flagged.
_type_name(::Type{T}) where {T} = string(nameof(T))
_type_name(::Any) = ""

@testset "No unmapped inline schema aliases" begin
    pkgs = [
        InfrastructureCoreOpenAPIModels,
        InfrastructureTimeSeriesOpenAPIModels,
        PowerCoreOpenAPIModels,
        PowerOperationsOpenAPIModels,
        PowerInvestmentsOpenAPIModels,
        PowerDynamicsOpenAPIModels,
    ]
    defined = Set{String}()
    for pkg in pkgs
        for name in names(pkg)
            isdefined(pkg, name) || continue
            n = _type_name(getfield(pkg, name))
            if !isempty(n)
                push!(defined, n)
            end
        end
    end
    aliases = filter(defined) do n
        base = replace(n, r"\d+$" => "")
        base != n && base in defined
    end
    @test sort(collect(aliases)) == String[]
end

@testset "Infrastructure packages carry no power dependency" begin
    using TOML
    for pkg in ["InfrastructureCoreOpenAPIModels", "InfrastructureTimeSeriesOpenAPIModels"]
        deps = keys(TOML.parsefile(joinpath(pkg * ".jl", "Project.toml"))["deps"])
        power = filter(startswith("Power"), collect(deps))
        @test isempty(power)
    end
    # ACBusType and ThermalFuels are the canaries: power enums that must not be
    # reachable from the generic packages.
    for sym in [:ACBusType, :ThermalFuels]
        @test !isdefined(InfrastructureCoreOpenAPIModels, sym)
        @test !isdefined(InfrastructureTimeSeriesOpenAPIModels, sym)
    end
end

const SCHEMA_DIR =
    get(ENV, "SCHEMA_DIR", joinpath(dirname(@__DIR__), "..", "SiennaSchemas"))

# `SystemDocument` is the one type in these packages that is hand-written rather than
# generated, because openapi-generator cannot express typed heterogeneous `components`
# buckets. That makes it the one type that can silently drift from its schema, so the drift
# is asserted here instead.
@testset "SystemDocument matches its schema" begin
    schema_path = joinpath(SCHEMA_DIR, "Core", "SystemDocument.json")
    if !isfile(schema_path)
        @warn "SystemDocument.json not found; skipping drift check" schema_path
    else
        # InfrastructureCore already depends on JSON (document.jl needs JSON.lower), so read
        # the schema through it rather than making this harness carry its own dependency.
        schema = InfrastructureCoreOpenAPIModels.JSON.parsefile(schema_path)
        schema_fields = Set(keys(schema["properties"]))
        # `counter`, `component_types_by_id`, `service_membership`, and
        # `trading_hub_membership` are build-time scaffolding that is deliberately not
        # serialized.
        struct_fields = setdiff(
            Set(string.(fieldnames(PowerOpenAPIModels.SystemDocument))),
            Set([
                "counter",
                "component_types_by_id",
                "service_membership",
                "trading_hub_membership",
            ]),
        )

        @test isempty(setdiff(schema_fields, struct_fields))
        @test isempty(setdiff(struct_fields, schema_fields))

        # Every required field must be one the container always emits.
        emitted =
            Set(keys(PowerOpenAPIModels.document_tree(PowerOpenAPIModels.SystemDocument())))
        @test isempty(setdiff(Set(schema["required"]), emitted))
    end
end

@testset "SystemDocument round-trips" begin
    doc = PowerOpenAPIModels.SystemDocument(;
        name="validate",
        description="round-trip fixture",
        frequency=50.0,
    )
    bus_id = PowerOpenAPIModels.next_id!(doc)
    PowerOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id=bus_id,
            name="b1",
            number=1,
            bustype="REF",
            available=true,
        ),
    )
    PowerOpenAPIModels.set_ext!(doc, bus_id, Dict("Zone" => "1"))

    mktempdir() do dir
        path = joinpath(dir, "system.json")
        PowerOpenAPIModels.write_document(doc, path)
        back = PowerOpenAPIModels.read_document(path)

        @test PowerOpenAPIModels.get_name(back) == "validate"
        @test PowerOpenAPIModels.get_description(back) == "round-trip fixture"
        @test PowerOpenAPIModels.get_frequency(back) == 50.0
        # Buckets come back concretely typed, not as Vector{Any}.
        @test eltype(back.components["ACBus"]) === PowerOperationsOpenAPIModels.ACBus
        @test PowerOpenAPIModels.get_ext(back, bus_id)["Zone"] == "1"
        # Ids already handed out are not reissued after a read.
        @test PowerOpenAPIModels.next_id!(back) > bus_id
    end
end

@testset "_highest_id reserves ids from components" begin
    # Components carry ids that must be reserved when reading a document;
    # `_highest_id` must walk them or a read document's id counter under-reserves
    # and `next_id!` can mint a colliding id.
    doc = PowerOpenAPIModels.SystemDocument(;
        time_series_storage_file="fixture_time_series_storage.h5",
    )
    bus_id = PowerOpenAPIModels.next_id!(doc)
    PowerOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id=bus_id,
            name="b1",
            number=1,
            bustype="REF",
            available=true,
        ),
    )
    ts = InfrastructureTimeSeriesOpenAPIModels.SingleTimeSeries(;
        owner_id=bus_id,
        owner_type="ACBus",
        owner_category="Component",
        name="max_active_power",
        features=Dict{String, Any}(),
        uri="fixture_time_series_storage.h5",
        element_type="Float64",
        element_shape=Int64[],
        initial_timestamp=ZonedDateTime(DateTime(2024, 1, 1), tz"UTC"),
        resolution="PT1H",
        length=24,
    )
    PowerOpenAPIModels.add_time_series_association!(
        doc,
        InfrastructureTimeSeriesOpenAPIModels.TimeSeriesAssociation(ts),
    )

    mktempdir() do dir
        path = joinpath(dir, "system_ts.json")
        PowerOpenAPIModels.write_document(doc, path)
        back = PowerOpenAPIModels.read_document(path)
        @test PowerOpenAPIModels.next_id!(back) > bus_id
    end
end

@testset "SystemDocument reads a document with no ext key" begin
    # `ext` is optional in the schema (Core/SystemDocument.json's `required` list omits
    # it); a producer that mapped every field is allowed to omit the key entirely.
    doc = PowerOpenAPIModels.SystemDocument()
    bus_id = PowerOpenAPIModels.next_id!(doc)
    PowerOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id=bus_id,
            name="b1",
            number=1,
            bustype="REF",
            available=true,
        ),
    )
    raw = InfrastructureCoreOpenAPIModels.JSON.parse(
        InfrastructureCoreOpenAPIModels.JSON.json(PowerOpenAPIModels.document_tree(doc)),
    )
    delete!(raw, "ext")
    back = PowerOpenAPIModels.document_from_json(raw)
    @test isempty(PowerOpenAPIModels.get_ext(back, bus_id))
end

@testset "SystemDocument reads a document written before trading hubs" begin
    # Every document written before `trading_hub_associations` existed omits the key.
    # Reading one back is the whole reason the field is optional, so assert it directly
    # rather than trusting the schema's `required` list to stay correct.
    doc = PowerOpenAPIModels.SystemDocument()
    bus_id = PowerOpenAPIModels.next_id!(doc)
    PowerOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id=bus_id,
            name="b1",
            number=1,
            bustype="REF",
            available=true,
        ),
    )
    raw = InfrastructureCoreOpenAPIModels.JSON.parse(
        InfrastructureCoreOpenAPIModels.JSON.json(PowerOpenAPIModels.document_tree(doc)),
    )
    delete!(raw, "trading_hub_associations")
    back = PowerOpenAPIModels.document_from_json(raw)
    @test isempty(back.trading_hub_associations)
    @test isempty(back.trading_hub_membership)
    # The siblings stay required: omitting one is still malformed input.
    raw2 = InfrastructureCoreOpenAPIModels.JSON.parse(
        InfrastructureCoreOpenAPIModels.JSON.json(PowerOpenAPIModels.document_tree(doc)),
    )
    delete!(raw2, "service_associations")
    @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError PowerOpenAPIModels.document_from_json(
        raw2,
    )
end

@testset "SystemDocument rejects malformed input" begin
    @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError InfrastructureCoreOpenAPIModels.model_type(
        "NoSuchType",
    )

    # An unresolved reference must error rather than be dropped.
    doc = PowerOpenAPIModels.SystemDocument()
    bus_id = PowerOpenAPIModels.next_id!(doc)
    PowerOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id=bus_id,
            name="b1",
            number=1,
            bustype="REF",
            available=true,
        ),
    )
    push!(
        doc.supplemental_attribute_associations,
        InfrastructureCoreOpenAPIModels.SupplementalAttributeAssociation(;
            component_id=bus_id,
            component_type="ACBus",
            attribute_id=9999,
            attribute_type="OnlineReserve",
        ),
    )
    @test_throws InfrastructureCoreOpenAPIModels.DocumentFormatError PowerOpenAPIModels.validate_document(
        doc,
    )
end

@testset "every registered type is an APIModel" begin
    @test !isempty(InfrastructureCoreOpenAPIModels.MODEL_TYPES)
    for (name, T) in InfrastructureCoreOpenAPIModels.MODEL_TYPES
        @test T <: InfrastructureCoreOpenAPIModels.OpenAPI.APIModel
        @test string(nameof(T)) == name
    end
end

include("serde_fixture.jl")
