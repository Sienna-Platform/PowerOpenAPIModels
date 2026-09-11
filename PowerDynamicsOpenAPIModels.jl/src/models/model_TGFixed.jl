"""
    TGFixed

Parameters of a fixed Turbine Governor that returns a fixed mechanical torque given by the product of P_ref*efficiency

  - `p_ref`: Reference power set-point
  - `efficiency`: Efficiency factor that multiplies P_ref
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct TGFixed <: APIModel
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    efficiency::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TGFixed}, value) = _decode(TGFixed, value, true)
function _decode(::Type{TGFixed}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/TGFixed",
        ),
        _openapi_raw,
        "decoding TGFixed";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TGFixed")
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_efficiency = _decode(
        Float64,
        _required(_openapi_object, "efficiency", "TGFixed"),
        _openapi_validate,
    )
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "TGFixed"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("P_ref", "efficiency", "id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return TGFixed(;
        p_ref=_openapi_field_p_ref,
        efficiency=_openapi_field_efficiency,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::TGFixed)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.efficiency isa Absent ||
        (_openapi_output["efficiency"] = _encode(_openapi_value.efficiency))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
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
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/TGFixed",
        ),
        _openapi_output,
        "encoding TGFixed";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::TGFixed)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.efficiency isa Absent ||
        push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
