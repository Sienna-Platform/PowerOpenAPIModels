"""
    ESAC8B

Excitation System AC8B. Used to represent the Basler Digital Excitation Control System (DECS) with PID controller in PSSE

  - `e_sat`: Exciter output voltage for saturation factor
  - `ka`: Regulator output gain
  - `kd`: Regulator derivative PID gain
  - `ke`: Exciter field proportional constant
  - `ki`: Regulator integral PID gain
  - `kp`: Regulator proportional PID gain
  - `se`: Exciter saturation factor at exciter output voltage
  - `ta`: Regulator output lag time constant
  - `td`: Regulator derivative PID time constant
  - `te`: Exciter field time constant
  - `tr`: Regulator input filter time constant
  - `v_ref`: Reference voltage set-point
  - `vr_lim`: Limits for excitor field voltage
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct ESAC8B <: APIModel
    e_sat::Vector{Float64}
    ka::Float64
    kd::Float64
    ke::Float64
    ki::Float64
    kp::Float64
    se::Vector{Float64}
    ta::Float64
    td::Float64
    te::Float64
    tr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    vr_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ESAC8B}, value) = _decode(ESAC8B, value, true)
function _decode(::Type{ESAC8B}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/ESAC8B",
        ),
        _openapi_raw,
        "decoding ESAC8B";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ESAC8B")
    _openapi_field_e_sat = _decode(
        Vector{Float64},
        _required(_openapi_object, "E_sat", "ESAC8B"),
        _openapi_validate,
    )
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "ESAC8B"), _openapi_validate)
    _openapi_field_kd =
        _decode(Float64, _required(_openapi_object, "Kd", "ESAC8B"), _openapi_validate)
    _openapi_field_ke =
        _decode(Float64, _required(_openapi_object, "Ke", "ESAC8B"), _openapi_validate)
    _openapi_field_ki =
        _decode(Float64, _required(_openapi_object, "Ki", "ESAC8B"), _openapi_validate)
    _openapi_field_kp =
        _decode(Float64, _required(_openapi_object, "Kp", "ESAC8B"), _openapi_validate)
    _openapi_field_se = _decode(
        Vector{Float64},
        _required(_openapi_object, "Se", "ESAC8B"),
        _openapi_validate,
    )
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "ESAC8B"), _openapi_validate)
    _openapi_field_td =
        _decode(Float64, _required(_openapi_object, "Td", "ESAC8B"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "ESAC8B"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "ESAC8B"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ESAC8B"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ESAC8B"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "E_sat",
            "Ka",
            "Kd",
            "Ke",
            "Ki",
            "Kp",
            "Se",
            "Ta",
            "Td",
            "Te",
            "Tr",
            "V_ref",
            "Vr_lim",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ESAC8B(;
        e_sat=_openapi_field_e_sat,
        ka=_openapi_field_ka,
        kd=_openapi_field_kd,
        ke=_openapi_field_ke,
        ki=_openapi_field_ki,
        kp=_openapi_field_kp,
        se=_openapi_field_se,
        ta=_openapi_field_ta,
        td=_openapi_field_td,
        te=_openapi_field_te,
        tr=_openapi_field_tr,
        v_ref=_openapi_field_v_ref,
        vr_lim=_openapi_field_vr_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ESAC8B)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.e_sat isa Absent ||
        (_openapi_output["E_sat"] = _encode(_openapi_value.e_sat))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.kd isa Absent || (_openapi_output["Kd"] = _encode(_openapi_value.kd))
    _openapi_value.ke isa Absent || (_openapi_output["Ke"] = _encode(_openapi_value.ke))
    _openapi_value.ki isa Absent || (_openapi_output["Ki"] = _encode(_openapi_value.ki))
    _openapi_value.kp isa Absent || (_openapi_output["Kp"] = _encode(_openapi_value.kp))
    _openapi_value.se isa Absent || (_openapi_output["Se"] = _encode(_openapi_value.se))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.td isa Absent || (_openapi_output["Td"] = _encode(_openapi_value.td))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode(_openapi_value.vr_lim))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
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
            pointer="/components/schemas/ESAC8B",
        ),
        _openapi_output,
        "encoding ESAC8B";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ESAC8B)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.e_sat isa Absent ||
        push!(_openapi_output, "E_sat" => _openapi_value.e_sat)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.kd isa Absent || push!(_openapi_output, "Kd" => _openapi_value.kd)
    _openapi_value.ke isa Absent || push!(_openapi_output, "Ke" => _openapi_value.ke)
    _openapi_value.ki isa Absent || push!(_openapi_output, "Ki" => _openapi_value.ki)
    _openapi_value.kp isa Absent || push!(_openapi_output, "Kp" => _openapi_value.kp)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.td isa Absent || push!(_openapi_output, "Td" => _openapi_value.td)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
