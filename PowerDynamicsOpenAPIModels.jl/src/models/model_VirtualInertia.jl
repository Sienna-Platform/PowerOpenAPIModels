"""
    VirtualInertia

  - `id`: Unique integer identifier for this component
  - `ta`: VSM inertia constant. Units: s.
  - `kd`: VSM damping constant
  - `k_frequency`: frequency droop gain
  - `p_ref`: Reference Power Set-point (pu). Units: pu.
"""
Base.@kwdef struct VirtualInertia <: APIModel
    id::Int64
    ta::Float64
    kd::Float64
    k_frequency::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VirtualInertia}, value) = _decode(VirtualInertia, value, true)
function _decode(::Type{VirtualInertia}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-deada64929c3dcfc2f3e.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VirtualInertia";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VirtualInertia")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "VirtualInertia"), false)
    _openapi_field_ta =
        _decode_zoned(Float64, _required(_openapi_object, "Ta", "VirtualInertia"), false)
    _openapi_field_kd =
        _decode_zoned(Float64, _required(_openapi_object, "kd", "VirtualInertia"), false)
    _openapi_field_k_frequency = _decode_zoned(
        Float64,
        _required(_openapi_object, "k_frequency", "VirtualInertia"),
        false,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "Ta", "kd", "k_frequency", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return VirtualInertia(;
        id=_openapi_field_id,
        ta=_openapi_field_ta,
        kd=_openapi_field_kd,
        k_frequency=_openapi_field_k_frequency,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::VirtualInertia)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.ta isa Absent ||
        (_openapi_output["Ta"] = _encode_unvalidated(_openapi_value.ta))
    _openapi_value.kd isa Absent ||
        (_openapi_output["kd"] = _encode_unvalidated(_openapi_value.kd))
    _openapi_value.k_frequency isa Absent ||
        (_openapi_output["k_frequency"] = _encode_unvalidated(_openapi_value.k_frequency))
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
_encode(_openapi_value::VirtualInertia) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-deada64929c3dcfc2f3e.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding VirtualInertia";
    direction=:neutral,
)

function _form_fields(_openapi_value::VirtualInertia)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.kd isa Absent || push!(_openapi_output, "kd" => _openapi_value.kd)
    _openapi_value.k_frequency isa Absent ||
        push!(_openapi_output, "k_frequency" => _openapi_value.k_frequency)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
