"""
    ReactivePowerSharing

Supplemental attribute grouping the setpoint voltage regulating devices that hold the voltage at one bus, so the reactive power required there can be split between them. The members' shares are their VoltageControlAssociation weights, each divided by the sum over the members in service (PSS/E RMPCT). The regulated bus is not stored: every member already resolves to the same bus. A bus regulated by two or more setpoint devices has exactly one sharing group containing all of them; a lone device has none.

  - `id`: Unique integer identifier for this supplemental attribute.
  - `name`: Name of the sharing group.
"""
Base.@kwdef struct ReactivePowerSharing <: APIModel
    id::Int64
    name::String
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactivePowerSharing}, value) = _decode(ReactivePowerSharing, value, true)
function _decode(::Type{ReactivePowerSharing}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-98fa379962a3800b714f.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactivePowerSharing";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactivePowerSharing")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "ReactivePowerSharing"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "ReactivePowerSharing"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "name") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactivePowerSharing(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ReactivePowerSharing)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
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
            resource="https://openapi.invalid/schema/external-98fa379962a3800b714f.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ReactivePowerSharing";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ReactivePowerSharing)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
