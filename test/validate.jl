#!/usr/bin/env julia
# Basic validation: packages load, exports resolve, no duplicate type definitions, and the
# hand-written SystemDocument container still matches its schema.

using Pkg, Test

Pkg.develop([
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
    PackageSpec(path="PowerOpenAPIModels.jl"),
])

@testset "Packages load" begin
    @test (using PowerCoreOpenAPIModels; true)
    @test (using PowerOperationsOpenAPIModels; true)
    @test (using PowerInvestmentsOpenAPIModels; true)
    @test (using PowerDynamicsOpenAPIModels; true)
    @test (using PowerOpenAPIModels; true)
end

@testset "No duplicate type definitions" begin
    pkgs = [
        PowerCoreOpenAPIModels,
        PowerOperationsOpenAPIModels,
        PowerInvestmentsOpenAPIModels,
        PowerDynamicsOpenAPIModels,
    ]
    seen = Dict{Symbol, Module}()
    for pkg in pkgs
        for name in names(pkg)
            isdefined(pkg, name) || continue
            val = getfield(pkg, name)
            (val isa Type && parentmodule(val) == pkg) || continue
            if haskey(seen, name)
                error("Type $name defined in both $(seen[name]) and $pkg")
            end
            seen[name] = pkg
        end
    end
    @test true
end

const SCHEMA_DIR = get(ENV, "SCHEMA_DIR", joinpath(dirname(@__DIR__), "..", "SiennaSchemas"))

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
        struct_fields =
            setdiff(Set(string.(fieldnames(PowerCoreOpenAPIModels.SystemDocument))), Set(["counter"]))

        @test isempty(setdiff(schema_fields, struct_fields))
        @test isempty(setdiff(struct_fields, schema_fields))

        # Every required field must be one the container always emits.
        emitted = Set(keys(PowerCoreOpenAPIModels.document_tree(
            PowerCoreOpenAPIModels.SystemDocument(100.0),
        )))
        @test isempty(setdiff(Set(schema["required"]), emitted))
    end
end

@testset "SystemDocument round-trips" begin
    doc = PowerCoreOpenAPIModels.SystemDocument(
        100.0;
        unit_system = "DEVICE_BASE",
        name = "validate",
        description = "round-trip fixture",
        frequency = 50.0,
    )
    bus_id = PowerCoreOpenAPIModels.next_id!(doc)
    PowerCoreOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id = bus_id, name = "b1", number = 1, bustype = "REF", available = true,
        ),
    )
    PowerCoreOpenAPIModels.set_ext!(doc, bus_id, Dict("Zone" => "1"))

    mktempdir() do dir
        path = joinpath(dir, "system.json")
        PowerCoreOpenAPIModels.write_document(doc, path)
        back = PowerCoreOpenAPIModels.read_document(path)

        @test PowerCoreOpenAPIModels.get_base_power(back) == 100.0
        @test PowerCoreOpenAPIModels.get_unit_system(back) == "DEVICE_BASE"
        @test PowerCoreOpenAPIModels.uses_per_unit(back)
        @test PowerCoreOpenAPIModels.get_name(back) == "validate"
        @test PowerCoreOpenAPIModels.get_description(back) == "round-trip fixture"
        @test PowerCoreOpenAPIModels.get_frequency(back) == 50.0
        # Buckets come back concretely typed, not as Vector{Any}.
        @test eltype(back.components["ACBus"]) === PowerOperationsOpenAPIModels.ACBus
        @test PowerCoreOpenAPIModels.get_ext(back, bus_id)["Zone"] == "1"
        # Ids already handed out are not reissued after a read.
        @test PowerCoreOpenAPIModels.next_id!(back) > bus_id
    end
end

@testset "SystemDocument reads a document with no ext key" begin
    # `ext` is optional in the schema (Core/SystemDocument.json's `required` list omits
    # it); a producer that mapped every field is allowed to omit the key entirely.
    doc = PowerCoreOpenAPIModels.SystemDocument(100.0)
    bus_id = PowerCoreOpenAPIModels.next_id!(doc)
    PowerCoreOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id = bus_id, name = "b1", number = 1, bustype = "REF", available = true,
        ),
    )
    raw = PowerCoreOpenAPIModels.JSON.parse(
        PowerCoreOpenAPIModels.JSON.json(PowerCoreOpenAPIModels.document_tree(doc)),
    )
    delete!(raw, "ext")
    back = PowerCoreOpenAPIModels.document_from_json(raw)
    @test isempty(PowerCoreOpenAPIModels.get_ext(back, bus_id))
end

@testset "SystemDocument rejects malformed input" begin
    @test_throws PowerCoreOpenAPIModels.DocumentFormatError PowerCoreOpenAPIModels.SystemDocument(
        100.0; unit_system = "SYSTEM_BASE",
    )
    @test_throws PowerCoreOpenAPIModels.DocumentFormatError PowerCoreOpenAPIModels.model_type(
        "NoSuchType",
    )

    # An unresolved reference must error rather than be dropped.
    doc = PowerCoreOpenAPIModels.SystemDocument(100.0)
    bus_id = PowerCoreOpenAPIModels.next_id!(doc)
    PowerCoreOpenAPIModels.add_component!(
        doc,
        PowerOperationsOpenAPIModels.ACBus(;
            id = bus_id, name = "b1", number = 1, bustype = "REF", available = true,
        ),
    )
    push!(
        doc.supplemental_attribute_associations,
        PowerCoreOpenAPIModels.SupplementalAttributeAssociation(;
            attribute_id = 9999, entity_id = bus_id, attribute_type = "OnlineReserve",
        ),
    )
    @test_throws PowerCoreOpenAPIModels.DocumentFormatError PowerCoreOpenAPIModels.validate_document(
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
