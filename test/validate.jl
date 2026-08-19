#!/usr/bin/env julia
# Basic validation: packages load, exports resolve, no duplicate type definitions, and the
# hand-written SystemDocument container still matches its schema.

using Pkg, Test

Pkg.develop([
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
    PackageSpec(path="PowerTimeSeriesOpenAPIModels.jl"),
    PackageSpec(path="PowerOpenAPIModels.jl"),
])

# A failed `using` throws, so loading the packages is itself the load check.
using PowerCoreOpenAPIModels
using PowerOperationsOpenAPIModels
using PowerInvestmentsOpenAPIModels
using PowerDynamicsOpenAPIModels
using PowerTimeSeriesOpenAPIModels
using PowerOpenAPIModels

@testset "No duplicate type definitions" begin
    pkgs = [
        PowerCoreOpenAPIModels,
        PowerOperationsOpenAPIModels,
        PowerInvestmentsOpenAPIModels,
        PowerDynamicsOpenAPIModels,
        PowerTimeSeriesOpenAPIModels,
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
        # Core already depends on JSON (document.jl needs JSON.lower), so read the schema
        # through it rather than making this harness carry its own dependency.
        schema = PowerCoreOpenAPIModels.JSON.parsefile(schema_path)
        schema_fields = Set(keys(schema["properties"]))
        # `counter` is build-time scaffolding that is deliberately not serialized.
        struct_fields = setdiff(
            Set(string.(fieldnames(PowerOpenAPIModels.SystemDocument))),
            Set(["counter"]),
        )

        @test isempty(setdiff(schema_fields, struct_fields))
        @test isempty(setdiff(struct_fields, schema_fields))

        # Every required field must be one the container always emits.
        emitted = Set(
            keys(
                PowerOpenAPIModels.document_tree(PowerOpenAPIModels.SystemDocument(100.0)),
            ),
        )
        @test isempty(setdiff(Set(schema["required"]), emitted))
    end
end

@testset "SystemDocument round-trips" begin
    doc = PowerOpenAPIModels.SystemDocument(
        100.0;
        unit_system="COMPONENT_BASE",
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

        @test PowerOpenAPIModels.get_base_power(back) == 100.0
        @test PowerOpenAPIModels.get_unit_system(back) == "COMPONENT_BASE"
        @test PowerOpenAPIModels.uses_per_unit(back)
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

@testset "SystemDocument reads a document with no ext key" begin
    # `ext` is optional in the schema (Core/SystemDocument.json's `required` list omits
    # it); a producer that mapped every field is allowed to omit the key entirely.
    doc = PowerOpenAPIModels.SystemDocument(100.0)
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
    raw = PowerCoreOpenAPIModels.JSON.parse(
        PowerCoreOpenAPIModels.JSON.json(PowerOpenAPIModels.document_tree(doc)),
    )
    delete!(raw, "ext")
    back = PowerOpenAPIModels.document_from_json(raw)
    @test isempty(PowerOpenAPIModels.get_ext(back, bus_id))
end

@testset "SystemDocument rejects malformed input" begin
    @test_throws PowerCoreOpenAPIModels.DocumentFormatError PowerOpenAPIModels.SystemDocument(
        100.0;
        unit_system="SYSTEM_BASE",
    )
    @test_throws PowerCoreOpenAPIModels.DocumentFormatError PowerCoreOpenAPIModels.model_type(
        "NoSuchType",
    )

    # An unresolved reference must error rather than be dropped.
    doc = PowerOpenAPIModels.SystemDocument(100.0)
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
        PowerCoreOpenAPIModels.SupplementalAttributeAssociation(;
            attribute_id=9999,
            entity_id=bus_id,
            attribute_type="OnlineReserve",
        ),
    )
    @test_throws PowerCoreOpenAPIModels.DocumentFormatError PowerOpenAPIModels.validate_document(
        doc,
    )
end

@testset "every registered type is an APIModel" begin
    @test !isempty(PowerCoreOpenAPIModels.MODEL_TYPES)
    for (name, T) in PowerCoreOpenAPIModels.MODEL_TYPES
        @test T <: PowerCoreOpenAPIModels.OpenAPI.APIModel
        @test string(nameof(T)) == name
    end
end

include("serde_fixture.jl")
