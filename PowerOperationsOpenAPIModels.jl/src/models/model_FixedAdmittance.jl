"""
    FixedAdmittance

A fixed admittance.

Most often used in dynamics or AC power flow studies as a source of reactive power.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `admittance_units`: Unit basis for the shunt admittance Y. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage).
  - `y`: Fixed admittance. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr .
  - `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.
  - `dynamic_injector`: ID of the corresponding dynamic injection model for admittance, if any.
"""
Base.@kwdef struct FixedAdmittance <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    admittance_units::Union{Absent, Nothing, ShuntAdmittanceUnitBasis} = ABSENT
    y::ComplexNumber
    base_power::Float64
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FixedAdmittance}, value) = _decode(FixedAdmittance, value, true)
function _decode(::Type{FixedAdmittance}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-f46ff331d31f5b0044bf.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding FixedAdmittance";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FixedAdmittance")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "FixedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "FixedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "FixedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_bus = _decode(
        Int64,
        _required(_openapi_object, "bus", "FixedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_admittance_units =
        haskey(_openapi_object, "admittance_units") ?
        _decode(
            Union{Absent, Nothing, ShuntAdmittanceUnitBasis},
            _openapi_object["admittance_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_y = _decode(
        ComplexNumber,
        _required(_openapi_object, "Y", "FixedAdmittance"),
        _openapi_validate,
    )
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "FixedAdmittance"),
        _openapi_validate,
    )
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
            "admittance_units",
            "Y",
            "base_power",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return FixedAdmittance(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        admittance_units=_openapi_field_admittance_units,
        y=_openapi_field_y,
        base_power=_openapi_field_base_power,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::FixedAdmittance)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.admittance_units isa Absent ||
        (_openapi_output["admittance_units"] = _encode(_openapi_value.admittance_units))
    _openapi_value.y isa Absent || (_openapi_output["Y"] = _encode(_openapi_value.y))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
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
            resource="https://openapi.invalid/schema/external-f46ff331d31f5b0044bf.json",
            pointer="",
        ),
        _openapi_output,
        "encoding FixedAdmittance";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::FixedAdmittance)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.admittance_units isa Absent ||
        push!(_openapi_output, "admittance_units" => _openapi_value.admittance_units)
    _openapi_value.y isa Absent || push!(_openapi_output, "Y" => _openapi_value.y)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
