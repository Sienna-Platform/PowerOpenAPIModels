using PowerOperationsOpenAPIModels
using PowerCoreOpenAPIModels
using InfrastructureCoreOpenAPIModels
using JSON
using OpenAPI
using Test

const PO = PowerOperationsOpenAPIModels
const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

function line(; kwargs...)
    return Line(;
        id=1,
        name="line1",
        available=true,
        active_power_flow=0.0,
        reactive_power_flow=0.0,
        arc=2,
        r=0.01,
        x=0.1,
        base_power=100.0,
        power_units=UnitSystem("NATURAL_UNITS"),
        rating=250.0,
        angle_limits=MinMax(; min=-1.57, max=1.57),
        kwargs...,
    )
end

@testset "PowerOperationsOpenAPIModels" begin
    @testset "a component round-trips through JSON" begin
        text = JSON.json(encode(line(; b=FromTo(; from=0.0, to=0.0))))
        back = decode(Line, JSON.parse(text))

        @test back.name == "line1"
        @test back.rating == 250.0
        @test back.angle_limits isa MinMax
        @test back.b.from == 0.0
        @test string(back.power_units) == "NATURAL_UNITS"
        @test JSON.json(encode(back)) == text
    end

    @testset "decoding enforces required fields" begin
        raw = Dict{String, Any}(encode(line()))
        delete!(raw, "angle_limits")
        @test_throws SchemaValidationError decode(Line, raw)
    end

    @testset "a fixed x-unit resolves from the type alone" begin
        @test has_declared_unit(Line, Val(:base_power))
        @test declared_unit(Line, Val(:base_power)) == "MVA"
        @test declared_quantity(Line, Val(:base_power)) == "ApparentPower"
        @test declared_unit(Line, Val(:angle_limits)) == "rad"
        @test declared_unit(AGC, Val(:bias)) == "MW/Hz"
    end

    @testset "a discriminated x-unit reads the instance" begin
        # Impedance rides on `parameter_units`, which is independent of the component's
        # `power_units`: a line can carry natural-unit flows and per-unit impedance.
        @test declared_unit(
            line(; parameter_units=ImpedanceUnitBasis("NATURAL_UNITS")),
            Val(:r),
        ) == "ohm"
        @test declared_unit(
            line(; parameter_units=ImpedanceUnitBasis("COMPONENT_BASE")),
            Val(:r),
        ) == "pu"
        @test declared_quantity(
            line(; parameter_units=ImpedanceUnitBasis("COMPONENT_BASE")),
            Val(:r),
        ) == "Resistance"
        # A flow field follows `power_units` instead.
        @test declared_unit(line(), Val(:active_power_flow)) == "MW"
    end

    @testset "the ambiguous unit m resolves to Elevation, not Length" begin
        @test declared_unit(HydroTurbine, Val(:powerhouse_elevation)) == "m"
        @test declared_quantity(HydroTurbine, Val(:powerhouse_elevation)) == "Elevation"
        @test declared_quantity(HydroReservoir, Val(:intake_elevation)) == "Elevation"
        @test conversion_factor("Elevation", "m") == 1.0
        @test conversion_factor("Length", "m") ≈ 0.001
    end

    @testset "an unannotated property falls through to the generic fallback" begin
        @test !has_declared_unit(Arc, Val(:from))
        @test !has_unit_base(Line, Val(:r))
    end

    @testset "this package's types are registered under their bare names" begin
        for name in ("Line", "ThermalStandard", "PowerLoad", "TransmissionInterface")
            @test IC.has_model_type(name)
            @test IC.model_type(name) === getfield(PO, Symbol(name))
        end
    end
end
