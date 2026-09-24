"""
    GasTG

Parameters of Gas Turbine-Governor. GAST in PSSE and GAST_PTI in PowerWorld

  - `id`: Unique integer identifier for this component
  - `r`: Speed droop parameter
  - `t1`: Governor time constant
  - `t2`: Combustion chamber time constant
  - `t3`: Load limit time constant (exhaust gas measurement time)
  - `at`: Ambient temperature load limit
  - `kt`: Load limit feedback gain
  - `v_lim`: Operational control limits on fuel valve opening (Vmin, Vmax)
  - `d_turb`: Speed damping coefficient of gas turbine rotor
  - `p_ref`: Reference load set-point
"""
Base.@kwdef struct GasTG <: APIModel
    id::Int64
    r::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    at::Float64
    kt::Float64
    v_lim::Vector{Float64}
    d_turb::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{GasTG}, value) = _decode(GasTG, value, true)
function _decode(::Type{GasTG}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-5e7047fb40d4ead187f3.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding GasTG";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "GasTG")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "GasTG"), _openapi_validate)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "R", "GasTG"), _openapi_validate)
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "GasTG"), _openapi_validate)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "GasTG"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "GasTG"), _openapi_validate)
    _openapi_field_at =
        _decode(Float64, _required(_openapi_object, "AT", "GasTG"), _openapi_validate)
    _openapi_field_kt =
        _decode(Float64, _required(_openapi_object, "Kt", "GasTG"), _openapi_validate)
    _openapi_field_v_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "V_lim", "GasTG"),
        _openapi_validate,
    )
    _openapi_field_d_turb =
        _decode(Float64, _required(_openapi_object, "D_turb", "GasTG"), _openapi_validate)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "R", "T1", "T2", "T3", "AT", "Kt", "V_lim", "D_turb", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return GasTG(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        at=_openapi_field_at,
        kt=_openapi_field_kt,
        v_lim=_openapi_field_v_lim,
        d_turb=_openapi_field_d_turb,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::GasTG)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.at isa Absent || (_openapi_output["AT"] = _encode(_openapi_value.at))
    _openapi_value.kt isa Absent || (_openapi_output["Kt"] = _encode(_openapi_value.kt))
    _openapi_value.v_lim isa Absent ||
        (_openapi_output["V_lim"] = _encode(_openapi_value.v_lim))
    _openapi_value.d_turb isa Absent ||
        (_openapi_output["D_turb"] = _encode(_openapi_value.d_turb))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
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
            resource="https://openapi.invalid/schema/external-5e7047fb40d4ead187f3.json",
            pointer="",
        ),
        _openapi_output,
        "encoding GasTG";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::GasTG)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.at isa Absent || push!(_openapi_output, "AT" => _openapi_value.at)
    _openapi_value.kt isa Absent || push!(_openapi_output, "Kt" => _openapi_value.kt)
    _openapi_value.v_lim isa Absent ||
        push!(_openapi_output, "V_lim" => _openapi_value.v_lim)
    _openapi_value.d_turb isa Absent ||
        push!(_openapi_output, "D_turb" => _openapi_value.d_turb)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
