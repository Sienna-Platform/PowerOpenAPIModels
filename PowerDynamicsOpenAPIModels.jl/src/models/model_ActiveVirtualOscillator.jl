"""
    ActiveVirtualOscillator

  - `id`: Unique integer identifier for this component
  - `k1`: VOC Synchronization Gain
  - `psi`: Rotation angle of the controller
  - `p_ref`: Reference Power Set-point (pu). Units: pu.
"""
Base.@kwdef struct ActiveVirtualOscillator <: APIModel
    id::Int64
    k1::Float64
    psi::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ActiveVirtualOscillator}, value) =
    _decode(ActiveVirtualOscillator, value, true)
function _decode(::Type{ActiveVirtualOscillator}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-096b44a0e5b36ea4d30d.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ActiveVirtualOscillator";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ActiveVirtualOscillator")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "ActiveVirtualOscillator"),
        false,
    )
    _openapi_field_k1 = _decode_zoned(
        Float64,
        _required(_openapi_object, "k1", "ActiveVirtualOscillator"),
        false,
    )
    _openapi_field_psi = _decode_zoned(
        Float64,
        _required(_openapi_object, "psi", "ActiveVirtualOscillator"),
        false,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "k1", "psi", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ActiveVirtualOscillator(;
        id=_openapi_field_id,
        k1=_openapi_field_k1,
        psi=_openapi_field_psi,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ActiveVirtualOscillator)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.k1 isa Absent ||
        (_openapi_output["k1"] = _encode_unvalidated(_openapi_value.k1))
    _openapi_value.psi isa Absent ||
        (_openapi_output["psi"] = _encode_unvalidated(_openapi_value.psi))
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
_encode(_openapi_value::ActiveVirtualOscillator) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-096b44a0e5b36ea4d30d.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ActiveVirtualOscillator";
    direction=:neutral,
)

function _form_fields(_openapi_value::ActiveVirtualOscillator)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.k1 isa Absent || push!(_openapi_output, "k1" => _openapi_value.k1)
    _openapi_value.psi isa Absent || push!(_openapi_output, "psi" => _openapi_value.psi)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
