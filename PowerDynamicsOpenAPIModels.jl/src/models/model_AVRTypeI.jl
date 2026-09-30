"""
    AVRTypeI

Parameters of an Automatic Voltage Regulator Type I - Resembles IEEE Type DC1

  - `id`: Unique integer identifier for this component
  - `ka`: Amplifier gain
  - `ke`: Field circuit integral deviation
  - `kf`: Stabilizer gain
  - `ta`: Amplifier time constant
  - `te`: Field circuit time constant
  - `tf`: Stabilizer time constant
  - `tr`: Voltage measurement time constant
  - `va_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `ae`: 1st ceiling coefficient
  - `be`: 2nd ceiling coefficient
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct AVRTypeI <: APIModel
    id::Int64
    ka::Float64
    ke::Float64
    kf::Float64
    ta::Float64
    te::Float64
    tf::Float64
    tr::Float64
    va_lim::MinMax
    ae::Float64
    be::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AVRTypeI}, value) = _decode(AVRTypeI, value, true)
function _decode(::Type{AVRTypeI}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-09b875ceef038b4351d9.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding AVRTypeI";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AVRTypeI")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "AVRTypeI"), _openapi_validate)
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "AVRTypeI"), _openapi_validate)
    _openapi_field_ke =
        _decode(Float64, _required(_openapi_object, "Ke", "AVRTypeI"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "AVRTypeI"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "AVRTypeI"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "AVRTypeI"), _openapi_validate)
    _openapi_field_tf =
        _decode(Float64, _required(_openapi_object, "Tf", "AVRTypeI"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "AVRTypeI"), _openapi_validate)
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "AVRTypeI"), _openapi_validate)
    _openapi_field_ae =
        _decode(Float64, _required(_openapi_object, "Ae", "AVRTypeI"), _openapi_validate)
    _openapi_field_be =
        _decode(Float64, _required(_openapi_object, "Be", "AVRTypeI"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "Ka", "Ke", "Kf", "Ta", "Te", "Tf", "Tr", "Va_lim", "Ae", "Be", "V_ref") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return AVRTypeI(;
        id=_openapi_field_id,
        ka=_openapi_field_ka,
        ke=_openapi_field_ke,
        kf=_openapi_field_kf,
        ta=_openapi_field_ta,
        te=_openapi_field_te,
        tf=_openapi_field_tf,
        tr=_openapi_field_tr,
        va_lim=_openapi_field_va_lim,
        ae=_openapi_field_ae,
        be=_openapi_field_be,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::AVRTypeI)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.ke isa Absent || (_openapi_output["Ke"] = _encode(_openapi_value.ke))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode(_openapi_value.va_lim))
    _openapi_value.ae isa Absent || (_openapi_output["Ae"] = _encode(_openapi_value.ae))
    _openapi_value.be isa Absent || (_openapi_output["Be"] = _encode(_openapi_value.be))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-09b875ceef038b4351d9.json",
            pointer="",
        ),
        _openapi_output,
        "encoding AVRTypeI";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::AVRTypeI)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.ke isa Absent || push!(_openapi_output, "Ke" => _openapi_value.ke)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.ae isa Absent || push!(_openapi_output, "Ae" => _openapi_value.ae)
    _openapi_value.be isa Absent || push!(_openapi_output, "Be" => _openapi_value.be)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
