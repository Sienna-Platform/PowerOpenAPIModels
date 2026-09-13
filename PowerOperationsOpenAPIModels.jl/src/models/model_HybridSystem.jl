"""
    HybridSystem

A hybrid system co-locating a thermal unit, electric load, storage, and/or renewable unit behind a single grid interconnection.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `status`: Operating state of the unit at the start of a simulation.
  - `bus`: ID of the bus that this component is connected to.
  - `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `base_power`: Base power of the unit for per unitization, which is commonly the same as `interconnection_rating`. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `operation_cost`: `MarketBidCost` of operating the hybrid system.
  - `thermal_unit`: ID of a thermal generator with supertype `ThermalGen`, if any.
  - `electric_load`: ID of a load with supertype `ElectricLoad`, if any.
  - `storage`: ID of an energy storage system with supertype `Storage`, if any.
  - `renewable_unit`: ID of a renewable generator with supertype `RenewableGen`, if any.
  - `interconnection_impedance`: Impedance between the hybrid system and the grid interconnection. Per-unit on `base_power`. Units: pu.
  - `interconnection_rating`: Maximum rating of the hybrid system's interconnection with the transmission network. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `input_active_power_limits`: Minimum and maximum stable input active power levels. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `output_active_power_limits`: Minimum and maximum stable output active power levels. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `interconnection_efficiency`: Efficiency [0, 1.0] at the grid interconnection to model losses `in` and `out` of the common DC-side conversion. Set to `null` if not applicable.
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct HybridSystem <: APIModel
    id::Int64
    name::String
    available::Bool
    status::OperationalStates
    bus::Int64
    active_power::Float64
    reactive_power::Float64
    base_power::Float64
    power_units::UnitSystem
    operation_cost::MarketBidCost
    thermal_unit::Union{Absent, Union{Int64, Nothing}} = ABSENT
    electric_load::Union{Absent, Union{Int64, Nothing}} = ABSENT
    storage::Union{Absent, Union{Int64, Nothing}} = ABSENT
    renewable_unit::Union{Absent, Union{Int64, Nothing}} = ABSENT
    interconnection_impedance::Union{Absent, ComplexNumber, Nothing} = ABSENT
    interconnection_rating::Union{Absent, Union{Float64, Nothing}} = ABSENT
    input_active_power_limits::Union{Absent, MinMax, Nothing} = ABSENT
    output_active_power_limits::Union{Absent, MinMax, Nothing} = ABSENT
    reactive_power_limits::Union{Absent, MinMax, Nothing} = ABSENT
    interconnection_efficiency::Union{Absent, InOut, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{HybridSystem}, value) = _decode(HybridSystem, value, true)
function _decode(::Type{HybridSystem}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-839f2fbff006d938d3d2.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding HybridSystem";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "HybridSystem")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "HybridSystem"), _openapi_validate)
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_status = _decode(
        OperationalStates,
        _required(_openapi_object, "status", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_bus =
        _decode(Int64, _required(_openapi_object, "bus", "HybridSystem"), _openapi_validate)
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_operation_cost = _decode(
        MarketBidCost,
        _required(_openapi_object, "operation_cost", "HybridSystem"),
        _openapi_validate,
    )
    _openapi_field_thermal_unit =
        haskey(_openapi_object, "thermal_unit") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["thermal_unit"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_electric_load =
        haskey(_openapi_object, "electric_load") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["electric_load"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_storage =
        haskey(_openapi_object, "storage") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["storage"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_renewable_unit =
        haskey(_openapi_object, "renewable_unit") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["renewable_unit"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_interconnection_impedance =
        haskey(_openapi_object, "interconnection_impedance") ?
        _decode(
            Union{Absent, ComplexNumber, Nothing},
            _openapi_object["interconnection_impedance"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_interconnection_rating =
        haskey(_openapi_object, "interconnection_rating") ?
        _decode(
            Union{Absent, Union{Float64, Nothing}},
            _openapi_object["interconnection_rating"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_input_active_power_limits =
        haskey(_openapi_object, "input_active_power_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["input_active_power_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_output_active_power_limits =
        haskey(_openapi_object, "output_active_power_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["output_active_power_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_reactive_power_limits =
        haskey(_openapi_object, "reactive_power_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["reactive_power_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_interconnection_efficiency =
        haskey(_openapi_object, "interconnection_efficiency") ?
        _decode(
            Union{Absent, InOut, Nothing},
            _openapi_object["interconnection_efficiency"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_dynamic_injector =
        haskey(_openapi_object, "dynamic_injector") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["dynamic_injector"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "status",
            "bus",
            "active_power",
            "reactive_power",
            "base_power",
            "power_units",
            "operation_cost",
            "thermal_unit",
            "electric_load",
            "storage",
            "renewable_unit",
            "interconnection_impedance",
            "interconnection_rating",
            "input_active_power_limits",
            "output_active_power_limits",
            "reactive_power_limits",
            "interconnection_efficiency",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return HybridSystem(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        status=_openapi_field_status,
        bus=_openapi_field_bus,
        active_power=_openapi_field_active_power,
        reactive_power=_openapi_field_reactive_power,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        operation_cost=_openapi_field_operation_cost,
        thermal_unit=_openapi_field_thermal_unit,
        electric_load=_openapi_field_electric_load,
        storage=_openapi_field_storage,
        renewable_unit=_openapi_field_renewable_unit,
        interconnection_impedance=_openapi_field_interconnection_impedance,
        interconnection_rating=_openapi_field_interconnection_rating,
        input_active_power_limits=_openapi_field_input_active_power_limits,
        output_active_power_limits=_openapi_field_output_active_power_limits,
        reactive_power_limits=_openapi_field_reactive_power_limits,
        interconnection_efficiency=_openapi_field_interconnection_efficiency,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::HybridSystem)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.status isa Absent ||
        (_openapi_output["status"] = _encode(_openapi_value.status))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.reactive_power isa Absent ||
        (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.operation_cost isa Absent ||
        (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.thermal_unit isa Absent ||
        (_openapi_output["thermal_unit"] = _encode(_openapi_value.thermal_unit))
    _openapi_value.electric_load isa Absent ||
        (_openapi_output["electric_load"] = _encode(_openapi_value.electric_load))
    _openapi_value.storage isa Absent ||
        (_openapi_output["storage"] = _encode(_openapi_value.storage))
    _openapi_value.renewable_unit isa Absent ||
        (_openapi_output["renewable_unit"] = _encode(_openapi_value.renewable_unit))
    _openapi_value.interconnection_impedance isa Absent || (
        _openapi_output["interconnection_impedance"] =
            _encode(_openapi_value.interconnection_impedance)
    )
    _openapi_value.interconnection_rating isa Absent || (
        _openapi_output["interconnection_rating"] =
            _encode(_openapi_value.interconnection_rating)
    )
    _openapi_value.input_active_power_limits isa Absent || (
        _openapi_output["input_active_power_limits"] =
            _encode(_openapi_value.input_active_power_limits)
    )
    _openapi_value.output_active_power_limits isa Absent || (
        _openapi_output["output_active_power_limits"] =
            _encode(_openapi_value.output_active_power_limits)
    )
    _openapi_value.reactive_power_limits isa Absent || (
        _openapi_output["reactive_power_limits"] =
            _encode(_openapi_value.reactive_power_limits)
    )
    _openapi_value.interconnection_efficiency isa Absent || (
        _openapi_output["interconnection_efficiency"] =
            _encode(_openapi_value.interconnection_efficiency)
    )
    _openapi_value.dynamic_injector isa Absent ||
        (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-839f2fbff006d938d3d2.json",
            pointer="",
        ),
        _openapi_output,
        "encoding HybridSystem";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::HybridSystem)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.status isa Absent ||
        push!(_openapi_output, "status" => _openapi_value.status)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.thermal_unit isa Absent ||
        push!(_openapi_output, "thermal_unit" => _openapi_value.thermal_unit)
    _openapi_value.electric_load isa Absent ||
        push!(_openapi_output, "electric_load" => _openapi_value.electric_load)
    _openapi_value.storage isa Absent ||
        push!(_openapi_output, "storage" => _openapi_value.storage)
    _openapi_value.renewable_unit isa Absent ||
        push!(_openapi_output, "renewable_unit" => _openapi_value.renewable_unit)
    _openapi_value.interconnection_impedance isa Absent || push!(
        _openapi_output,
        "interconnection_impedance" => _openapi_value.interconnection_impedance,
    )
    _openapi_value.interconnection_rating isa Absent || push!(
        _openapi_output,
        "interconnection_rating" => _openapi_value.interconnection_rating,
    )
    _openapi_value.input_active_power_limits isa Absent || push!(
        _openapi_output,
        "input_active_power_limits" => _openapi_value.input_active_power_limits,
    )
    _openapi_value.output_active_power_limits isa Absent || push!(
        _openapi_output,
        "output_active_power_limits" => _openapi_value.output_active_power_limits,
    )
    _openapi_value.reactive_power_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_limits" => _openapi_value.reactive_power_limits,
    )
    _openapi_value.interconnection_efficiency isa Absent || push!(
        _openapi_output,
        "interconnection_efficiency" => _openapi_value.interconnection_efficiency,
    )
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
