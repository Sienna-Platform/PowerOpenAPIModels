"""
    RenewableEnergyVoltageConverterTypeA

Parameters of a renewable energy generator/converter model, this model corresponds to REGCA1 in PSSE, but to be interfaced using a Voltage Source instead of a Current Source

  - `t_g`: Converter time constant. Units: s.
  - `rrpwr`: Low Voltage Power Logic (LVPL) ramp rate limit.
  - `brkpt`: LVPL characteristic voltage 2.
  - `zerox`: LVPL characteristic voltage 1.
  - `lvpl1`: LVPL gain.
  - `vo_lim`: Voltage limit for high voltage reactive current management.
  - `lv_pnts`: Voltage points for low voltage active current management
  - `io_lim`: Current limit for high voltage reactive current management (specified as a negative value).
  - `t_fltr`: Voltage filter time constant for low voltage active current management. Units: s.
  - `k_hv`: Overvoltage compensation gain used in the high voltage reactive current management.
  - `iqr_lims`: Limit on rate of change for reactive current
  - `accel`: Acceleration factor.
  - `lvpl_sw`: Low voltage power logic (LVPL) switch. (0: LVPL not present, 1: LVPL present).
  - `q_ref`: Initial condition of reactive power from power flow.
"""
Base.@kwdef struct RenewableEnergyVoltageConverterTypeA <: APIModel
    t_g::Float64
    rrpwr::Float64
    brkpt::Float64
    zerox::Float64
    lvpl1::Float64
    vo_lim::Float64
    lv_pnts::MinMax
    io_lim::Float64
    t_fltr::Float64
    k_hv::Float64
    iqr_lims::MinMax
    accel::Float64
    lvpl_sw::Int64
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RenewableEnergyVoltageConverterTypeA}, value) =
    _decode(RenewableEnergyVoltageConverterTypeA, value, true)
