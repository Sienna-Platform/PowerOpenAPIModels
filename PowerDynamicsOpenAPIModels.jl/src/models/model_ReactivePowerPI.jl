"""
    ReactivePowerPI

  - `id`: Unique integer identifier for this component
  - `kp_q`: Proportional Gain
  - `ki_q`: Integral Gain
  - `reactive_power_filter_frequency`: Filter cutoff frequency, in natural units. Units: Hz.
  - `v_ref`: Voltage Set-point (pu). Units: pu.
  - `q_ref`: Reactive Power Set-point (pu). Units: pu.
"""
Base.@kwdef struct ReactivePowerPI <: APIModel
    id::Int64
    kp_q::Float64
    ki_q::Float64
    reactive_power_filter_frequency::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactivePowerPI}, value) = _decode(ReactivePowerPI, value, true)
function _decode(::Type{ReactivePowerPI}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-404873f42ad18141bdec.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactivePowerPI";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactivePowerPI")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "ReactivePowerPI"), false)
    _openapi_field_kp_q =
        _decode_zoned(Float64, _required(_openapi_object, "Kp_q", "ReactivePowerPI"), false)
    _openapi_field_ki_q =
        _decode_zoned(Float64, _required(_openapi_object, "Ki_q", "ReactivePowerPI"), false)
    _openapi_field_reactive_power_filter_frequency = _decode_zoned(
        Float64,
        _required(_openapi_object, "reactive_power_filter_frequency", "ReactivePowerPI"),
        false,
    )
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["V_ref"], false) :
        ABSENT
    _openapi_field_q_ref =
        haskey(_openapi_object, "Q_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["Q_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "Kp_q", "Ki_q", "reactive_power_filter_frequency", "V_ref", "Q_ref") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ReactivePowerPI(;
        id=_openapi_field_id,
        kp_q=_openapi_field_kp_q,
        ki_q=_openapi_field_ki_q,
        reactive_power_filter_frequency=_openapi_field_reactive_power_filter_frequency,
        v_ref=_openapi_field_v_ref,
        q_ref=_openapi_field_q_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ReactivePowerPI)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.kp_q isa Absent ||
        (_openapi_output["Kp_q"] = _encode_unvalidated(_openapi_value.kp_q))
    _openapi_value.ki_q isa Absent ||
        (_openapi_output["Ki_q"] = _encode_unvalidated(_openapi_value.ki_q))
    _openapi_value.reactive_power_filter_frequency isa Absent || (
        _openapi_output["reactive_power_filter_frequency"] =
            _encode_unvalidated(_openapi_value.reactive_power_filter_frequency)
    )
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode_unvalidated(_openapi_value.v_ref))
    _openapi_value.q_ref isa Absent ||
        (_openapi_output["Q_ref"] = _encode_unvalidated(_openapi_value.q_ref))
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
_encode(_openapi_value::ReactivePowerPI) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-404873f42ad18141bdec.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ReactivePowerPI";
    direction=:neutral,
)

function _form_fields(_openapi_value::ReactivePowerPI)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.kp_q isa Absent || push!(_openapi_output, "Kp_q" => _openapi_value.kp_q)
    _openapi_value.ki_q isa Absent || push!(_openapi_output, "Ki_q" => _openapi_value.ki_q)
    _openapi_value.reactive_power_filter_frequency isa Absent || push!(
        _openapi_output,
        "reactive_power_filter_frequency" =>
            _openapi_value.reactive_power_filter_frequency,
    )
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
