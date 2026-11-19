"""
    ActiveConstantPowerLoad

Parameters of 12-states active power load based on the paper, "Dynamic Stability of a Microgrid With an Active Load." It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `r_load`: DC-side resistor
  - `c_dc`: DC-side capacitor
  - `rf`: Converter side filter resistance
  - `lf`: Converter side filter inductance
  - `cf`: AC Converter filter capacitance
  - `rg`: Network side filter resistance
  - `lg`: Network side filter inductance
  - `kp_pll`: Proportional constant for PI-PLL block
  - `ki_pll`: Integral constant for PI-PLL block
  - `kpv`: Proportional constant for Voltage Control block
  - `kiv`: Integral constant for Voltage Control block
  - `kpc`: Proportional constant for Current Control block
  - `kic`: Integral constant for Current Control block
  - `p_ref`: Reference active power (pu). Units: pu.
  - `q_ref`: Reference reactive power (pu). Units: pu.
  - `v_ref`: Reference voltage (pu). Units: pu.
  - `frequency_ref`: Reference frequency, in natural units. Usually equal to the system frequency. Units: Hz.
  - `is_filter_differential`: Boolean to decide if filter states are differential or algebraic
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct ActiveConstantPowerLoad <: APIModel
    id::Int64
    name::String
    r_load::Float64
    c_dc::Float64
    rf::Float64
    lf::Float64
    cf::Float64
    rg::Float64
    lg::Float64
    kp_pll::Float64
    ki_pll::Float64
    kpv::Float64
    kiv::Float64
    kpc::Float64
    kic::Float64
    p_ref::Float64
    q_ref::Float64
    v_ref::Float64
    frequency_ref::Float64
    is_filter_differential::Bool
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ActiveConstantPowerLoad}, value) =
    _decode(ActiveConstantPowerLoad, value, true)
function _decode(::Type{ActiveConstantPowerLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0b9ffcb7386daa8950ca.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ActiveConstantPowerLoad";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ActiveConstantPowerLoad")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_name = _decode_zoned(
        String,
        _required(_openapi_object, "name", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_r_load = _decode_zoned(
        Float64,
        _required(_openapi_object, "r_load", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_c_dc = _decode_zoned(
        Float64,
        _required(_openapi_object, "c_dc", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_rf = _decode_zoned(
        Float64,
        _required(_openapi_object, "rf", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_lf = _decode_zoned(
        Float64,
        _required(_openapi_object, "lf", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_cf = _decode_zoned(
        Float64,
        _required(_openapi_object, "cf", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_rg = _decode_zoned(
        Float64,
        _required(_openapi_object, "rg", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_lg = _decode_zoned(
        Float64,
        _required(_openapi_object, "lg", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_kp_pll = _decode_zoned(
        Float64,
        _required(_openapi_object, "kp_pll", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_ki_pll = _decode_zoned(
        Float64,
        _required(_openapi_object, "ki_pll", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_kpv = _decode_zoned(
        Float64,
        _required(_openapi_object, "kpv", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_kiv = _decode_zoned(
        Float64,
        _required(_openapi_object, "kiv", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_kpc = _decode_zoned(
        Float64,
        _required(_openapi_object, "kpc", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_kic = _decode_zoned(
        Float64,
        _required(_openapi_object, "kic", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_p_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "P_ref", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_q_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "Q_ref", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_v_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "V_ref", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_frequency_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "frequency_ref", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_is_filter_differential = _decode_zoned(
        Bool,
        _required(_openapi_object, "is_filter_differential", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "ActiveConstantPowerLoad"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "r_load",
            "c_dc",
            "rf",
            "lf",
            "cf",
            "rg",
            "lg",
            "kp_pll",
            "ki_pll",
            "kpv",
            "kiv",
            "kpc",
            "kic",
            "P_ref",
            "Q_ref",
            "V_ref",
            "frequency_ref",
            "is_filter_differential",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return ActiveConstantPowerLoad(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        r_load=_openapi_field_r_load,
        c_dc=_openapi_field_c_dc,
        rf=_openapi_field_rf,
        lf=_openapi_field_lf,
        cf=_openapi_field_cf,
        rg=_openapi_field_rg,
        lg=_openapi_field_lg,
        kp_pll=_openapi_field_kp_pll,
        ki_pll=_openapi_field_ki_pll,
        kpv=_openapi_field_kpv,
        kiv=_openapi_field_kiv,
        kpc=_openapi_field_kpc,
        kic=_openapi_field_kic,
        p_ref=_openapi_field_p_ref,
        q_ref=_openapi_field_q_ref,
        v_ref=_openapi_field_v_ref,
        frequency_ref=_openapi_field_frequency_ref,
        is_filter_differential=_openapi_field_is_filter_differential,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ActiveConstantPowerLoad)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.r_load isa Absent ||
        (_openapi_output["r_load"] = _encode_unvalidated(_openapi_value.r_load))
    _openapi_value.c_dc isa Absent ||
        (_openapi_output["c_dc"] = _encode_unvalidated(_openapi_value.c_dc))
    _openapi_value.rf isa Absent ||
        (_openapi_output["rf"] = _encode_unvalidated(_openapi_value.rf))
    _openapi_value.lf isa Absent ||
        (_openapi_output["lf"] = _encode_unvalidated(_openapi_value.lf))
    _openapi_value.cf isa Absent ||
        (_openapi_output["cf"] = _encode_unvalidated(_openapi_value.cf))
    _openapi_value.rg isa Absent ||
        (_openapi_output["rg"] = _encode_unvalidated(_openapi_value.rg))
    _openapi_value.lg isa Absent ||
        (_openapi_output["lg"] = _encode_unvalidated(_openapi_value.lg))
    _openapi_value.kp_pll isa Absent ||
        (_openapi_output["kp_pll"] = _encode_unvalidated(_openapi_value.kp_pll))
    _openapi_value.ki_pll isa Absent ||
        (_openapi_output["ki_pll"] = _encode_unvalidated(_openapi_value.ki_pll))
    _openapi_value.kpv isa Absent ||
        (_openapi_output["kpv"] = _encode_unvalidated(_openapi_value.kpv))
    _openapi_value.kiv isa Absent ||
        (_openapi_output["kiv"] = _encode_unvalidated(_openapi_value.kiv))
    _openapi_value.kpc isa Absent ||
        (_openapi_output["kpc"] = _encode_unvalidated(_openapi_value.kpc))
    _openapi_value.kic isa Absent ||
        (_openapi_output["kic"] = _encode_unvalidated(_openapi_value.kic))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode_unvalidated(_openapi_value.p_ref))
    _openapi_value.q_ref isa Absent ||
        (_openapi_output["Q_ref"] = _encode_unvalidated(_openapi_value.q_ref))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode_unvalidated(_openapi_value.v_ref))
    _openapi_value.frequency_ref isa Absent || (
        _openapi_output["frequency_ref"] =
            _encode_unvalidated(_openapi_value.frequency_ref)
    )
    _openapi_value.is_filter_differential isa Absent || (
        _openapi_output["is_filter_differential"] =
            _encode_unvalidated(_openapi_value.is_filter_differential)
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
_encode(_openapi_value::ActiveConstantPowerLoad) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0b9ffcb7386daa8950ca.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ActiveConstantPowerLoad";
    direction=:neutral,
)

function _form_fields(_openapi_value::ActiveConstantPowerLoad)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.r_load isa Absent ||
        push!(_openapi_output, "r_load" => _openapi_value.r_load)
    _openapi_value.c_dc isa Absent || push!(_openapi_output, "c_dc" => _openapi_value.c_dc)
    _openapi_value.rf isa Absent || push!(_openapi_output, "rf" => _openapi_value.rf)
    _openapi_value.lf isa Absent || push!(_openapi_output, "lf" => _openapi_value.lf)
    _openapi_value.cf isa Absent || push!(_openapi_output, "cf" => _openapi_value.cf)
    _openapi_value.rg isa Absent || push!(_openapi_output, "rg" => _openapi_value.rg)
    _openapi_value.lg isa Absent || push!(_openapi_output, "lg" => _openapi_value.lg)
    _openapi_value.kp_pll isa Absent ||
        push!(_openapi_output, "kp_pll" => _openapi_value.kp_pll)
    _openapi_value.ki_pll isa Absent ||
        push!(_openapi_output, "ki_pll" => _openapi_value.ki_pll)
    _openapi_value.kpv isa Absent || push!(_openapi_output, "kpv" => _openapi_value.kpv)
    _openapi_value.kiv isa Absent || push!(_openapi_output, "kiv" => _openapi_value.kiv)
    _openapi_value.kpc isa Absent || push!(_openapi_output, "kpc" => _openapi_value.kpc)
    _openapi_value.kic isa Absent || push!(_openapi_output, "kic" => _openapi_value.kic)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.frequency_ref isa Absent ||
        push!(_openapi_output, "frequency_ref" => _openapi_value.frequency_ref)
    _openapi_value.is_filter_differential isa Absent || push!(
        _openapi_output,
        "is_filter_differential" => _openapi_value.is_filter_differential,
    )
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
