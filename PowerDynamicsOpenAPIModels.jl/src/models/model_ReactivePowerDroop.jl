"""
    ReactivePowerDroop

  - `id`: Unique integer identifier for this component
  - `kq`: frequency droop gain
  - `reactive_power_filter_frequency`: Filter cutoff frequency, in natural units. Units: Hz.
  - `v_ref`: Reference Voltage Set-point (pu). Units: pu.
"""
Base.@kwdef struct ReactivePowerDroop <: APIModel
    id::Int64
    kq::Float64
    reactive_power_filter_frequency::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactivePowerDroop}, value) = _decode(ReactivePowerDroop, value, true)
function _decode(::Type{ReactivePowerDroop}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a487e4b5ab5e472d78f7.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactivePowerDroop";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactivePowerDroop")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "ReactivePowerDroop"), false)
    _openapi_field_kq = _decode_zoned(
        Float64,
        _required(_openapi_object, "kq", "ReactivePowerDroop"),
        false,
    )
    _openapi_field_reactive_power_filter_frequency = _decode_zoned(
        Float64,
        _required(_openapi_object, "reactive_power_filter_frequency", "ReactivePowerDroop"),
        false,
    )
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["V_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "kq", "reactive_power_filter_frequency", "V_ref") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ReactivePowerDroop(;
        id=_openapi_field_id,
        kq=_openapi_field_kq,
        reactive_power_filter_frequency=_openapi_field_reactive_power_filter_frequency,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ReactivePowerDroop)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.kq isa Absent ||
        (_openapi_output["kq"] = _encode_unvalidated(_openapi_value.kq))
    _openapi_value.reactive_power_filter_frequency isa Absent || (
        _openapi_output["reactive_power_filter_frequency"] =
            _encode_unvalidated(_openapi_value.reactive_power_filter_frequency)
    )
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode_unvalidated(_openapi_value.v_ref))
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
_encode(_openapi_value::ReactivePowerDroop) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-a487e4b5ab5e472d78f7.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ReactivePowerDroop";
    direction=:neutral,
)

function _form_fields(_openapi_value::ReactivePowerDroop)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.kq isa Absent || push!(_openapi_output, "kq" => _openapi_value.kq)
    _openapi_value.reactive_power_filter_frequency isa Absent || push!(
        _openapi_output,
        "reactive_power_filter_frequency" =>
            _openapi_value.reactive_power_filter_frequency,
    )
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
