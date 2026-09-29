"""
    CarbonCaps

Policy requirement limiting the amount of carbon produced in the target year. The limit can be given either as a total mass of CO2 or as the carbon intensity of the portfolio, in mass of CO2 per MWh of electricity.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `target_year`: Year in which this requirement is applied.
  - `max_tons_mwh`: Emission limit in terms of rate. Units: Mt/MWh.
  - `max_mtons`: Emission limit in absolute values (million tonnes). Units: Mt.
"""
Base.@kwdef struct CarbonCaps <: APIModel
    id::Int64
    name::String
    available::Bool
    target_year::Union{Absent, Int64, Nothing} = ABSENT
    max_tons_mwh::Union{Absent, Float64, Nothing} = ABSENT
    max_mtons::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CarbonCaps}, value) = _decode(CarbonCaps, value, true)
function _decode(::Type{CarbonCaps}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-e5a3fca4613cab2708aa.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding CarbonCaps";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CarbonCaps")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "CarbonCaps"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "CarbonCaps"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "CarbonCaps"), false)
    _openapi_field_target_year =
        haskey(_openapi_object, "target_year") ?
        _decode(Union{Absent, Int64, Nothing}, _openapi_object["target_year"], false) :
        ABSENT
    _openapi_field_max_tons_mwh =
        haskey(_openapi_object, "max_tons_mwh") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["max_tons_mwh"], false) :
        ABSENT
    _openapi_field_max_mtons =
        haskey(_openapi_object, "max_mtons") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["max_mtons"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "available", "target_year", "max_tons_mwh", "max_mtons") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return CarbonCaps(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        target_year=_openapi_field_target_year,
        max_tons_mwh=_openapi_field_max_tons_mwh,
        max_mtons=_openapi_field_max_mtons,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::CarbonCaps)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.target_year isa Absent ||
        (_openapi_output["target_year"] = _encode_unvalidated(_openapi_value.target_year))
    _openapi_value.max_tons_mwh isa Absent ||
        (_openapi_output["max_tons_mwh"] = _encode_unvalidated(_openapi_value.max_tons_mwh))
    _openapi_value.max_mtons isa Absent ||
        (_openapi_output["max_mtons"] = _encode_unvalidated(_openapi_value.max_mtons))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::CarbonCaps) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-e5a3fca4613cab2708aa.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding CarbonCaps";
    direction=:neutral,
)

function _form_fields(_openapi_value::CarbonCaps)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.target_year isa Absent ||
        push!(_openapi_output, "target_year" => _openapi_value.target_year)
    _openapi_value.max_tons_mwh isa Absent ||
        push!(_openapi_output, "max_tons_mwh" => _openapi_value.max_tons_mwh)
    _openapi_value.max_mtons isa Absent ||
        push!(_openapi_output, "max_mtons" => _openapi_value.max_mtons)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
