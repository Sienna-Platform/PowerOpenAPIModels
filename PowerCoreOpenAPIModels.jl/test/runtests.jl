using PowerCoreOpenAPIModels
using InfrastructureCoreOpenAPIModels
using JSON
using OpenAPI
using Test

const PC = PowerCoreOpenAPIModels
const IC = InfrastructureCoreOpenAPIModels
const SchemaValidationError = OpenAPI.Runtime.SchemaValidationError

# The association writers read only `control_id` and `entity_id`, so this stands in for the
# Operations-layer VoltageControlAssociation, which this package cannot load.
struct VoltageControlRow
    control_id::Int64
    entity_id::Int64
end

function voltage_control_document()
    doc = PC.SystemDocument(; name="voltage control")
    PC.add_component!(
        doc,
        ACBus(;
            id=1,
            number=1,
            name="bus1",
            available=true,
            bustype=ACBusType("REF"),
            base_voltage=138.0,
        ),
    )
    geo_json = GeographicInfoGeoJson(;
        additional_properties=Dict{String, Any}(
            "type" => "Point",
            "coordinates" => [0.0, 0.0],
        ),
    )
    PC.add_supplemental_attribute!(doc, GeographicInfo(; id=2, geo_json=geo_json), 1)
    return doc
end

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

    @testset "a tagged wrapper with a primitive branch keeps both checks" begin
        @test decode(ThermalGenerationCostStartUp, 0.0).value === 0.0
        stages = Dict{String, Any}(
            "startup_stages_type" => "STAGES",
            "cold" => 3.0,
            "hot" => 1.0,
            "warm" => 2.0,
        )
        @test decode(ThermalGenerationCostStartUp, stages).value isa StartUpStages
        bad = merge(stages, Dict{String, Any}("cold" => "expensive"))
        err = try
            decode(ThermalGenerationCostStartUp, bad)
            nothing
        catch e
            e
        end
        @test err isa SchemaValidationError
        @test occursin("decoding ThermalGenerationCostStartUp", sprint(showerror, err))
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

    @testset "voltage control associations" begin
        doc = voltage_control_document()
        @test !haskey(PC.document_tree(doc), "voltage_control_associations")

        PC.add_voltage_control_association!(doc, VoltageControlRow(2, 1))
        @test length(doc.voltage_control_associations) == 1
        @test (2, 1) in doc.voltage_control_membership
        @test_throws IC.DocumentFormatError PC.add_voltage_control_association!(
            doc,
            VoltageControlRow(2, 1),
        )
        @test PC.validate_document(doc) === nothing
        @test length(PC.document_tree(doc)["voltage_control_associations"]) == 1

        # control_id must name a supplemental attribute, entity_id a component.
        swapped = voltage_control_document()
        push!(swapped.voltage_control_associations, VoltageControlRow(1, 2))
        @test_throws IC.DocumentFormatError PC.validate_document(swapped)
    end

    @testset "this package's types are registered under their bare names" begin
        for name in ("ACBus", "LoadZone", "Area", "CostCurve")
            @test IC.has_model_type(name)
            @test IC.model_type(name) === getfield(PC, Symbol(name))
        end
    end
end
