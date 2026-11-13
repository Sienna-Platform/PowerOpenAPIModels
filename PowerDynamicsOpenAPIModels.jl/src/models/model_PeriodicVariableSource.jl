"""
    PeriodicVariableSource

This struct acts as an infinity bus with time varying phasor values magnitude and angle V(t) heta(t). Time varying functions are represented using fourier series It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `r_th`: Source Thevenin resistance
  - `x_th`: Source Thevenin reactance
  - `internal_voltage_bias`: a0 term of the Fourier Series for the voltage
  - `internal_voltage_frequencies`: Frequencies in radians/s
  - `internal_voltage_coefficients`: Coefficients for terms n > 1. First component corresponds to sin and second component to cos
  - `internal_angle_bias`: a0 term of the Fourier Series for the angle
  - `internal_angle_frequencies`: Frequencies in radians/s
  - `internal_angle_coefficients`: Coefficients for terms n > 1. First component corresponds to sin and second component to cos
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct PeriodicVariableSource <: APIModel
    id::Int64
    name::String
    r_th::Float64
    x_th::Float64
    internal_voltage_bias::Union{Absent, Float64, Nothing} = ABSENT
    internal_voltage_frequencies::Union{Absent, Nothing, Vector{Float64}} = ABSENT
    internal_voltage_coefficients::Union{Absent, Nothing, Vector{Vector{Float64}}} = ABSENT
    internal_angle_bias::Union{Absent, Float64, Nothing} = ABSENT
    internal_angle_frequencies::Union{Absent, Nothing, Vector{Float64}} = ABSENT
    internal_angle_coefficients::Union{Absent, Nothing, Vector{Vector{Float64}}} = ABSENT
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PeriodicVariableSource}, value) =
    _decode(PeriodicVariableSource, value, true)
function _decode(::Type{PeriodicVariableSource}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-61b0444fd456c40330cb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding PeriodicVariableSource";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PeriodicVariableSource")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "PeriodicVariableSource"),
        false,
    )
    _openapi_field_name = _decode_zoned(
        String,
        _required(_openapi_object, "name", "PeriodicVariableSource"),
        false,
    )
    _openapi_field_r_th = _decode_zoned(
        Float64,
        _required(_openapi_object, "R_th", "PeriodicVariableSource"),
        false,
    )
    _openapi_field_x_th = _decode_zoned(
        Float64,
        _required(_openapi_object, "X_th", "PeriodicVariableSource"),
        false,
    )
    _openapi_field_internal_voltage_bias =
        haskey(_openapi_object, "internal_voltage_bias") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["internal_voltage_bias"],
            false,
        ) : ABSENT
    _openapi_field_internal_voltage_frequencies =
        haskey(_openapi_object, "internal_voltage_frequencies") ?
        _decode_zoned(
            Union{Absent, Nothing, Vector{Float64}},
            _openapi_object["internal_voltage_frequencies"],
            false,
        ) : ABSENT
    _openapi_field_internal_voltage_coefficients =
        haskey(_openapi_object, "internal_voltage_coefficients") ?
        _decode_zoned(
            Union{Absent, Nothing, Vector{Vector{Float64}}},
            _openapi_object["internal_voltage_coefficients"],
            false,
        ) : ABSENT
    _openapi_field_internal_angle_bias =
        haskey(_openapi_object, "internal_angle_bias") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["internal_angle_bias"],
            false,
        ) : ABSENT
    _openapi_field_internal_angle_frequencies =
        haskey(_openapi_object, "internal_angle_frequencies") ?
        _decode_zoned(
            Union{Absent, Nothing, Vector{Float64}},
            _openapi_object["internal_angle_frequencies"],
            false,
        ) : ABSENT
    _openapi_field_internal_angle_coefficients =
        haskey(_openapi_object, "internal_angle_coefficients") ?
        _decode_zoned(
            Union{Absent, Nothing, Vector{Vector{Float64}}},
            _openapi_object["internal_angle_coefficients"],
            false,
        ) : ABSENT
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "PeriodicVariableSource"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "R_th",
            "X_th",
            "internal_voltage_bias",
            "internal_voltage_frequencies",
            "internal_voltage_coefficients",
            "internal_angle_bias",
            "internal_angle_frequencies",
            "internal_angle_coefficients",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return PeriodicVariableSource(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        r_th=_openapi_field_r_th,
        x_th=_openapi_field_x_th,
        internal_voltage_bias=_openapi_field_internal_voltage_bias,
        internal_voltage_frequencies=_openapi_field_internal_voltage_frequencies,
        internal_voltage_coefficients=_openapi_field_internal_voltage_coefficients,
        internal_angle_bias=_openapi_field_internal_angle_bias,
        internal_angle_frequencies=_openapi_field_internal_angle_frequencies,
        internal_angle_coefficients=_openapi_field_internal_angle_coefficients,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::PeriodicVariableSource)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.r_th isa Absent ||
        (_openapi_output["R_th"] = _encode_unvalidated(_openapi_value.r_th))
    _openapi_value.x_th isa Absent ||
        (_openapi_output["X_th"] = _encode_unvalidated(_openapi_value.x_th))
    _openapi_value.internal_voltage_bias isa Absent || (
        _openapi_output["internal_voltage_bias"] =
            _encode_unvalidated(_openapi_value.internal_voltage_bias)
    )
    _openapi_value.internal_voltage_frequencies isa Absent || (
        _openapi_output["internal_voltage_frequencies"] =
            _encode_unvalidated(_openapi_value.internal_voltage_frequencies)
    )
    _openapi_value.internal_voltage_coefficients isa Absent || (
        _openapi_output["internal_voltage_coefficients"] =
            _encode_unvalidated(_openapi_value.internal_voltage_coefficients)
    )
    _openapi_value.internal_angle_bias isa Absent || (
        _openapi_output["internal_angle_bias"] =
            _encode_unvalidated(_openapi_value.internal_angle_bias)
    )
    _openapi_value.internal_angle_frequencies isa Absent || (
        _openapi_output["internal_angle_frequencies"] =
            _encode_unvalidated(_openapi_value.internal_angle_frequencies)
    )
    _openapi_value.internal_angle_coefficients isa Absent || (
        _openapi_output["internal_angle_coefficients"] =
            _encode_unvalidated(_openapi_value.internal_angle_coefficients)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
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
_encode(_openapi_value::PeriodicVariableSource) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-61b0444fd456c40330cb.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding PeriodicVariableSource";
    direction=:neutral,
)

function _form_fields(_openapi_value::PeriodicVariableSource)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.r_th isa Absent || push!(_openapi_output, "R_th" => _openapi_value.r_th)
    _openapi_value.x_th isa Absent || push!(_openapi_output, "X_th" => _openapi_value.x_th)
    _openapi_value.internal_voltage_bias isa Absent || push!(
        _openapi_output,
        "internal_voltage_bias" => _openapi_value.internal_voltage_bias,
    )
    _openapi_value.internal_voltage_frequencies isa Absent || push!(
        _openapi_output,
        "internal_voltage_frequencies" => _openapi_value.internal_voltage_frequencies,
    )
    _openapi_value.internal_voltage_coefficients isa Absent || push!(
        _openapi_output,
        "internal_voltage_coefficients" => _openapi_value.internal_voltage_coefficients,
    )
    _openapi_value.internal_angle_bias isa Absent ||
        push!(_openapi_output, "internal_angle_bias" => _openapi_value.internal_angle_bias)
    _openapi_value.internal_angle_frequencies isa Absent || push!(
        _openapi_output,
        "internal_angle_frequencies" => _openapi_value.internal_angle_frequencies,
    )
    _openapi_value.internal_angle_coefficients isa Absent || push!(
        _openapi_output,
        "internal_angle_coefficients" => _openapi_value.internal_angle_coefficients,
    )
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
