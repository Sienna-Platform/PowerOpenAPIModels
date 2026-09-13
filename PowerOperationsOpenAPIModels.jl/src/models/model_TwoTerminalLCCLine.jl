"""
    TwoTerminalLCCLine

A Non-Capacitor Line Commutated Converter (LCC)-HVDC transmission line. As implemented in PSS/E.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `arc`: An Arc defining this line `from` a rectifier bus `to` an inverter bus. The rectifier bus must be specified in the `from` bus and inverter bus in the `to` bus.
  - `active_power_flow`: Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `parameter_units`: Unit basis for this line's impedance fields (r, rectifier/inverter rc/xc, capacitor reactances, compounding_resistance).
  - `r`: Series resistance of the DC line. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `transfer_setpoint`: Desired set-point of power. If `power_mode = true` this value is in MW units, and if `power_mode = false` is in Amperes units. This parameter must not be specified in per-unit. A positive value represents the desired consumed power at the rectifier bus, while a negative value represents the desired power at the inverter bus (i.e. the absolute value of `transfer_setpoint` is the generated power at the inverter bus). Units: per power_mode — true: MW, false: A .
  - `dc_voltage_units`: Unit basis for the DC voltage fields (scheduled_dc_voltage, switch_mode_voltage, min_compounding_voltage).
  - `scheduled_dc_voltage`: Scheduled compounded DC voltage. By default this parameter is the scheduled DC voltage in the inverter bus. This parameter must not be specified in per-unit. Units: kV. Units: per dc_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
  - `rectifier_bridges`: Number of bridges in series in the rectifier side.
  - `rectifier_delay_angle_limits`: Minimum and maximum rectifier firing delay angle (alpha). Units: rad.
  - `rectifier_rc`: Rectifier commutating transformer resistance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `rectifier_xc`: Rectifier commutating transformer reactance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `rectifier_base_voltage`: Rectifier primary base AC voltage, entered in kV. Units: kV.
  - `inverter_bridges`: Number of bridges in series in the inverter side.
  - `inverter_extinction_angle_limits`: Minimum and maximum inverter extinction angle (gamma). Units: rad.
  - `inverter_rc`: Inverter commutating transformer resistance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `inverter_xc`: Inverter commutating transformer reactance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `inverter_base_voltage`: Inverter primary base AC voltage, entered in kV. Units: kV.
  - `power_mode`: Boolean flag to identify if the LCC line is in power mode or current mode. If `power_mode = true`, setpoint values must be specified in MW, and if `power_mode = false` setpoint values must be specified in Amperes.
  - `switch_mode_voltage`: Mode switch DC voltage. This parameter must not be added in per-unit. If LCC line is in power mode control, and DC voltage falls below this value, the line switch to current mode control. Units: kV. Units: per dc_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
  - `compounding_resistance`: Compounding Resistance. This parameter is for control of the DC voltage in the rectifier or inverter end. For inverter DC voltage control, the parameter is set to zero; for rectifier DC voltage control, the parameter is set to the DC line resistance; otherwise, set to a fraction of the DC line resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `min_compounding_voltage`: Minimum compounded voltage. This parameter must not be added in per-unit. Only used in constant gamma operation (gamma_min = gamma_max), and the AC transformer is used to control the DC voltage. Units: kV. Units: per dc_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
  - `rectifier_transformer_ratio`: Rectifier transformer ratio between the primary and secondary side AC voltages. Units: 1.
  - `rectifier_tap_setting`: Rectifier transformer tap setting. Units: 1.
  - `rectifier_tap_limits`: Minimum and maximum rectifier tap limits as a ratio between the primary and secondary side AC voltages. Units: 1.
  - `rectifier_tap_step`: Rectifier transformer tap step value. Units: 1.
  - `rectifier_delay_angle`: Rectifier firing delay angle (alpha). Units: rad.
  - `rectifier_capacitor_reactance`: Commutating rectifier capacitor reactance magnitude per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `inverter_transformer_ratio`: Inverter transformer ratio between the primary and secondary side AC voltages. Units: 1.
  - `inverter_tap_setting`: Inverter transformer tap setting. Units: 1.
  - `inverter_tap_limits`: Minimum and maximum inverter tap limits as a ratio between the primary and secondary side AC voltages. Units: 1.
  - `inverter_tap_step`: Inverter transformer tap step value. Units: 1.
  - `inverter_extinction_angle`: Inverter extinction angle (gamma). Units: rad.
  - `inverter_capacitor_reactance`: Commutating inverter capacitor reactance magnitude per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `active_power_limits_from`: Minimum and maximum active power flows to the FROM node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `active_power_limits_to`: Minimum and maximum active power flows to the TO node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_limits_from`: Minimum and maximum reactive power limits to the FROM node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `reactive_power_limits_to`: Minimum and maximum reactive power limits to the TO node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `loss`: A generic loss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments.
  - `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
"""
Base.@kwdef struct TwoTerminalLCCLine <: APIModel
    id::Int64
    name::String
    available::Bool
    arc::Int64
    active_power_flow::Float64
    parameter_units::Union{Absent, ImpedanceUnitBasis, Nothing} = ABSENT
    r::Float64
    transfer_setpoint::Float64
    dc_voltage_units::Union{Absent, Nothing, VoltageUnitBasis} = ABSENT
    scheduled_dc_voltage::Float64
    rectifier_bridges::Int64
    rectifier_delay_angle_limits::MinMax
    rectifier_rc::Float64
    rectifier_xc::Float64
    rectifier_base_voltage::Float64
    inverter_bridges::Int64
    inverter_extinction_angle_limits::MinMax
    inverter_rc::Float64
    inverter_xc::Float64
    inverter_base_voltage::Float64
    power_mode::Union{Absent, Bool, Nothing} = ABSENT
    switch_mode_voltage::Union{Absent, Float64, Nothing} = ABSENT
    compounding_resistance::Union{Absent, Float64, Nothing} = ABSENT
    min_compounding_voltage::Union{Absent, Float64, Nothing} = ABSENT
    rectifier_transformer_ratio::Union{Absent, Float64, Nothing} = ABSENT
    rectifier_tap_setting::Union{Absent, Float64, Nothing} = ABSENT
    rectifier_tap_limits::Union{Absent, Nothing, MinMax} = ABSENT
    rectifier_tap_step::Union{Absent, Float64, Nothing} = ABSENT
    rectifier_delay_angle::Union{Absent, Float64, Nothing} = ABSENT
    rectifier_capacitor_reactance::Union{Absent, Float64, Nothing} = ABSENT
    inverter_transformer_ratio::Union{Absent, Float64, Nothing} = ABSENT
    inverter_tap_setting::Union{Absent, Float64, Nothing} = ABSENT
    inverter_tap_limits::Union{Absent, Nothing, MinMax} = ABSENT
    inverter_tap_step::Union{Absent, Float64, Nothing} = ABSENT
    inverter_extinction_angle::Union{Absent, Float64, Nothing} = ABSENT
    inverter_capacitor_reactance::Union{Absent, Float64, Nothing} = ABSENT
    active_power_limits_from::Union{Absent, Nothing, MinMax} = ABSENT
    active_power_limits_to::Union{Absent, Nothing, MinMax} = ABSENT
    reactive_power_limits_from::Union{Absent, Nothing, MinMax} = ABSENT
    reactive_power_limits_to::Union{Absent, Nothing, MinMax} = ABSENT
    loss::Union{Absent, LossCurve, Nothing} = ABSENT
    base_power::Float64
    power_units::UnitSystem
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TwoTerminalLCCLine}, value) = _decode(TwoTerminalLCCLine, value, true)
function _decode(::Type{TwoTerminalLCCLine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-eebfcfe10ee7b5630cfb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TwoTerminalLCCLine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TwoTerminalLCCLine")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_arc = _decode(
        Int64,
        _required(_openapi_object, "arc", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_active_power_flow = _decode(
        Float64,
        _required(_openapi_object, "active_power_flow", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_parameter_units =
        haskey(_openapi_object, "parameter_units") ?
        _decode(
            Union{Absent, ImpedanceUnitBasis, Nothing},
            _openapi_object["parameter_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_r = _decode(
        Float64,
        _required(_openapi_object, "r", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_transfer_setpoint = _decode(
        Float64,
        _required(_openapi_object, "transfer_setpoint", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_dc_voltage_units =
        haskey(_openapi_object, "dc_voltage_units") ?
        _decode(
            Union{Absent, Nothing, VoltageUnitBasis},
            _openapi_object["dc_voltage_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_scheduled_dc_voltage = _decode(
        Float64,
        _required(_openapi_object, "scheduled_dc_voltage", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_rectifier_bridges = _decode(
        Int64,
        _required(_openapi_object, "rectifier_bridges", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_rectifier_delay_angle_limits = _decode(
        MinMax,
        _required(_openapi_object, "rectifier_delay_angle_limits", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_rectifier_rc = _decode(
        Float64,
        _required(_openapi_object, "rectifier_rc", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_rectifier_xc = _decode(
        Float64,
        _required(_openapi_object, "rectifier_xc", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_rectifier_base_voltage = _decode(
        Float64,
        _required(_openapi_object, "rectifier_base_voltage", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_inverter_bridges = _decode(
        Int64,
        _required(_openapi_object, "inverter_bridges", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_inverter_extinction_angle_limits = _decode(
        MinMax,
        _required(
            _openapi_object,
            "inverter_extinction_angle_limits",
            "TwoTerminalLCCLine",
        ),
        _openapi_validate,
    )
    _openapi_field_inverter_rc = _decode(
        Float64,
        _required(_openapi_object, "inverter_rc", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_inverter_xc = _decode(
        Float64,
        _required(_openapi_object, "inverter_xc", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_inverter_base_voltage = _decode(
        Float64,
        _required(_openapi_object, "inverter_base_voltage", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_power_mode =
        haskey(_openapi_object, "power_mode") ?
        _decode(
            Union{Absent, Bool, Nothing},
            _openapi_object["power_mode"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_switch_mode_voltage =
        haskey(_openapi_object, "switch_mode_voltage") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["switch_mode_voltage"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_compounding_resistance =
        haskey(_openapi_object, "compounding_resistance") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["compounding_resistance"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_min_compounding_voltage =
        haskey(_openapi_object, "min_compounding_voltage") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["min_compounding_voltage"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rectifier_transformer_ratio =
        haskey(_openapi_object, "rectifier_transformer_ratio") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["rectifier_transformer_ratio"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rectifier_tap_setting =
        haskey(_openapi_object, "rectifier_tap_setting") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["rectifier_tap_setting"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rectifier_tap_limits =
        haskey(_openapi_object, "rectifier_tap_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["rectifier_tap_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rectifier_tap_step =
        haskey(_openapi_object, "rectifier_tap_step") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["rectifier_tap_step"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rectifier_delay_angle =
        haskey(_openapi_object, "rectifier_delay_angle") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["rectifier_delay_angle"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rectifier_capacitor_reactance =
        haskey(_openapi_object, "rectifier_capacitor_reactance") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["rectifier_capacitor_reactance"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inverter_transformer_ratio =
        haskey(_openapi_object, "inverter_transformer_ratio") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["inverter_transformer_ratio"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inverter_tap_setting =
        haskey(_openapi_object, "inverter_tap_setting") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["inverter_tap_setting"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inverter_tap_limits =
        haskey(_openapi_object, "inverter_tap_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["inverter_tap_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inverter_tap_step =
        haskey(_openapi_object, "inverter_tap_step") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["inverter_tap_step"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inverter_extinction_angle =
        haskey(_openapi_object, "inverter_extinction_angle") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["inverter_extinction_angle"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_inverter_capacitor_reactance =
        haskey(_openapi_object, "inverter_capacitor_reactance") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["inverter_capacitor_reactance"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_active_power_limits_from =
        haskey(_openapi_object, "active_power_limits_from") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["active_power_limits_from"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_active_power_limits_to =
        haskey(_openapi_object, "active_power_limits_to") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["active_power_limits_to"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_reactive_power_limits_from =
        haskey(_openapi_object, "reactive_power_limits_from") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["reactive_power_limits_from"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_reactive_power_limits_to =
        haskey(_openapi_object, "reactive_power_limits_to") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["reactive_power_limits_to"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_loss =
        haskey(_openapi_object, "loss") ?
        _decode(
            Union{Absent, LossCurve, Nothing},
            _openapi_object["loss"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "TwoTerminalLCCLine"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "arc",
            "active_power_flow",
            "parameter_units",
            "r",
            "transfer_setpoint",
            "dc_voltage_units",
            "scheduled_dc_voltage",
            "rectifier_bridges",
            "rectifier_delay_angle_limits",
            "rectifier_rc",
            "rectifier_xc",
            "rectifier_base_voltage",
            "inverter_bridges",
            "inverter_extinction_angle_limits",
            "inverter_rc",
            "inverter_xc",
            "inverter_base_voltage",
            "power_mode",
            "switch_mode_voltage",
            "compounding_resistance",
            "min_compounding_voltage",
            "rectifier_transformer_ratio",
            "rectifier_tap_setting",
            "rectifier_tap_limits",
            "rectifier_tap_step",
            "rectifier_delay_angle",
            "rectifier_capacitor_reactance",
            "inverter_transformer_ratio",
            "inverter_tap_setting",
            "inverter_tap_limits",
            "inverter_tap_step",
            "inverter_extinction_angle",
            "inverter_capacitor_reactance",
            "active_power_limits_from",
            "active_power_limits_to",
            "reactive_power_limits_from",
            "reactive_power_limits_to",
            "loss",
            "base_power",
            "power_units",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return TwoTerminalLCCLine(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        arc=_openapi_field_arc,
        active_power_flow=_openapi_field_active_power_flow,
        parameter_units=_openapi_field_parameter_units,
        r=_openapi_field_r,
        transfer_setpoint=_openapi_field_transfer_setpoint,
        dc_voltage_units=_openapi_field_dc_voltage_units,
        scheduled_dc_voltage=_openapi_field_scheduled_dc_voltage,
        rectifier_bridges=_openapi_field_rectifier_bridges,
        rectifier_delay_angle_limits=_openapi_field_rectifier_delay_angle_limits,
        rectifier_rc=_openapi_field_rectifier_rc,
        rectifier_xc=_openapi_field_rectifier_xc,
        rectifier_base_voltage=_openapi_field_rectifier_base_voltage,
        inverter_bridges=_openapi_field_inverter_bridges,
        inverter_extinction_angle_limits=_openapi_field_inverter_extinction_angle_limits,
        inverter_rc=_openapi_field_inverter_rc,
        inverter_xc=_openapi_field_inverter_xc,
        inverter_base_voltage=_openapi_field_inverter_base_voltage,
        power_mode=_openapi_field_power_mode,
        switch_mode_voltage=_openapi_field_switch_mode_voltage,
        compounding_resistance=_openapi_field_compounding_resistance,
        min_compounding_voltage=_openapi_field_min_compounding_voltage,
        rectifier_transformer_ratio=_openapi_field_rectifier_transformer_ratio,
        rectifier_tap_setting=_openapi_field_rectifier_tap_setting,
        rectifier_tap_limits=_openapi_field_rectifier_tap_limits,
        rectifier_tap_step=_openapi_field_rectifier_tap_step,
        rectifier_delay_angle=_openapi_field_rectifier_delay_angle,
        rectifier_capacitor_reactance=_openapi_field_rectifier_capacitor_reactance,
        inverter_transformer_ratio=_openapi_field_inverter_transformer_ratio,
        inverter_tap_setting=_openapi_field_inverter_tap_setting,
        inverter_tap_limits=_openapi_field_inverter_tap_limits,
        inverter_tap_step=_openapi_field_inverter_tap_step,
        inverter_extinction_angle=_openapi_field_inverter_extinction_angle,
        inverter_capacitor_reactance=_openapi_field_inverter_capacitor_reactance,
        active_power_limits_from=_openapi_field_active_power_limits_from,
        active_power_limits_to=_openapi_field_active_power_limits_to,
        reactive_power_limits_from=_openapi_field_reactive_power_limits_from,
        reactive_power_limits_to=_openapi_field_reactive_power_limits_to,
        loss=_openapi_field_loss,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::TwoTerminalLCCLine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.active_power_flow isa Absent ||
        (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.parameter_units isa Absent ||
        (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.r isa Absent || (_openapi_output["r"] = _encode(_openapi_value.r))
    _openapi_value.transfer_setpoint isa Absent ||
        (_openapi_output["transfer_setpoint"] = _encode(_openapi_value.transfer_setpoint))
    _openapi_value.dc_voltage_units isa Absent ||
        (_openapi_output["dc_voltage_units"] = _encode(_openapi_value.dc_voltage_units))
    _openapi_value.scheduled_dc_voltage isa Absent || (
        _openapi_output["scheduled_dc_voltage"] =
            _encode(_openapi_value.scheduled_dc_voltage)
    )
    _openapi_value.rectifier_bridges isa Absent ||
        (_openapi_output["rectifier_bridges"] = _encode(_openapi_value.rectifier_bridges))
    _openapi_value.rectifier_delay_angle_limits isa Absent || (
        _openapi_output["rectifier_delay_angle_limits"] =
            _encode(_openapi_value.rectifier_delay_angle_limits)
    )
    _openapi_value.rectifier_rc isa Absent ||
        (_openapi_output["rectifier_rc"] = _encode(_openapi_value.rectifier_rc))
    _openapi_value.rectifier_xc isa Absent ||
        (_openapi_output["rectifier_xc"] = _encode(_openapi_value.rectifier_xc))
    _openapi_value.rectifier_base_voltage isa Absent || (
        _openapi_output["rectifier_base_voltage"] =
            _encode(_openapi_value.rectifier_base_voltage)
    )
    _openapi_value.inverter_bridges isa Absent ||
        (_openapi_output["inverter_bridges"] = _encode(_openapi_value.inverter_bridges))
    _openapi_value.inverter_extinction_angle_limits isa Absent || (
        _openapi_output["inverter_extinction_angle_limits"] =
            _encode(_openapi_value.inverter_extinction_angle_limits)
    )
    _openapi_value.inverter_rc isa Absent ||
        (_openapi_output["inverter_rc"] = _encode(_openapi_value.inverter_rc))
    _openapi_value.inverter_xc isa Absent ||
        (_openapi_output["inverter_xc"] = _encode(_openapi_value.inverter_xc))
    _openapi_value.inverter_base_voltage isa Absent || (
        _openapi_output["inverter_base_voltage"] =
            _encode(_openapi_value.inverter_base_voltage)
    )
    _openapi_value.power_mode isa Absent ||
        (_openapi_output["power_mode"] = _encode(_openapi_value.power_mode))
    _openapi_value.switch_mode_voltage isa Absent || (
        _openapi_output["switch_mode_voltage"] =
            _encode(_openapi_value.switch_mode_voltage)
    )
    _openapi_value.compounding_resistance isa Absent || (
        _openapi_output["compounding_resistance"] =
            _encode(_openapi_value.compounding_resistance)
    )
    _openapi_value.min_compounding_voltage isa Absent || (
        _openapi_output["min_compounding_voltage"] =
            _encode(_openapi_value.min_compounding_voltage)
    )
    _openapi_value.rectifier_transformer_ratio isa Absent || (
        _openapi_output["rectifier_transformer_ratio"] =
            _encode(_openapi_value.rectifier_transformer_ratio)
    )
    _openapi_value.rectifier_tap_setting isa Absent || (
        _openapi_output["rectifier_tap_setting"] =
            _encode(_openapi_value.rectifier_tap_setting)
    )
    _openapi_value.rectifier_tap_limits isa Absent || (
        _openapi_output["rectifier_tap_limits"] =
            _encode(_openapi_value.rectifier_tap_limits)
    )
    _openapi_value.rectifier_tap_step isa Absent ||
        (_openapi_output["rectifier_tap_step"] = _encode(_openapi_value.rectifier_tap_step))
    _openapi_value.rectifier_delay_angle isa Absent || (
        _openapi_output["rectifier_delay_angle"] =
            _encode(_openapi_value.rectifier_delay_angle)
    )
    _openapi_value.rectifier_capacitor_reactance isa Absent || (
        _openapi_output["rectifier_capacitor_reactance"] =
            _encode(_openapi_value.rectifier_capacitor_reactance)
    )
    _openapi_value.inverter_transformer_ratio isa Absent || (
        _openapi_output["inverter_transformer_ratio"] =
            _encode(_openapi_value.inverter_transformer_ratio)
    )
    _openapi_value.inverter_tap_setting isa Absent || (
        _openapi_output["inverter_tap_setting"] =
            _encode(_openapi_value.inverter_tap_setting)
    )
    _openapi_value.inverter_tap_limits isa Absent || (
        _openapi_output["inverter_tap_limits"] =
            _encode(_openapi_value.inverter_tap_limits)
    )
    _openapi_value.inverter_tap_step isa Absent ||
        (_openapi_output["inverter_tap_step"] = _encode(_openapi_value.inverter_tap_step))
    _openapi_value.inverter_extinction_angle isa Absent || (
        _openapi_output["inverter_extinction_angle"] =
            _encode(_openapi_value.inverter_extinction_angle)
    )
    _openapi_value.inverter_capacitor_reactance isa Absent || (
        _openapi_output["inverter_capacitor_reactance"] =
            _encode(_openapi_value.inverter_capacitor_reactance)
    )
    _openapi_value.active_power_limits_from isa Absent || (
        _openapi_output["active_power_limits_from"] =
            _encode(_openapi_value.active_power_limits_from)
    )
    _openapi_value.active_power_limits_to isa Absent || (
        _openapi_output["active_power_limits_to"] =
            _encode(_openapi_value.active_power_limits_to)
    )
    _openapi_value.reactive_power_limits_from isa Absent || (
        _openapi_output["reactive_power_limits_from"] =
            _encode(_openapi_value.reactive_power_limits_from)
    )
    _openapi_value.reactive_power_limits_to isa Absent || (
        _openapi_output["reactive_power_limits_to"] =
            _encode(_openapi_value.reactive_power_limits_to)
    )
    _openapi_value.loss isa Absent ||
        (_openapi_output["loss"] = _encode(_openapi_value.loss))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
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
            resource="https://openapi.invalid/schema/external-eebfcfe10ee7b5630cfb.json",
            pointer="",
        ),
        _openapi_output,
        "encoding TwoTerminalLCCLine";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::TwoTerminalLCCLine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.active_power_flow isa Absent ||
        push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.parameter_units isa Absent ||
        push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.transfer_setpoint isa Absent ||
        push!(_openapi_output, "transfer_setpoint" => _openapi_value.transfer_setpoint)
    _openapi_value.dc_voltage_units isa Absent ||
        push!(_openapi_output, "dc_voltage_units" => _openapi_value.dc_voltage_units)
    _openapi_value.scheduled_dc_voltage isa Absent || push!(
        _openapi_output,
        "scheduled_dc_voltage" => _openapi_value.scheduled_dc_voltage,
    )
    _openapi_value.rectifier_bridges isa Absent ||
        push!(_openapi_output, "rectifier_bridges" => _openapi_value.rectifier_bridges)
    _openapi_value.rectifier_delay_angle_limits isa Absent || push!(
        _openapi_output,
        "rectifier_delay_angle_limits" => _openapi_value.rectifier_delay_angle_limits,
    )
    _openapi_value.rectifier_rc isa Absent ||
        push!(_openapi_output, "rectifier_rc" => _openapi_value.rectifier_rc)
    _openapi_value.rectifier_xc isa Absent ||
        push!(_openapi_output, "rectifier_xc" => _openapi_value.rectifier_xc)
    _openapi_value.rectifier_base_voltage isa Absent || push!(
        _openapi_output,
        "rectifier_base_voltage" => _openapi_value.rectifier_base_voltage,
    )
    _openapi_value.inverter_bridges isa Absent ||
        push!(_openapi_output, "inverter_bridges" => _openapi_value.inverter_bridges)
    _openapi_value.inverter_extinction_angle_limits isa Absent || push!(
        _openapi_output,
        "inverter_extinction_angle_limits" =>
            _openapi_value.inverter_extinction_angle_limits,
    )
    _openapi_value.inverter_rc isa Absent ||
        push!(_openapi_output, "inverter_rc" => _openapi_value.inverter_rc)
    _openapi_value.inverter_xc isa Absent ||
        push!(_openapi_output, "inverter_xc" => _openapi_value.inverter_xc)
    _openapi_value.inverter_base_voltage isa Absent || push!(
        _openapi_output,
        "inverter_base_voltage" => _openapi_value.inverter_base_voltage,
    )
    _openapi_value.power_mode isa Absent ||
        push!(_openapi_output, "power_mode" => _openapi_value.power_mode)
    _openapi_value.switch_mode_voltage isa Absent ||
        push!(_openapi_output, "switch_mode_voltage" => _openapi_value.switch_mode_voltage)
    _openapi_value.compounding_resistance isa Absent || push!(
        _openapi_output,
        "compounding_resistance" => _openapi_value.compounding_resistance,
    )
    _openapi_value.min_compounding_voltage isa Absent || push!(
        _openapi_output,
        "min_compounding_voltage" => _openapi_value.min_compounding_voltage,
    )
    _openapi_value.rectifier_transformer_ratio isa Absent || push!(
        _openapi_output,
        "rectifier_transformer_ratio" => _openapi_value.rectifier_transformer_ratio,
    )
    _openapi_value.rectifier_tap_setting isa Absent || push!(
        _openapi_output,
        "rectifier_tap_setting" => _openapi_value.rectifier_tap_setting,
    )
    _openapi_value.rectifier_tap_limits isa Absent || push!(
        _openapi_output,
        "rectifier_tap_limits" => _openapi_value.rectifier_tap_limits,
    )
    _openapi_value.rectifier_tap_step isa Absent ||
        push!(_openapi_output, "rectifier_tap_step" => _openapi_value.rectifier_tap_step)
    _openapi_value.rectifier_delay_angle isa Absent || push!(
        _openapi_output,
        "rectifier_delay_angle" => _openapi_value.rectifier_delay_angle,
    )
    _openapi_value.rectifier_capacitor_reactance isa Absent || push!(
        _openapi_output,
        "rectifier_capacitor_reactance" => _openapi_value.rectifier_capacitor_reactance,
    )
    _openapi_value.inverter_transformer_ratio isa Absent || push!(
        _openapi_output,
        "inverter_transformer_ratio" => _openapi_value.inverter_transformer_ratio,
    )
    _openapi_value.inverter_tap_setting isa Absent || push!(
        _openapi_output,
        "inverter_tap_setting" => _openapi_value.inverter_tap_setting,
    )
    _openapi_value.inverter_tap_limits isa Absent ||
        push!(_openapi_output, "inverter_tap_limits" => _openapi_value.inverter_tap_limits)
    _openapi_value.inverter_tap_step isa Absent ||
        push!(_openapi_output, "inverter_tap_step" => _openapi_value.inverter_tap_step)
    _openapi_value.inverter_extinction_angle isa Absent || push!(
        _openapi_output,
        "inverter_extinction_angle" => _openapi_value.inverter_extinction_angle,
    )
    _openapi_value.inverter_capacitor_reactance isa Absent || push!(
        _openapi_output,
        "inverter_capacitor_reactance" => _openapi_value.inverter_capacitor_reactance,
    )
    _openapi_value.active_power_limits_from isa Absent || push!(
        _openapi_output,
        "active_power_limits_from" => _openapi_value.active_power_limits_from,
    )
    _openapi_value.active_power_limits_to isa Absent || push!(
        _openapi_output,
        "active_power_limits_to" => _openapi_value.active_power_limits_to,
    )
    _openapi_value.reactive_power_limits_from isa Absent || push!(
        _openapi_output,
        "reactive_power_limits_from" => _openapi_value.reactive_power_limits_from,
    )
    _openapi_value.reactive_power_limits_to isa Absent || push!(
        _openapi_output,
        "reactive_power_limits_to" => _openapi_value.reactive_power_limits_to,
    )
    _openapi_value.loss isa Absent || push!(_openapi_output, "loss" => _openapi_value.loss)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
