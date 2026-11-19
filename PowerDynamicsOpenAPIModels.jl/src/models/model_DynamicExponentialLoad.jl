"""
    DynamicExponentialLoad

Parameters of 2-states of a generic dynamic load model based on "Voltage stability analysis using generic dynamic load models." It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `a`: Active power static exponential coefficient
  - `b`: Reactive power static exponential coefficient
  - `alpha`: Active power transient exponential coefficient
  - `beta`: Reactive power transient exponential coefficient
  - `t_p`: Active Power Time Constant. Units: s.
  - `t_q`: Reactive Power Time Constant. Units: s.
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct DynamicExponentialLoad <: APIModel
    id::Int64
    name::String
    a::Float64
    b::Float64
    alpha::Float64
    beta::Float64
    t_p::Float64
    t_q::Float64
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DynamicExponentialLoad}, value) =
    _decode(DynamicExponentialLoad, value, true)
function _decode(::Type{DynamicExponentialLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1f6b2d33986e7b33a8ea.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DynamicExponentialLoad";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DynamicExponentialLoad")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_name = _decode_zoned(
        String,
        _required(_openapi_object, "name", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_a = _decode_zoned(
        Float64,
        _required(_openapi_object, "a", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_b = _decode_zoned(
        Float64,
        _required(_openapi_object, "b", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_alpha = _decode_zoned(
        Float64,
        _required(_openapi_object, "alpha", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_beta = _decode_zoned(
        Float64,
        _required(_openapi_object, "beta", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_t_p = _decode_zoned(
        Float64,
        _required(_openapi_object, "T_p", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_t_q = _decode_zoned(
        Float64,
        _required(_openapi_object, "T_q", "DynamicExponentialLoad"),
        false,
    )
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "DynamicExponentialLoad"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "a", "b", "alpha", "beta", "T_p", "T_q", "base_power") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return DynamicExponentialLoad(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        a=_openapi_field_a,
        b=_openapi_field_b,
        alpha=_openapi_field_alpha,
        beta=_openapi_field_beta,
        t_p=_openapi_field_t_p,
        t_q=_openapi_field_t_q,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DynamicExponentialLoad)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.a isa Absent ||
        (_openapi_output["a"] = _encode_unvalidated(_openapi_value.a))
    _openapi_value.b isa Absent ||
        (_openapi_output["b"] = _encode_unvalidated(_openapi_value.b))
    _openapi_value.alpha isa Absent ||
        (_openapi_output["alpha"] = _encode_unvalidated(_openapi_value.alpha))
    _openapi_value.beta isa Absent ||
        (_openapi_output["beta"] = _encode_unvalidated(_openapi_value.beta))
    _openapi_value.t_p isa Absent ||
        (_openapi_output["T_p"] = _encode_unvalidated(_openapi_value.t_p))
    _openapi_value.t_q isa Absent ||
        (_openapi_output["T_q"] = _encode_unvalidated(_openapi_value.t_q))
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
_encode(_openapi_value::DynamicExponentialLoad) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1f6b2d33986e7b33a8ea.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DynamicExponentialLoad";
    direction=:neutral,
)

function _form_fields(_openapi_value::DynamicExponentialLoad)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.a isa Absent || push!(_openapi_output, "a" => _openapi_value.a)
    _openapi_value.b isa Absent || push!(_openapi_output, "b" => _openapi_value.b)
    _openapi_value.alpha isa Absent ||
        push!(_openapi_output, "alpha" => _openapi_value.alpha)
    _openapi_value.beta isa Absent || push!(_openapi_output, "beta" => _openapi_value.beta)
    _openapi_value.t_p isa Absent || push!(_openapi_output, "T_p" => _openapi_value.t_p)
    _openapi_value.t_q isa Absent || push!(_openapi_output, "T_q" => _openapi_value.t_q)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