function _decode(
    ::Type{RenewableEnergyVoltageConverterTypeA},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-784597e35d91c0df3347.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RenewableEnergyVoltageConverterTypeA";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RenewableEnergyVoltageConverterTypeA")
    _openapi_field_t_g = _decode(
        Float64,
        _required(_openapi_object, "T_g", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_rrpwr = _decode(
        Float64,
        _required(_openapi_object, "Rrpwr", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_brkpt = _decode(
        Float64,
        _required(_openapi_object, "Brkpt", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_zerox = _decode(
        Float64,
        _required(_openapi_object, "Zerox", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_lvpl1 = _decode(
        Float64,
        _required(_openapi_object, "Lvpl1", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_vo_lim = _decode(
        Float64,
        _required(_openapi_object, "Vo_lim", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_lv_pnts = _decode(
        MinMax,
        _required(_openapi_object, "Lv_pnts", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_io_lim = _decode(
        Float64,
        _required(_openapi_object, "Io_lim", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_t_fltr = _decode(
        Float64,
        _required(_openapi_object, "T_fltr", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_k_hv = _decode(
        Float64,
        _required(_openapi_object, "K_hv", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_iqr_lims = _decode(
        MinMax,
        _required(_openapi_object, "Iqr_lims", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_accel = _decode(
        Float64,
        _required(_openapi_object, "Accel", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_lvpl_sw = _decode(
        Int64,
        _required(_openapi_object, "Lvpl_sw", "RenewableEnergyVoltageConverterTypeA"),
        false,
    )
    _openapi_field_q_ref =
        haskey(_openapi_object, "Q_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["Q_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "T_g",
            "Rrpwr",
            "Brkpt",
            "Zerox",
            "Lvpl1",
            "Vo_lim",
            "Lv_pnts",
            "Io_lim",
            "T_fltr",
            "K_hv",
            "Iqr_lims",
            "Accel",
            "Lvpl_sw",
            "Q_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return RenewableEnergyVoltageConverterTypeA(;
        t_g=_openapi_field_t_g,
        rrpwr=_openapi_field_rrpwr,
        brkpt=_openapi_field_brkpt,
        zerox=_openapi_field_zerox,
        lvpl1=_openapi_field_lvpl1,
        vo_lim=_openapi_field_vo_lim,
        lv_pnts=_openapi_field_lv_pnts,
        io_lim=_openapi_field_io_lim,
        t_fltr=_openapi_field_t_fltr,
        k_hv=_openapi_field_k_hv,
        iqr_lims=_openapi_field_iqr_lims,
        accel=_openapi_field_accel,
        lvpl_sw=_openapi_field_lvpl_sw,
        q_ref=_openapi_field_q_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::RenewableEnergyVoltageConverterTypeA)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.t_g isa Absent ||
        (_openapi_output["T_g"] = _encode_unvalidated(_openapi_value.t_g))
    _openapi_value.rrpwr isa Absent ||
        (_openapi_output["Rrpwr"] = _encode_unvalidated(_openapi_value.rrpwr))
    _openapi_value.brkpt isa Absent ||
        (_openapi_output["Brkpt"] = _encode_unvalidated(_openapi_value.brkpt))
    _openapi_value.zerox isa Absent ||
        (_openapi_output["Zerox"] = _encode_unvalidated(_openapi_value.zerox))
    _openapi_value.lvpl1 isa Absent ||
        (_openapi_output["Lvpl1"] = _encode_unvalidated(_openapi_value.lvpl1))
    _openapi_value.vo_lim isa Absent ||
        (_openapi_output["Vo_lim"] = _encode_unvalidated(_openapi_value.vo_lim))
    _openapi_value.lv_pnts isa Absent ||
        (_openapi_output["Lv_pnts"] = _encode_unvalidated(_openapi_value.lv_pnts))
    _openapi_value.io_lim isa Absent ||
        (_openapi_output["Io_lim"] = _encode_unvalidated(_openapi_value.io_lim))
    _openapi_value.t_fltr isa Absent ||
        (_openapi_output["T_fltr"] = _encode_unvalidated(_openapi_value.t_fltr))
    _openapi_value.k_hv isa Absent ||
        (_openapi_output["K_hv"] = _encode_unvalidated(_openapi_value.k_hv))
    _openapi_value.iqr_lims isa Absent ||
        (_openapi_output["Iqr_lims"] = _encode_unvalidated(_openapi_value.iqr_lims))
    _openapi_value.accel isa Absent ||
        (_openapi_output["Accel"] = _encode_unvalidated(_openapi_value.accel))
    _openapi_value.lvpl_sw isa Absent ||
        (_openapi_output["Lvpl_sw"] = _encode_unvalidated(_openapi_value.lvpl_sw))
    _openapi_value.q_ref isa Absent ||
        (_openapi_output["Q_ref"] = _encode_unvalidated(_openapi_value.q_ref))
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
_encode(_openapi_value::RenewableEnergyVoltageConverterTypeA) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-784597e35d91c0df3347.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding RenewableEnergyVoltageConverterTypeA";
    direction=:neutral,
)

function _form_fields(_openapi_value::RenewableEnergyVoltageConverterTypeA)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.t_g isa Absent || push!(_openapi_output, "T_g" => _openapi_value.t_g)
    _openapi_value.rrpwr isa Absent ||
        push!(_openapi_output, "Rrpwr" => _openapi_value.rrpwr)
    _openapi_value.brkpt isa Absent ||
        push!(_openapi_output, "Brkpt" => _openapi_value.brkpt)
    _openapi_value.zerox isa Absent ||
        push!(_openapi_output, "Zerox" => _openapi_value.zerox)
    _openapi_value.lvpl1 isa Absent ||
        push!(_openapi_output, "Lvpl1" => _openapi_value.lvpl1)
    _openapi_value.vo_lim isa Absent ||
        push!(_openapi_output, "Vo_lim" => _openapi_value.vo_lim)
    _openapi_value.lv_pnts isa Absent ||
        push!(_openapi_output, "Lv_pnts" => _openapi_value.lv_pnts)
    _openapi_value.io_lim isa Absent ||
        push!(_openapi_output, "Io_lim" => _openapi_value.io_lim)
    _openapi_value.t_fltr isa Absent ||
        push!(_openapi_output, "T_fltr" => _openapi_value.t_fltr)
    _openapi_value.k_hv isa Absent || push!(_openapi_output, "K_hv" => _openapi_value.k_hv)
    _openapi_value.iqr_lims isa Absent ||
        push!(_openapi_output, "Iqr_lims" => _openapi_value.iqr_lims)
    _openapi_value.accel isa Absent ||
        push!(_openapi_output, "Accel" => _openapi_value.accel)
    _openapi_value.lvpl_sw isa Absent ||
        push!(_openapi_output, "Lvpl_sw" => _openapi_value.lvpl_sw)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
