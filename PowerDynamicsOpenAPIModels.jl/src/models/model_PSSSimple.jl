"""
    PSSSimple

Parameters of a PSS that returns a proportional droop voltage to add to the reference for the AVR

  - `id`: Unique integer identifier for this component
  - `k_omega`: Proportional gain for frequency
  - `k_p`: Proportional gain for active power
"""
Base.@kwdef struct PSSSimple <: APIModel
    id::Int64
    k_omega::Float64
    k_p::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PSSSimple}, value) = _decode(PSSSimple, value, true)
function _decode(::Type{PSSSimple}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-adb2f0b4b581126ed724.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding PSSSimple";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PSSSimple")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "PSSSimple"), false)
    _openapi_field_k_omega =
        _decode(Float64, _required(_openapi_object, "K_omega", "PSSSimple"), false)
    _openapi_field_k_p =
        _decode(Float64, _required(_openapi_object, "K_p", "PSSSimple"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "K_omega", "K_p") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return PSSSimple(;
        id=_openapi_field_id,
        k_omega=_openapi_field_k_omega,
        k_p=_openapi_field_k_p,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::PSSSimple)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.k_omega isa Absent ||
        (_openapi_output["K_omega"] = _encode_unvalidated(_openapi_value.k_omega))
    _openapi_value.k_p isa Absent ||
        (_openapi_output["K_p"] = _encode_unvalidated(_openapi_value.k_p))
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
_encode(_openapi_value::PSSSimple) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-adb2f0b4b581126ed724.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding PSSSimple";
    direction=:neutral,
)

function _form_fields(_openapi_value::PSSSimple)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.k_omega isa Absent ||
        push!(_openapi_output, "K_omega" => _openapi_value.k_omega)
    _openapi_value.k_p isa Absent || push!(_openapi_output, "K_p" => _openapi_value.k_p)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
