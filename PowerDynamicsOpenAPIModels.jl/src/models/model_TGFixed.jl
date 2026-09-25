"""
    TGFixed

Parameters of a fixed Turbine Governor that returns a fixed mechanical torque given by the product of P_ref*efficiency

  - `id`: Unique integer identifier for this component
  - `efficiency`: Efficiency factor that multiplies P_ref
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct TGFixed <: APIModel
    id::Int64
    efficiency::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TGFixed}, value) = _decode(TGFixed, value, true)
function _decode(::Type{TGFixed}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ddea2e1ac087126376b4.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TGFixed";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TGFixed")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TGFixed"), false)
    _openapi_field_efficiency =
        _decode(Float64, _required(_openapi_object, "efficiency", "TGFixed"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "efficiency", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TGFixed(;
        id=_openapi_field_id,
        efficiency=_openapi_field_efficiency,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TGFixed)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.efficiency isa Absent ||
        (_openapi_output["efficiency"] = _encode_unvalidated(_openapi_value.efficiency))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode_unvalidated(_openapi_value.p_ref))
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
_encode(_openapi_value::TGFixed) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ddea2e1ac087126376b4.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TGFixed";
    direction=:neutral,
)

function _form_fields(_openapi_value::TGFixed)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.efficiency isa Absent ||
        push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
