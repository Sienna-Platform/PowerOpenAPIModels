"""
    EX4VSA

IEEE Excitation System for Voltage Security Assesment

  - `id`: Unique integer identifier for this component
  - `iflim`: OEL field current limit
  - `d`: OEL parameter d
  - `f`: OEL parameter f
  - `spar`: OEL parameter Spar
  - `k1`: OEL delay time constant
  - `k2`: OEL parameter K2
  - `oel_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `g`: AVR exciter gain
  - `ta`: Numerator lead-lag (lead) time constant
  - `tb`: Denominator lead-lag (lag) time constant
  - `te`: Exciter time constant
  - `e_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct EX4VSA <: APIModel
    id::Int64
    iflim::Float64
    d::Float64
    f::Float64
    spar::Float64
    k1::Float64
    k2::Float64
    oel_lim::MinMax
    g::Float64
    ta::Float64
    tb::Float64
    te::Float64
    e_lim::MinMax
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EX4VSA}, value) = _decode(EX4VSA, value, true)
function _decode(::Type{EX4VSA}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-f8162736933636ce62e0.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding EX4VSA";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EX4VSA")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "EX4VSA"), _openapi_validate)
    _openapi_field_iflim =
        _decode(Float64, _required(_openapi_object, "Iflim", "EX4VSA"), _openapi_validate)
    _openapi_field_d =
        _decode(Float64, _required(_openapi_object, "d", "EX4VSA"), _openapi_validate)
    _openapi_field_f =
        _decode(Float64, _required(_openapi_object, "f", "EX4VSA"), _openapi_validate)
    _openapi_field_spar =
        _decode(Float64, _required(_openapi_object, "Spar", "EX4VSA"), _openapi_validate)
    _openapi_field_k1 =
        _decode(Float64, _required(_openapi_object, "K1", "EX4VSA"), _openapi_validate)
    _openapi_field_k2 =
        _decode(Float64, _required(_openapi_object, "K2", "EX4VSA"), _openapi_validate)
    _openapi_field_oel_lim =
        _decode(MinMax, _required(_openapi_object, "Oel_lim", "EX4VSA"), _openapi_validate)
    _openapi_field_g =
        _decode(Float64, _required(_openapi_object, "G", "EX4VSA"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "EX4VSA"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "EX4VSA"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "EX4VSA"), _openapi_validate)
    _openapi_field_e_lim =
        _decode(MinMax, _required(_openapi_object, "E_lim", "EX4VSA"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "Iflim",
            "d",
            "f",
            "Spar",
            "K1",
            "K2",
            "Oel_lim",
            "G",
            "Ta",
            "Tb",
            "Te",
            "E_lim",
            "V_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return EX4VSA(;
        id=_openapi_field_id,
        iflim=_openapi_field_iflim,
        d=_openapi_field_d,
        f=_openapi_field_f,
        spar=_openapi_field_spar,
        k1=_openapi_field_k1,
        k2=_openapi_field_k2,
        oel_lim=_openapi_field_oel_lim,
        g=_openapi_field_g,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        te=_openapi_field_te,
        e_lim=_openapi_field_e_lim,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::EX4VSA)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.iflim isa Absent ||
        (_openapi_output["Iflim"] = _encode(_openapi_value.iflim))
    _openapi_value.d isa Absent || (_openapi_output["d"] = _encode(_openapi_value.d))
    _openapi_value.f isa Absent || (_openapi_output["f"] = _encode(_openapi_value.f))
    _openapi_value.spar isa Absent ||
        (_openapi_output["Spar"] = _encode(_openapi_value.spar))
    _openapi_value.k1 isa Absent || (_openapi_output["K1"] = _encode(_openapi_value.k1))
    _openapi_value.k2 isa Absent || (_openapi_output["K2"] = _encode(_openapi_value.k2))
    _openapi_value.oel_lim isa Absent ||
        (_openapi_output["Oel_lim"] = _encode(_openapi_value.oel_lim))
    _openapi_value.g isa Absent || (_openapi_output["G"] = _encode(_openapi_value.g))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.e_lim isa Absent ||
        (_openapi_output["E_lim"] = _encode(_openapi_value.e_lim))
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
            resource="https://openapi.invalid/schema/external-f8162736933636ce62e0.json",
            pointer="",
        ),
        _openapi_output,
        "encoding EX4VSA";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::EX4VSA)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.iflim isa Absent ||
        push!(_openapi_output, "Iflim" => _openapi_value.iflim)
    _openapi_value.d isa Absent || push!(_openapi_output, "d" => _openapi_value.d)
    _openapi_value.f isa Absent || push!(_openapi_output, "f" => _openapi_value.f)
    _openapi_value.spar isa Absent || push!(_openapi_output, "Spar" => _openapi_value.spar)
    _openapi_value.k1 isa Absent || push!(_openapi_output, "K1" => _openapi_value.k1)
    _openapi_value.k2 isa Absent || push!(_openapi_output, "K2" => _openapi_value.k2)
    _openapi_value.oel_lim isa Absent ||
        push!(_openapi_output, "Oel_lim" => _openapi_value.oel_lim)
    _openapi_value.g isa Absent || push!(_openapi_output, "G" => _openapi_value.g)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.e_lim isa Absent ||
        push!(_openapi_output, "E_lim" => _openapi_value.e_lim)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
