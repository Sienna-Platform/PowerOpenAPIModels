"""
    InterruptiblePowerLoad

A static power load that can be compensated for temporary or continuous interruptions to its requested demand.

These loads are most commonly used for operational optimizations and can be used to model, for example, large commercial and industrial customers enrolled in demand response programs. This load has a target demand profile (set by a `max_active_power` time series for an operational simulation) that can be reduced to satisfy other system needs. For simpler loads without an operating cost for demand response, see `PowerLoad`.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `active_power`: Initial steady state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power`: Initial steady state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `max_active_power`: Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `max_reactive_power`: Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `base_power`: Base power of the unit for per unitization. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `operation_cost`: Operational cost of interrupting load. or MarketBidCost
  - `conformity`: Indicates whether the specified load is conforming or non-conforming.
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct InterruptiblePowerLoad <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    active_power::Float64
    reactive_power::Float64
    max_active_power::Float64
    max_reactive_power::Float64
    base_power::Float64
    power_units::UnitSystem
    operation_cost::InterruptiblePowerLoadOperationCost
    conformity::Union{Absent, LoadConformity, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{InterruptiblePowerLoad}, value) =
    _decode(InterruptiblePowerLoad, value, true)
function _decode(::Type{InterruptiblePowerLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-62260a7456b87d729232.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding InterruptiblePowerLoad";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "InterruptiblePowerLoad")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_bus = _decode(
        Int64,
        _required(_openapi_object, "bus", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_max_active_power = _decode(
        Float64,
        _required(_openapi_object, "max_active_power", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_max_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "max_reactive_power", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_operation_cost = _decode(
        InterruptiblePowerLoadOperationCost,
        _required(_openapi_object, "operation_cost", "InterruptiblePowerLoad"),
        _openapi_validate,
    )
    _openapi_field_conformity =
        haskey(_openapi_object, "conformity") ?
        _decode(
            Union{Absent, LoadConformity, Nothing},
            _openapi_object["conformity"],
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
            "bus",
            "active_power",
            "reactive_power",
            "max_active_power",
            "max_reactive_power",
            "base_power",
            "power_units",
            "operation_cost",
            "conformity",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return InterruptiblePowerLoad(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        active_power=_openapi_field_active_power,
        reactive_power=_openapi_field_reactive_power,
        max_active_power=_openapi_field_max_active_power,
        max_reactive_power=_openapi_field_max_reactive_power,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        operation_cost=_openapi_field_operation_cost,
        conformity=_openapi_field_conformity,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::InterruptiblePowerLoad)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.reactive_power isa Absent ||
        (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.max_active_power isa Absent ||
        (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.max_reactive_power isa Absent ||
        (_openapi_output["max_reactive_power"] = _encode(_openapi_value.max_reactive_power))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.operation_cost isa Absent ||
        (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.conformity isa Absent ||
        (_openapi_output["conformity"] = _encode(_openapi_value.conformity))
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
            resource="https://openapi.invalid/schema/external-62260a7456b87d729232.json",
            pointer="",
        ),
        _openapi_output,
        "encoding InterruptiblePowerLoad";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::InterruptiblePowerLoad)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.max_active_power isa Absent ||
        push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.max_reactive_power isa Absent ||
        push!(_openapi_output, "max_reactive_power" => _openapi_value.max_reactive_power)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.conformity isa Absent ||
        push!(_openapi_output, "conformity" => _openapi_value.conformity)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
