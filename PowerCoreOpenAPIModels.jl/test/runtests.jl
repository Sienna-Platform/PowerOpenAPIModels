using PowerCoreOpenAPIModels
using InfrastructureCoreOpenAPIModels
using JSON
using OpenAPI
using Test

const PC = PowerCoreOpenAPIModels
const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

@testset "PowerCoreOpenAPIModels" begin
    @testset "a component round-trips through JSON" begin
        bus = ACBus(;
            id=1,
            number=1,
            name="bus1",
            available=true,
            bustype=ACBusType("REF"),
            base_voltage=138.0,
            voltage_limits=MinMax(; min=0.95, max=1.05),
        )
        text = JSON.json(encode(bus))
        back = decode(ACBus, JSON.parse(text))

        @test back.name == "bus1"
        @test back.base_voltage == 138.0
        @test string(back.bustype) == "REF"
        @test back.voltage_limits.max == 1.05
        # A nested model comes back as its own type, not as a Dict.
        @test back.voltage_limits isa MinMax
        @test JSON.json(encode(back)) == text
    end

    @testset "an enum wrapper rejects a value outside its schema" begin
        @test_throws ArgumentError ACBusType("SWING")
        @test_throws SchemaValidationError decode(ACBusType, "SWING")
        for value in ("PQ", "PV", "REF", "ISOLATED", "SLACK")
            @test string(ACBusType(value)) == value
        end
    end

    @testset "a oneOf wrapper keeps the variant the discriminator selected" begin
        curve = ValueCurve(
            InputOutputCurve(;
                function_data=InputOutputCurveFunctionData(
                    LinearFunctionData(; constant_term=0.0, proportional_term=25.0),
                ),
            ),
        )
        @test curve isa IC.OneOfAPIModel
        back = decode(ValueCurve, JSON.parse(JSON.json(encode(curve))))
        @test back.value isa InputOutputCurve
        @test back.value.function_data.value.proportional_term == 25.0
    end

    @testset "a fixed x-unit resolves from the type alone" begin
        @test has_declared_unit(ACBus, Val(:angle))
        @test declared_unit(ACBus, Val(:angle)) == "rad"
        @test declared_quantity(ACBus, Val(:angle)) == "Angle"
        @test declared_unit(ACBus, Val(:base_voltage)) == "kV"
        @test declared_quantity(ACBus, Val(:base_voltage)) == "Voltage"
        @test !has_declared_unit(ACBus, Val(:name))
    end

    @testset "x-unit-base names the sibling property a per-unit value is on" begin
        @test has_unit_base(ACBus, Val(:magnitude))
        @test unit_base(ACBus, Val(:magnitude)) == :base_voltage
        @test declared_unit(ACBus, Val(:magnitude)) == "pu"
        # `pu` is the one unit the vocabulary refuses to convert: it needs that base.
        @test !has_conversion_factor("Voltage", "pu")
    end

    @testset "a discriminated x-unit reads the instance" begin
        zone(units) = LoadZone(;
            id=1,
            name="zone1",
            peak_active_power=100.0,
            peak_reactive_power=50.0,
            base_power=100.0,
            power_units=UnitSystem(units),
        )
        # COMPONENT_BASE, not SYSTEM_BASE: the schemas carry no system-base option — data
        # per-unitized on a shared base records that base in the component's own
        # `base_power` and rides as COMPONENT_BASE.
        @test declared_unit(zone("COMPONENT_BASE"), Val(:peak_active_power)) == "pu"
        @test declared_unit(zone("NATURAL_UNITS"), Val(:peak_active_power)) == "MW"
        @test declared_quantity(zone("NATURAL_UNITS"), Val(:peak_active_power)) ==
              "ActivePower"
    end

    @testset "this package's types are registered under their bare names" begin
        for name in ("ACBus", "LoadZone", "Area", "CostCurve")
            @test IC.has_model_type(name)
            @test IC.model_type(name) === getfield(PC, Symbol(name))
        end
    end
end
