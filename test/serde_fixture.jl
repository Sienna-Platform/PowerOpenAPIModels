#!/usr/bin/env julia
# Serde against real PowerFlowFileParser-emitted documents, vendored from SiennaSchemas as
# byte-identical copies (verified by sha256 at vendor time). Both fixtures are the same
# 14-bus operations-only case in the two document unit conventions; each has 119 components
# across 15 type buckets (observed on read, asserted below).

const SERDE_FIXTURE_DIR = joinpath(@__DIR__, "fixtures")
const SERDE_FIXTURE_COMPONENT_COUNT = 119
const SERDE_FIXTURES = (
    "NATURAL_UNITS" => "case14_operations.NATURAL_UNITS.json",
    "COMPONENT_BASE" => "case14_operations.COMPONENT_BASE.json",
)

@testset "serde fixture: $unit_system" for (unit_system, filename) in SERDE_FIXTURES
    path = joinpath(SERDE_FIXTURE_DIR, filename)

    # read_document calls validate_document internally, so a successful read already
    # certifies the document: ids unique, every reference resolvable.
    doc = PowerOpenAPIModels.read_document(path)

    @testset "component typing" begin
        total = 0
        for type_name in PowerOpenAPIModels.component_type_names(doc)
            components = PowerOpenAPIModels.get_components(doc, type_name)
            T = PowerCoreOpenAPIModels.model_type(type_name)
            @test T <: PowerCoreOpenAPIModels.OpenAPI.APIModel
            @test eltype(components) === T
            total += length(components)
        end
        @test total == SERDE_FIXTURE_COMPONENT_COUNT
    end

    @testset "value spot-checks" begin
        buses = PowerOpenAPIModels.get_components(doc, "ACBus")
        bus = only(filter(b -> b.id == 3, buses))
        @test bus.base_voltage == 138.0
        @test bus.bustype == "REF"

        thermals = PowerOpenAPIModels.get_components(doc, "ThermalStandard")
        @test length(thermals) == 7

        @test length(doc.supplemental_attribute_associations) == 9
    end

    @testset "round-trip" begin
        mktempdir() do dir
            reread = PowerOpenAPIModels.read_document(
                let temp_path = joinpath(dir, "roundtrip.json")
                    PowerOpenAPIModels.write_document(doc, temp_path)
                    temp_path
                end,
            )
            # The generated model structs are mutable with no custom `==`, so struct
            # equality is identity, not value equality. Compare through the JSON tree
            # instead, matching the idiom validate.jl already uses for this purpose.
            as_json(d) = PowerCoreOpenAPIModels.JSON.parse(
                PowerCoreOpenAPIModels.JSON.json(PowerOpenAPIModels.document_tree(d)),
            )
            @test as_json(doc) == as_json(reread)
        end
    end
end

@testset "COMPONENT_BASE actually converts from NATURAL_UNITS" begin
    # The two fixtures must differ in more than the `unit_system` tag. Nothing above reads
    # both at once, so a COMPONENT_BASE fixture that is a byte-identical copy of NATURAL_UNITS
    # would pass every test so far. Line.rating (ApparentPower, MVA, no per-field
    # unit-basis discriminator) is genuinely per-unit-on-own-base_power in COMPONENT_BASE:
    # assert that physical relationship directly, across every line, and that at least one
    # line actually differs numerically.
    natural = PowerOpenAPIModels.read_document(
        joinpath(SERDE_FIXTURE_DIR, "case14_operations.NATURAL_UNITS.json"),
    )
    device = PowerOpenAPIModels.read_document(
        joinpath(SERDE_FIXTURE_DIR, "case14_operations.COMPONENT_BASE.json"),
    )
    natural_lines =
        Dict(l.id => l for l in PowerOpenAPIModels.get_components(natural, "Line"))
    device_lines =
        Dict(l.id => l for l in PowerOpenAPIModels.get_components(device, "Line"))
    @test keys(natural_lines) == keys(device_lines)
    differed = 0
    for (id, nat) in natural_lines
        dev = device_lines[id]
        @test dev.rating ≈ nat.rating / nat.base_power
        if dev.rating != nat.rating
            differed += 1
        end
    end
    @test differed > 0
end
