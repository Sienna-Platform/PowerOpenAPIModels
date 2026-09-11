"""
    PSSSimple

Parameters of a PSS that returns a proportional droop voltage to add to the reference for the AVR

  - `k_omega`: Proportional gain for frequency
  - `k_p`: Proportional gain for active power
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct PSSSimple <: APIModel
    k_omega::Float64
    k_p::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PSSSimple}, value) = _decode(PSSSimple, value, true)
function _decode(::Type{PSSSimple}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/PSSSimple",
        ),
        _openapi_raw,
        "decoding PSSSimple";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PSSSimple")
    _openapi_field_k_omega = _decode(
        Float64,
        _required(_openapi_object, "K_omega", "PSSSimple"),
        _openapi_validate,
    )
    _openapi_field_k_p =
        _decode(Float64, _required(_openapi_object, "K_p", "PSSSimple"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PSSSimple"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("K_omega", "K_p", "id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PSSSimple(;
        k_omega=_openapi_field_k_omega,
        k_p=_openapi_field_k_p,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PSSSimple)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.k_omega isa Absent ||
        (_openapi_output["K_omega"] = _encode(_openapi_value.k_omega))
    _openapi_value.k_p isa Absent || (_openapi_output["K_p"] = _encode(_openapi_value.k_p))
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
            pointer="/components/schemas/PSSSimple",
        ),
        _openapi_output,
        "encoding PSSSimple";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PSSSimple)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.k_omega isa Absent ||
        push!(_openapi_output, "K_omega" => _openapi_value.k_omega)
    _openapi_value.k_p isa Absent || push!(_openapi_output, "K_p" => _openapi_value.k_p)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
