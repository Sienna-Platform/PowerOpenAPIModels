"""
    ActivePowerDroop

  - `id`: Unique integer identifier for this component
  - `rp`: Droop Gain
  - `active_power_filter_frequency`: Filter cutoff frequency, in natural units. Units: Hz.
  - `p_ref`: Reference Power Set-point (pu). Units: pu.
"""
Base.@kwdef struct ActivePowerDroop <: APIModel
    id::Int64
    rp::Float64
    active_power_filter_frequency::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ActivePowerDroop}, value) = _decode(ActivePowerDroop, value, true)
function _decode(::Type{ActivePowerDroop}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-9c87f0a98b94d8b3b7b5.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ActivePowerDroop";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ActivePowerDroop")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "ActivePowerDroop"), false)
    _openapi_field_rp =
        _decode_zoned(Float64, _required(_openapi_object, "Rp", "ActivePowerDroop"), false)
    _openapi_field_active_power_filter_frequency = _decode_zoned(
        Float64,
        _required(_openapi_object, "active_power_filter_frequency", "ActivePowerDroop"),
        false,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "Rp", "active_power_filter_frequency", "P_ref") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ActivePowerDroop(;
        id=_openapi_field_id,
        rp=_openapi_field_rp,
        active_power_filter_frequency=_openapi_field_active_power_filter_frequency,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ActivePowerDroop)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.rp isa Absent ||
        (_openapi_output["Rp"] = _encode_unvalidated(_openapi_value.rp))
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
_encode(_openapi_value::ActivePowerDroop) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-9c87f0a98b94d8b3b7b5.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ActivePowerDroop";
    direction=:neutral,
)

function _form_fields(_openapi_value::ActivePowerDroop)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.rp isa Absent || push!(_openapi_output, "Rp" => _openapi_value.rp)
    _openapi_value.active_power_filter_frequency isa Absent || push!(
        _openapi_output,
        "active_power_filter_frequency" => _openapi_value.active_power_filter_frequency,
    )
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
