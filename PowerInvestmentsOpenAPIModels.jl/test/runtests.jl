using PowerInvestmentsOpenAPIModels
using PowerCoreOpenAPIModels
using InfrastructureCoreOpenAPIModels
using JSON
using OpenAPI
using Test

const PI = PowerInvestmentsOpenAPIModels
const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

@testset "PowerInvestmentsOpenAPIModels" begin
    @testset "a technology round-trips through JSON" begin
        requirement = MaximumCapacityRequirements(;
            id=1,
            name="cap_req",
            available=true,
            target_year=2035,
            max_capacity_mw=500.0,
        )
        text = JSON.json(encode(requirement))
        back = decode(MaximumCapacityRequirements, JSON.parse(text))

        @test back.name == "cap_req"
        @test back.target_year == 2035
        @test back.max_capacity_mw == 500.0
        @test JSON.json(encode(back)) == text
    end

    @testset "an association carries only the two ids it relates" begin
        assoc = RequirementAssociation(; requirement_id=1, entity_id=2)
        back = decode(RequirementAssociation, JSON.parse(JSON.json(encode(assoc))))
        @test back.requirement_id == 1
        @test back.entity_id == 2
    end

    @testset "decoding enforces required fields" begin
        @test_throws SchemaValidationError decode(
            RequirementAssociation,
            Dict{String, Any}("requirement_id" => 1),
        )
        @test_throws SchemaValidationError decode(
            MaximumCapacityRequirements,
            Dict{String, Any}("id" => 1, "name" => "cap_req"),
        )
    end

    @testset "x-unit annotations resolve for this package's types" begin
        @test has_declared_unit(CarbonCaps, Val(:max_mtons))
        @test declared_unit(CarbonCaps, Val(:max_mtons)) == "Mt"
        @test !has_declared_unit(RequirementAssociation, Val(:entity_id))
    end

    @testset "this package's types are registered under their bare names" begin
        for name in ("MaximumCapacityRequirements", "SupplyTechnology", "StorageTechnology")
            @test IC.has_model_type(name)
            @test IC.model_type(name) === getfield(PI, Symbol(name))
        end
    end
end
