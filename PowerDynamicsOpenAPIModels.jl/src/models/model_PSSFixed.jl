"""
    PSSFixed

Parameters of a PSS that returns a fixed voltage to add to the reference for the AVR

  - `v_pss`: Fixed voltage stabilization signal
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct PSSFixed <: APIModel
    v_pss::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PSSFixed}, value) = _decode(PSSFixed, value, true)
function _decode(::Type{PSSFixed}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/PSSFixed",
        ),
        _openapi_raw,
        "decoding PSSFixed";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PSSFixed")
    _openapi_field_v_pss =
        _decode(Float64, _required(_openapi_object, "V_pss", "PSSFixed"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PSSFixed"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("V_pss", "id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PSSFixed(;
        v_pss=_openapi_field_v_pss,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PSSFixed)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.v_pss isa Absent ||
        (_openapi_output["V_pss"] = _encode(_openapi_value.v_pss))
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
            pointer="/components/schemas/PSSFixed",
        ),
        _openapi_output,
        "encoding PSSFixed";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PSSFixed)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.v_pss isa Absent ||
        push!(_openapi_output, "V_pss" => _openapi_value.v_pss)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
