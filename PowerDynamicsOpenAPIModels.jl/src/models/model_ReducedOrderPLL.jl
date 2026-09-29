"""
    ReducedOrderPLL

Parameters of a Phase-Locked Loop (PLL) based on 'Reduced-order Structure-preserving Model for Parallel-connected Three-phase Grid-tied Inverters'

  - `omega_lp`: PLL low-pass filter frequency
  - `kp_pll`: PLL proportional gain
  - `ki_pll`: PLL integral gain
"""
Base.@kwdef struct ReducedOrderPLL <: APIModel
    omega_lp::Float64
    kp_pll::Float64
    ki_pll::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReducedOrderPLL}, value) = _decode(ReducedOrderPLL, value, true)
function _decode(::Type{ReducedOrderPLL}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c7faf1e8be3e819b3c1.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReducedOrderPLL";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReducedOrderPLL")
    _openapi_field_omega_lp =
        _decode(Float64, _required(_openapi_object, "omega_lp", "ReducedOrderPLL"), false)
    _openapi_field_kp_pll =
        _decode(Float64, _required(_openapi_object, "kp_pll", "ReducedOrderPLL"), false)
    _openapi_field_ki_pll =
        _decode(Float64, _required(_openapi_object, "ki_pll", "ReducedOrderPLL"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("omega_lp", "kp_pll", "ki_pll") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ReducedOrderPLL(;
        omega_lp=_openapi_field_omega_lp,
        kp_pll=_openapi_field_kp_pll,
        ki_pll=_openapi_field_ki_pll,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ReducedOrderPLL)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.omega_lp isa Absent ||
        (_openapi_output["omega_lp"] = _encode_unvalidated(_openapi_value.omega_lp))
    _openapi_value.kp_pll isa Absent ||
        (_openapi_output["kp_pll"] = _encode_unvalidated(_openapi_value.kp_pll))
    _openapi_value.ki_pll isa Absent ||
        (_openapi_output["ki_pll"] = _encode_unvalidated(_openapi_value.ki_pll))
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
_encode(_openapi_value::ReducedOrderPLL) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c7faf1e8be3e819b3c1.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ReducedOrderPLL";
    direction=:neutral,
)

function _form_fields(_openapi_value::ReducedOrderPLL)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.omega_lp isa Absent ||
        push!(_openapi_output, "omega_lp" => _openapi_value.omega_lp)
    _openapi_value.kp_pll isa Absent ||
        push!(_openapi_output, "kp_pll" => _openapi_value.kp_pll)
    _openapi_value.ki_pll isa Absent ||
        push!(_openapi_output, "ki_pll" => _openapi_value.ki_pll)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
