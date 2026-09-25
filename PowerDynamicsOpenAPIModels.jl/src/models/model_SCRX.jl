"""
    SCRX

This exciter is based on an IEEE type SCRX solid state exciter. The output field voltage is varied by a control system to maintain the system voltage at Vref. Please note that this exciter model has no initialization capabilities - this means that it will respond to whatever inputs it receives regardless of the state of the machine model

  - `id`: Unique integer identifier for this component
  - `ta_tb`: Lead input constant ratio
  - `tb`: Lag input constant
  - `k`: Regulator gain
  - `te`: Regulator time constant
  - `efd_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `switch`: Switch
  - `rc_rfd`: Field current capability. Set = 0 for negative current capability. Typical value 10
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct SCRX <: APIModel
    id::Int64
    ta_tb::Float64
    tb::Float64
    k::Float64
    te::Float64
    efd_lim::MinMax
    switch::Int64
    rc_rfd::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SCRX}, value) = _decode(SCRX, value, true)
function _decode(::Type{SCRX}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-4ae9c9987cab267a6001.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SCRX";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SCRX")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "SCRX"), false)
    _openapi_field_ta_tb =
        _decode(Float64, _required(_openapi_object, "Ta_Tb", "SCRX"), false)
    _openapi_field_tb = _decode(Float64, _required(_openapi_object, "Tb", "SCRX"), false)
    _openapi_field_k = _decode(Float64, _required(_openapi_object, "K", "SCRX"), false)
    _openapi_field_te = _decode(Float64, _required(_openapi_object, "Te", "SCRX"), false)
    _openapi_field_efd_lim =
        _decode(MinMax, _required(_openapi_object, "Efd_lim", "SCRX"), false)
    _openapi_field_switch =
        _decode(Int64, _required(_openapi_object, "switch", "SCRX"), false)
    _openapi_field_rc_rfd =
        _decode(Float64, _required(_openapi_object, "rc_rfd", "SCRX"), false)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["V_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "Ta_Tb", "Tb", "K", "Te", "Efd_lim", "switch", "rc_rfd", "V_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SCRX(;
        id=_openapi_field_id,
        ta_tb=_openapi_field_ta_tb,
        tb=_openapi_field_tb,
        k=_openapi_field_k,
        te=_openapi_field_te,
        efd_lim=_openapi_field_efd_lim,
        switch=_openapi_field_switch,
        rc_rfd=_openapi_field_rc_rfd,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SCRX)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.ta_tb isa Absent ||
        (_openapi_output["Ta_Tb"] = _encode_unvalidated(_openapi_value.ta_tb))
    _openapi_value.tb isa Absent ||
        (_openapi_output["Tb"] = _encode_unvalidated(_openapi_value.tb))
    _openapi_value.k isa Absent ||
        (_openapi_output["K"] = _encode_unvalidated(_openapi_value.k))
    _openapi_value.te isa Absent ||
        (_openapi_output["Te"] = _encode_unvalidated(_openapi_value.te))
    _openapi_value.efd_lim isa Absent ||
        (_openapi_output["Efd_lim"] = _encode_unvalidated(_openapi_value.efd_lim))
    _openapi_value.switch isa Absent ||
        (_openapi_output["switch"] = _encode_unvalidated(_openapi_value.switch))
    _openapi_value.rc_rfd isa Absent ||
        (_openapi_output["rc_rfd"] = _encode_unvalidated(_openapi_value.rc_rfd))
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
_encode(_openapi_value::SCRX) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-4ae9c9987cab267a6001.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SCRX";
    direction=:neutral,
)

function _form_fields(_openapi_value::SCRX)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.ta_tb isa Absent ||
        push!(_openapi_output, "Ta_Tb" => _openapi_value.ta_tb)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.efd_lim isa Absent ||
        push!(_openapi_output, "Efd_lim" => _openapi_value.efd_lim)
    _openapi_value.switch isa Absent ||
        push!(_openapi_output, "switch" => _openapi_value.switch)
    _openapi_value.rc_rfd isa Absent ||
        push!(_openapi_output, "rc_rfd" => _openapi_value.rc_rfd)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
