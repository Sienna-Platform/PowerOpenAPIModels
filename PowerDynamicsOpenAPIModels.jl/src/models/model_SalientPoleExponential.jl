"""
    SalientPoleExponential

3-states salient-pole synchronous machine with exponential saturation: IEEE Std 1110 §5.3.2 (Model 2.1). GENSAE in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `base_machine`: Salient pole machine parameters
  - `saturation_coeffs`: Derived saturation coefficients for the exponential saturation model, computed from the Se input
"""
Base.@kwdef struct SalientPoleExponential <: APIModel
    id::Int64
    base_machine::Int64
    saturation_coeffs::Vector{Float64}
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SalientPoleExponential}, value) =
    _decode(SalientPoleExponential, value, true)
function _decode(::Type{SalientPoleExponential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-5a5c5ccfbe2702c09c78.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SalientPoleExponential";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SalientPoleExponential")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SalientPoleExponential"), false)
    _openapi_field_base_machine = _decode(
        Int64,
        _required(_openapi_object, "base_machine", "SalientPoleExponential"),
        false,
    )
    _openapi_field_saturation_coeffs = _decode(
        Vector{Float64},
        _required(_openapi_object, "saturation_coeffs", "SalientPoleExponential"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "base_machine", "saturation_coeffs") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SalientPoleExponential(;
        id=_openapi_field_id,
        base_machine=_openapi_field_base_machine,
        saturation_coeffs=_openapi_field_saturation_coeffs,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SalientPoleExponential)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.base_machine isa Absent ||
        (_openapi_output["base_machine"] = _encode_unvalidated(_openapi_value.base_machine))
    _openapi_value.saturation_coeffs isa Absent || (
        _openapi_output["saturation_coeffs"] =
            _encode_unvalidated(_openapi_value.saturation_coeffs)
    )
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
_encode(_openapi_value::SalientPoleExponential) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-5a5c5ccfbe2702c09c78.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SalientPoleExponential";
    direction=:neutral,
)

function _form_fields(_openapi_value::SalientPoleExponential)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.base_machine isa Absent ||
        push!(_openapi_output, "base_machine" => _openapi_value.base_machine)
    _openapi_value.saturation_coeffs isa Absent ||
        push!(_openapi_output, "saturation_coeffs" => _openapi_value.saturation_coeffs)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
