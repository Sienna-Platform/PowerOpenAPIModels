"""
    SCRX

This exciter is based on an IEEE type SCRX solid state exciter. The output field voltage is varied by a control system to maintain the system voltage at Vref. Please note that this exciter model has no initialization capabilities - this means that it will respond to whatever inputs it receives regardless of the state of the machine model

  - `efd_lim`: Field voltage regulator limits (regulator output)
  - `k`: Regulator gain
  - `ta_tb`: Lead input constant ratio
  - `tb`: Lag input constant
  - `te`: Regulator time constant
  - `v_ref`: Reference voltage set-point
  - `id`: Unique integer identifier for this component
  - `rc_rfd`: Field current capability. Set = 0 for negative current capability. Typical value 10
  - `switch`: Switch
"""
Base.@kwdef struct SCRX <: APIModel
    efd_lim::MinMax
    k::Float64
    ta_tb::Float64
    tb::Float64
    te::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    id::Int64
    rc_rfd::Float64
    switch::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SCRX}, value) = _decode(SCRX, value, true)
function _decode(::Type{SCRX}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/SCRX",
        ),
        _openapi_raw,
        "decoding SCRX";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SCRX")
    _openapi_field_efd_lim =
        _decode(MinMax, _required(_openapi_object, "Efd_lim", "SCRX"), _openapi_validate)
    _openapi_field_k =
        _decode(Float64, _required(_openapi_object, "K", "SCRX"), _openapi_validate)
    _openapi_field_ta_tb =
        _decode(Float64, _required(_openapi_object, "Ta_Tb", "SCRX"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "SCRX"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "SCRX"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SCRX"), _openapi_validate)
    _openapi_field_rc_rfd =
        _decode(Float64, _required(_openapi_object, "rc_rfd", "SCRX"), _openapi_validate)
    _openapi_field_switch =
        _decode(Int64, _required(_openapi_object, "switch", "SCRX"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("Efd_lim", "K", "Ta_Tb", "Tb", "Te", "V_ref", "id", "rc_rfd", "switch") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return SCRX(;
        efd_lim=_openapi_field_efd_lim,
        k=_openapi_field_k,
        ta_tb=_openapi_field_ta_tb,
        tb=_openapi_field_tb,
        te=_openapi_field_te,
        v_ref=_openapi_field_v_ref,
        id=_openapi_field_id,
        rc_rfd=_openapi_field_rc_rfd,
        switch=_openapi_field_switch,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::SCRX)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.efd_lim isa Absent ||
        (_openapi_output["Efd_lim"] = _encode(_openapi_value.efd_lim))
    _openapi_value.k isa Absent || (_openapi_output["K"] = _encode(_openapi_value.k))
    _openapi_value.ta_tb isa Absent ||
        (_openapi_output["Ta_Tb"] = _encode(_openapi_value.ta_tb))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.rc_rfd isa Absent ||
        (_openapi_output["rc_rfd"] = _encode(_openapi_value.rc_rfd))
    _openapi_value.switch isa Absent ||
        (_openapi_output["switch"] = _encode(_openapi_value.switch))
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
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/SCRX",
        ),
        _openapi_output,
        "encoding SCRX";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::SCRX)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.efd_lim isa Absent ||
        push!(_openapi_output, "Efd_lim" => _openapi_value.efd_lim)
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.ta_tb isa Absent ||
        push!(_openapi_output, "Ta_Tb" => _openapi_value.ta_tb)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.rc_rfd isa Absent ||
        push!(_openapi_output, "rc_rfd" => _openapi_value.rc_rfd)
    _openapi_value.switch isa Absent ||
        push!(_openapi_output, "switch" => _openapi_value.switch)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
