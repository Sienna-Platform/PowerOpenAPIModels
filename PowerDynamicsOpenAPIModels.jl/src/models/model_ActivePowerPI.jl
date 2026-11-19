"""
    ActivePowerPI

  - `id`: Unique integer identifier for this component
  - `kp_p`: Proportional Gain
  - `ki_p`: Integral Gain
  - `active_power_filter_frequency`: Filter cutoff frequency, in natural units. Units: Hz.
  - `p_ref`: Reference Power Set-point (pu). Units: pu.
"""
Base.@kwdef struct ActivePowerPI <: APIModel
    id::Int64
    kp_p::Float64
    ki_p::Float64
    active_power_filter_frequency::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ActivePowerPI}, value) = _decode(ActivePowerPI, value, true)
function _decode(::Type{ActivePowerPI}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-c5cd69cae61fa6c72299.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ActivePowerPI";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ActivePowerPI")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "ActivePowerPI"), false)
    _openapi_field_kp_p =
        _decode_zoned(Float64, _required(_openapi_object, "Kp_p", "ActivePowerPI"), false)
    _openapi_field_ki_p =
        _decode_zoned(Float64, _required(_openapi_object, "Ki_p", "ActivePowerPI"), false)
    _openapi_field_active_power_filter_frequency = _decode_zoned(
        Float64,
        _required(_openapi_object, "active_power_filter_frequency", "ActivePowerPI"),
        false,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "Kp_p", "Ki_p", "active_power_filter_frequency", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ActivePowerPI(;
        id=_openapi_field_id,
        kp_p=_openapi_field_kp_p,
        ki_p=_openapi_field_ki_p,
        active_power_filter_frequency=_openapi_field_active_power_filter_frequency,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ActivePowerPI)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.kp_p isa Absent ||
        (_openapi_output["Kp_p"] = _encode_unvalidated(_openapi_value.kp_p))
    _openapi_value.ki_p isa Absent ||
        (_openapi_output["Ki_p"] = _encode_unvalidated(_openapi_value.ki_p))
    _openapi_value.active_power_filter_frequency isa Absent || (
        _openapi_output["active_power_filter_frequency"] =
            _encode_unvalidated(_openapi_value.active_power_filter_frequency)
    )
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
_encode(_openapi_value::ActivePowerPI) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-c5cd69cae61fa6c72299.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ActivePowerPI";
    direction=:neutral,
)

function _form_fields(_openapi_value::ActivePowerPI)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.kp_p isa Absent || push!(_openapi_output, "Kp_p" => _openapi_value.kp_p)
    _openapi_value.ki_p isa Absent || push!(_openapi_output, "Ki_p" => _openapi_value.ki_p)
    _openapi_value.active_power_filter_frequency isa Absent || push!(
        _openapi_output,
        "active_power_filter_frequency" => _openapi_value.active_power_filter_frequency,
    )
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
