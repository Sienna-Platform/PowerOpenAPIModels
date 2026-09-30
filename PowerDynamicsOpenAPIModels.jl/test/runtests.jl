using PowerDynamicsOpenAPIModels
using PowerCoreOpenAPIModels
using InfrastructureCoreOpenAPIModels
using JSON
using OpenAPI
using Test

const PD = PowerDynamicsOpenAPIModels
const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

@testset "PowerDynamicsOpenAPIModels" begin
    @testset "a dynamic component round-trips through JSON" begin
        exciter = SEXS(;
            id=1,
            ta_tb=0.1,
            tb=10.0,
            k=100.0,
            te=0.1,
            v_lim=MinMax(; min=0.0, max=5.0),
        )
        text = JSON.json(encode(exciter))
        back = decode(SEXS, JSON.parse(text))

        @test back.k == 100.0
        @test back.v_lim isa MinMax
        @test back.v_lim.max == 5.0
        # An optional left unset stays out of the document.
        @test !haskey(JSON.parse(text), "v_ref")
        @test JSON.json(encode(back)) == text
    end

    @testset "an array-valued field keeps its element type" begin
        machine = RoundRotorMachine(;
            id=1,
            r=0.0,
            td0_p=8.0,
            td0_pp=0.03,
            tq0_p=0.4,
            tq0_pp=0.05,
            xd=1.8,
            xq=1.7,
            xd_p=0.3,
            xq_p=0.55,
            xd_pp=0.25,
            xl=0.2,
            se=[0.0, 0.0],
            gamma_d1=0.1,
            gamma_q1=0.1,
            gamma_d2=0.1,
            gamma_q2=0.1,
            gamma_qd=0.1,
        )
        back = decode(RoundRotorMachine, JSON.parse(JSON.json(encode(machine))))
        @test back.se == [0.0, 0.0]
        @test eltype(back.se) === Float64
    end

    @testset "decoding enforces required fields" begin
        @test_throws SchemaValidationError decode(SEXS, Dict{String, Any}("id" => 1))
    end

    @testset "x-unit annotations resolve for this package's types" begin
        @test declared_unit(SEXS, Val(:te)) == "s"
        @test declared_quantity(SEXS, Val(:te)) == "Duration"
        @test !has_declared_unit(SEXS, Val(:k))
    end

    @testset "this package's types are registered under their bare names" begin
        for name in ("SEXS", "RoundRotorMachine", "SteamTurbineGov1")
            @test IC.has_model_type(name)
            @test IC.model_type(name) === getfield(PD, Symbol(name))
        end
    end
end
