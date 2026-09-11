"""
    PowerLoad

A static power load, used in power flow and operational optimizations. Consumes a set amount of power via active_power or a max_active_power time series. See InterruptiblePowerLoad or StandardLoad for alternatives.

  - `active_power`: Initial steady-state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `available`: Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations.
  - `base_power`: Base power of the unit for per unitization. Units: MVA.
  - `bus`: ID of the bus that this component is connected to.
  - `conformity`: Indicates whether the specified load is conforming or non-conforming.
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
  - `id`: Unique integer identifier for this component.
  - `max_active_power`: Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `max_reactive_power`: Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `name`: Name of the component. Unique among components of the same type; components of different types may share a name.
  - `power_units`: Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit.
  - `reactive_power`: Initial steady-state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
"""
Base.@kwdef struct PowerLoad <: APIModel
    active_power::Float64
    available::Bool
    base_power::Float64
    bus::Int64
    conformity::Union{Absent, LoadConformity, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    id::Int64
    max_active_power::Float64
    max_reactive_power::Float64
    name::String
    power_units::UnitSystem
    reactive_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PowerLoad}, value) = _decode(PowerLoad, value, true)
function _decode(::Type{PowerLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/PowerLoad",
        ),
        _openapi_raw,
        "decoding PowerLoad";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PowerLoad")
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_field_bus =
        _decode(Int64, _required(_openapi_object, "bus", "PowerLoad"), _openapi_validate)
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
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PowerLoad"), _openapi_validate)
    _openapi_field_max_active_power = _decode(
        Float64,
        _required(_openapi_object, "max_active_power", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_field_max_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "max_reactive_power", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "PowerLoad"), _openapi_validate)
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "PowerLoad"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "active_power",
            "available",
            "base_power",
            "bus",
            "conformity",
            "dynamic_injector",
            "id",
            "max_active_power",
            "max_reactive_power",
            "name",
            "power_units",
            "reactive_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PowerLoad(;
        active_power=_openapi_field_active_power,
        available=_openapi_field_available,
        base_power=_openapi_field_base_power,
        bus=_openapi_field_bus,
        conformity=_openapi_field_conformity,
        dynamic_injector=_openapi_field_dynamic_injector,
        id=_openapi_field_id,
        max_active_power=_openapi_field_max_active_power,
        max_reactive_power=_openapi_field_max_reactive_power,
        name=_openapi_field_name,
        power_units=_openapi_field_power_units,
        reactive_power=_openapi_field_reactive_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PowerLoad)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.conformity isa Absent ||
        (_openapi_output["conformity"] = _encode(_openapi_value.conformity))
    _openapi_value.dynamic_injector isa Absent ||
        (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_active_power isa Absent ||
        (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.max_reactive_power isa Absent ||
        (_openapi_output["max_reactive_power"] = _encode(_openapi_value.max_reactive_power))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.reactive_power isa Absent ||
        (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/PowerLoad",
        ),
        _openapi_output,
        "encoding PowerLoad";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PowerLoad)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.conformity isa Absent ||
        push!(_openapi_output, "conformity" => _openapi_value.conformity)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_active_power isa Absent ||
        push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.max_reactive_power isa Absent ||
        push!(_openapi_output, "max_reactive_power" => _openapi_value.max_reactive_power)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
