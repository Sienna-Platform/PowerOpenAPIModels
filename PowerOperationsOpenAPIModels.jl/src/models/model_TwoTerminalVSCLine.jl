@doc "    TwoTerminalVSCLine\n\nA High Voltage Voltage-Source Converter DC line, which must be connected to an ACBus on each end. This model is appropriate for operational simulations with a linearized DC power flow approximation with losses using a voltage-current model. For modeling a DC network, see TModelHVDCLine.\n\n- `ac_control_from`: AC-side control mode of the `from` converter.\n- `ac_control_to`: AC-side control mode of the `to` converter.\n- `ac_setpoint_from`: Converter AC setpoint in the `from` bus converter. When `ac_control_from` regulates AC voltage this number is the AC voltage on the AC side of the converter; when it controls reactive power this value is the power factor setpoint. Units: per ac_control_from — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per setpoint_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) .\n- `ac_setpoint_to`: Converter AC setpoint in the `to` bus converter. When `ac_control_to` regulates AC voltage this number is the AC voltage on the AC side of the converter; when it controls reactive power this value is the power factor setpoint. Units: per ac_control_to — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per setpoint_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) .\n- `active_power_flow`: Initial condition of active power flowing from the from-bus to the to-bus in DC. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits_from`: Minimum and maximum active power flows to the FROM node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits_to`: Minimum and maximum active power flows to the TO node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `admittance_units`: Unit basis for the series conductance g.\n- `arc`: An Arc defining this line `from` a bus `to` another bus.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `converter_loss_from`: Loss model coefficients in the `from` bus converter. It accepts a linear model or quadratic. Same converter data is used in both ends.\n- `converter_loss_to`: Loss model coefficients in the `to` bus converter. It accepts a linear model or quadratic. Same converter data is used in both ends.\n- `dc_control_from`: DC-side control mode of the `from` converter.\n- `dc_control_to`: DC-side control mode of the `to` converter.\n- `dc_current`: DC current on the converter flowing in the DC line, from `from` bus to `to` bus. Units: A.\n- `dc_setpoint_from`: Converter DC setpoint in the `from` bus converter. When `dc_control_from` regulates DC voltage this number is the DC voltage on the DC side of the converter; when it controls DC power this value is the power demand in MW, if positive the converter is supplying power to the AC network at the `from` bus; if negative, the converter is withdrawing power from the AC network at the `from` bus. Units: per dc_control_from — DC_POWER: MW, DC_VOLTAGE: (per setpoint_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu), DC_VOLTAGE_DROOP: (per setpoint_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) .\n- `dc_setpoint_to`: Converter DC setpoint in the `to` bus converter. When `dc_control_to` regulates DC voltage this number is the DC voltage on the DC side of the converter; when it controls DC power this value is the power demand in MW, if positive the converter is supplying power to the AC network at the `to` bus; if negative, the converter is withdrawing power from the AC network at the `to` bus. Units: per dc_control_to — DC_POWER: MW, DC_VOLTAGE: (per setpoint_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu), DC_VOLTAGE_DROOP: (per setpoint_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) .\n- `dc_voltage_droop_from`: DC-voltage droop gain on the `from` converter, used when `dc_control_from` is `DC_VOLTAGE_DROOP`: `V_dc = dc_setpoint_from - dc_voltage_droop_from * P_c`. Units: pu.\n- `dc_voltage_droop_to`: DC-voltage droop gain on the `to` converter, used when `dc_control_to` is `DC_VOLTAGE_DROOP`: `V_dc = dc_setpoint_to - dc_voltage_droop_to * P_c`. Units: pu.\n- `g`: Series conductance of the DC line. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MW, COMPONENT_BASE: pu .\n- `id`: Unique integer identifier for this component.\n- `max_dc_current_from`: Maximum stable dc current limits. Units: A.\n- `max_dc_current_to`: Maximum stable dc current limits. Units: A.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_factor_weighting_fraction_from`: Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1.\n- `power_factor_weighting_fraction_to`: Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `rated_ac_voltage_from`: Rated (base) AC voltage at the `from` converter's AC terminal in kV. Used as the AC voltage base for interpreting ac_setpoint_from when ac_control_from is AC_VOLTAGE; 0.0 means unspecified (the setpoint is taken as per-unit directly). Units: kV.\n- `rated_ac_voltage_to`: Rated (base) AC voltage at the `to` converter's AC terminal in kV. Used as the AC voltage base for interpreting ac_setpoint_to when ac_control_to is AC_VOLTAGE; 0.0 means unspecified (the setpoint is taken as per-unit directly). Units: kV.\n- `rated_dc_voltage`: Rated (base) DC voltage of the link in kV. Used as the DC voltage base for interpreting DC-voltage setpoints; 0.0 means unspecified (DC-voltage setpoints are taken as per-unit directly). Units: kV.\n- `rating`: Maximum output power rating of the converter. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `rating_from`: Converter rating in the `from` bus. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `rating_to`: Converter rating in the `to` bus. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power_from`: Initial condition of reactive power flowing into the from-bus. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits_from`: Limits on the Reactive Power at the `from` side. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits_to`: Limits on the Reactive Power at the `to` side. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_to`: Initial condition of reactive power flowing into the to-bus. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `remote_bus_control_from`: Number of the AC bus whose voltage the `from` converter regulates when `ac_control_from` is `AC_VOLTAGE`; null regulates its own terminal bus.\n- `remote_bus_control_to`: Number of the AC bus whose voltage the `to` converter regulates when `ac_control_to` is `AC_VOLTAGE`; null regulates its own terminal bus.\n- `rmpct_from`: Percent of the total Mvar required to hold the voltage at the bus regulated by the `from` converter that is contributed by this converter. Units: 1.\n- `rmpct_to`: Percent of the total Mvar required to hold the voltage at the bus regulated by the `to` converter that is contributed by this converter. Units: 1.\n- `setpoint_voltage_units`: Unit basis for the DC_VOLTAGE/DC_VOLTAGE_DROOP/AC_VOLTAGE branches of dc_setpoint_from/to and ac_setpoint_from/to. Independent of voltage_units, which covers voltage_limits_from/to only.\n- `voltage_limits_from`: Limits on the Voltage at the DC `from` Bus in kV. The DC base voltage is the `dc_setpoint` of the converter with `dc_voltage_control` enabled; exactly one converter must control the DC voltage. Units: kV. Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .\n- `voltage_limits_to`: Limits on the Voltage at the DC `to` Bus in kV. The DC base voltage is the `dc_setpoint` of the converter with `dc_voltage_control` enabled; exactly one converter must control the DC voltage. Units: kV. Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .\n- `voltage_units`: Unit basis for the DC bus voltage limits (voltage_limits_from/to only). Independent of setpoint_voltage_units, which covers dc_setpoint_from/to and ac_setpoint_from/to."
Base.@kwdef struct TwoTerminalVSCLine
    ac_control_from::Union{Absent,Nothing,TwoTerminalVSCLineAcControlFrom} = ABSENT
    ac_control_to::Union{Absent,Nothing,TwoTerminalVSCLineAcControlTo} = ABSENT
    ac_setpoint_from::Union{Absent,Float64,Nothing} = ABSENT
    ac_setpoint_to::Union{Absent,Float64,Nothing} = ABSENT
    active_power_flow::Float64
    active_power_limits_from::TwoTerminalVSCLineActivePowerLimitsFrom
    active_power_limits_to::TwoTerminalVSCLineActivePowerLimitsTo
    admittance_units::Union{Absent,Nothing,TwoTerminalVSCLineAdmittanceUnits} = ABSENT
    arc::Int64
    available::Bool
    base_power::Float64
    converter_loss_from::Union{Absent,Nothing,TwoTerminalVSCLineConverterLossFrom} = ABSENT
    converter_loss_to::Union{Absent,Nothing,TwoTerminalVSCLineConverterLossTo} = ABSENT
    dc_control_from::Union{Absent,Nothing,TwoTerminalVSCLineDcControlFrom} = ABSENT
    dc_control_to::Union{Absent,Nothing,TwoTerminalVSCLineDcControlTo} = ABSENT
    dc_current::Union{Absent,Float64,Nothing} = ABSENT
    dc_setpoint_from::Union{Absent,Float64,Nothing} = ABSENT
    dc_setpoint_to::Union{Absent,Float64,Nothing} = ABSENT
    dc_voltage_droop_from::Union{Absent,Float64,Nothing} = ABSENT
    dc_voltage_droop_to::Union{Absent,Float64,Nothing} = ABSENT
    g::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    max_dc_current_from::Union{Absent,Float64,Nothing} = ABSENT
    max_dc_current_to::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    power_factor_weighting_fraction_from::Union{Absent,Float64,Nothing} = ABSENT
    power_factor_weighting_fraction_to::Union{Absent,Float64,Nothing} = ABSENT
    power_units::TwoTerminalVSCLinePowerUnits
    rated_ac_voltage_from::Union{Absent,Float64,Nothing} = ABSENT
    rated_ac_voltage_to::Union{Absent,Float64,Nothing} = ABSENT
    rated_dc_voltage::Union{Absent,Float64,Nothing} = ABSENT
    rating::Float64
    rating_from::Union{Absent,Float64,Nothing} = ABSENT
    rating_to::Union{Absent,Float64,Nothing} = ABSENT
    reactive_power_from::Union{Absent,Float64,Nothing} = ABSENT
    reactive_power_limits_from::Union{Absent,Nothing,TwoTerminalVSCLineReactivePowerLimitsFrom} = ABSENT
    reactive_power_limits_to::Union{Absent,Nothing,TwoTerminalVSCLineReactivePowerLimitsTo} = ABSENT
    reactive_power_to::Union{Absent,Float64,Nothing} = ABSENT
    remote_bus_control_from::Union{Absent,Union{Int64,Nothing}} = ABSENT
    remote_bus_control_to::Union{Absent,Union{Int64,Nothing}} = ABSENT
    rmpct_from::Union{Absent,Float64,Nothing} = ABSENT
    rmpct_to::Union{Absent,Float64,Nothing} = ABSENT
    setpoint_voltage_units::Union{Absent,Nothing,TwoTerminalVSCLineSetpointVoltageUnits} = ABSENT
    voltage_limits_from::Union{Absent,Nothing,TwoTerminalVSCLineVoltageLimitsFrom} = ABSENT
    voltage_limits_to::Union{Absent,Nothing,TwoTerminalVSCLineVoltageLimitsTo} = ABSENT
    voltage_units::Union{Absent,Nothing,TwoTerminalVSCLineVoltageUnits} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TwoTerminalVSCLine}, value) = _decode(TwoTerminalVSCLine, value, true)
function _decode(::Type{TwoTerminalVSCLine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine"), _openapi_raw, "decoding TwoTerminalVSCLine"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TwoTerminalVSCLine")
    _openapi_field_ac_control_from = haskey(_openapi_object, "ac_control_from") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineAcControlFrom}, _openapi_object["ac_control_from"], _openapi_validate) : ABSENT
    _openapi_field_ac_control_to = haskey(_openapi_object, "ac_control_to") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineAcControlTo}, _openapi_object["ac_control_to"], _openapi_validate) : ABSENT
    _openapi_field_ac_setpoint_from = haskey(_openapi_object, "ac_setpoint_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["ac_setpoint_from"], _openapi_validate) : ABSENT
    _openapi_field_ac_setpoint_to = haskey(_openapi_object, "ac_setpoint_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["ac_setpoint_to"], _openapi_validate) : ABSENT
    _openapi_field_active_power_flow = _decode(Float64, _required(_openapi_object, "active_power_flow", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_active_power_limits_from = _decode(TwoTerminalVSCLineActivePowerLimitsFrom, _required(_openapi_object, "active_power_limits_from", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_active_power_limits_to = _decode(TwoTerminalVSCLineActivePowerLimitsTo, _required(_openapi_object, "active_power_limits_to", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_admittance_units = haskey(_openapi_object, "admittance_units") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineAdmittanceUnits}, _openapi_object["admittance_units"], _openapi_validate) : ABSENT
    _openapi_field_arc = _decode(Int64, _required(_openapi_object, "arc", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_converter_loss_from = haskey(_openapi_object, "converter_loss_from") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineConverterLossFrom}, _openapi_object["converter_loss_from"], _openapi_validate) : ABSENT
    _openapi_field_converter_loss_to = haskey(_openapi_object, "converter_loss_to") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineConverterLossTo}, _openapi_object["converter_loss_to"], _openapi_validate) : ABSENT
    _openapi_field_dc_control_from = haskey(_openapi_object, "dc_control_from") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineDcControlFrom}, _openapi_object["dc_control_from"], _openapi_validate) : ABSENT
    _openapi_field_dc_control_to = haskey(_openapi_object, "dc_control_to") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineDcControlTo}, _openapi_object["dc_control_to"], _openapi_validate) : ABSENT
    _openapi_field_dc_current = haskey(_openapi_object, "dc_current") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_current"], _openapi_validate) : ABSENT
    _openapi_field_dc_setpoint_from = haskey(_openapi_object, "dc_setpoint_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_setpoint_from"], _openapi_validate) : ABSENT
    _openapi_field_dc_setpoint_to = haskey(_openapi_object, "dc_setpoint_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_setpoint_to"], _openapi_validate) : ABSENT
    _openapi_field_dc_voltage_droop_from = haskey(_openapi_object, "dc_voltage_droop_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_voltage_droop_from"], _openapi_validate) : ABSENT
    _openapi_field_dc_voltage_droop_to = haskey(_openapi_object, "dc_voltage_droop_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_voltage_droop_to"], _openapi_validate) : ABSENT
    _openapi_field_g = haskey(_openapi_object, "g") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["g"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_max_dc_current_from = haskey(_openapi_object, "max_dc_current_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_dc_current_from"], _openapi_validate) : ABSENT
    _openapi_field_max_dc_current_to = haskey(_openapi_object, "max_dc_current_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_dc_current_to"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_power_factor_weighting_fraction_from = haskey(_openapi_object, "power_factor_weighting_fraction_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["power_factor_weighting_fraction_from"], _openapi_validate) : ABSENT
    _openapi_field_power_factor_weighting_fraction_to = haskey(_openapi_object, "power_factor_weighting_fraction_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["power_factor_weighting_fraction_to"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(TwoTerminalVSCLinePowerUnits, _required(_openapi_object, "power_units", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_rated_ac_voltage_from = haskey(_openapi_object, "rated_ac_voltage_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rated_ac_voltage_from"], _openapi_validate) : ABSENT
    _openapi_field_rated_ac_voltage_to = haskey(_openapi_object, "rated_ac_voltage_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rated_ac_voltage_to"], _openapi_validate) : ABSENT
    _openapi_field_rated_dc_voltage = haskey(_openapi_object, "rated_dc_voltage") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rated_dc_voltage"], _openapi_validate) : ABSENT
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "TwoTerminalVSCLine"), _openapi_validate)
    _openapi_field_rating_from = haskey(_openapi_object, "rating_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating_from"], _openapi_validate) : ABSENT
    _openapi_field_rating_to = haskey(_openapi_object, "rating_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating_to"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_from = haskey(_openapi_object, "reactive_power_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["reactive_power_from"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_limits_from = haskey(_openapi_object, "reactive_power_limits_from") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineReactivePowerLimitsFrom}, _openapi_object["reactive_power_limits_from"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_limits_to = haskey(_openapi_object, "reactive_power_limits_to") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineReactivePowerLimitsTo}, _openapi_object["reactive_power_limits_to"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_to = haskey(_openapi_object, "reactive_power_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["reactive_power_to"], _openapi_validate) : ABSENT
    _openapi_field_remote_bus_control_from = haskey(_openapi_object, "remote_bus_control_from") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["remote_bus_control_from"], _openapi_validate) : ABSENT
    _openapi_field_remote_bus_control_to = haskey(_openapi_object, "remote_bus_control_to") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["remote_bus_control_to"], _openapi_validate) : ABSENT
    _openapi_field_rmpct_from = haskey(_openapi_object, "rmpct_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rmpct_from"], _openapi_validate) : ABSENT
    _openapi_field_rmpct_to = haskey(_openapi_object, "rmpct_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rmpct_to"], _openapi_validate) : ABSENT
    _openapi_field_setpoint_voltage_units = haskey(_openapi_object, "setpoint_voltage_units") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineSetpointVoltageUnits}, _openapi_object["setpoint_voltage_units"], _openapi_validate) : ABSENT
    _openapi_field_voltage_limits_from = haskey(_openapi_object, "voltage_limits_from") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineVoltageLimitsFrom}, _openapi_object["voltage_limits_from"], _openapi_validate) : ABSENT
    _openapi_field_voltage_limits_to = haskey(_openapi_object, "voltage_limits_to") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineVoltageLimitsTo}, _openapi_object["voltage_limits_to"], _openapi_validate) : ABSENT
    _openapi_field_voltage_units = haskey(_openapi_object, "voltage_units") ? _decode(Union{Absent,Nothing,TwoTerminalVSCLineVoltageUnits}, _openapi_object["voltage_units"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("ac_control_from","ac_control_to","ac_setpoint_from","ac_setpoint_to","active_power_flow","active_power_limits_from","active_power_limits_to","admittance_units","arc","available","base_power","converter_loss_from","converter_loss_to","dc_control_from","dc_control_to","dc_current","dc_setpoint_from","dc_setpoint_to","dc_voltage_droop_from","dc_voltage_droop_to","g","id","max_dc_current_from","max_dc_current_to","name","power_factor_weighting_fraction_from","power_factor_weighting_fraction_to","power_units","rated_ac_voltage_from","rated_ac_voltage_to","rated_dc_voltage","rating","rating_from","rating_to","reactive_power_from","reactive_power_limits_from","reactive_power_limits_to","reactive_power_to","remote_bus_control_from","remote_bus_control_to","rmpct_from","rmpct_to","setpoint_voltage_units","voltage_limits_from","voltage_limits_to","voltage_units") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TwoTerminalVSCLine(; ac_control_from = _openapi_field_ac_control_from, ac_control_to = _openapi_field_ac_control_to, ac_setpoint_from = _openapi_field_ac_setpoint_from, ac_setpoint_to = _openapi_field_ac_setpoint_to, active_power_flow = _openapi_field_active_power_flow, active_power_limits_from = _openapi_field_active_power_limits_from, active_power_limits_to = _openapi_field_active_power_limits_to, admittance_units = _openapi_field_admittance_units, arc = _openapi_field_arc, available = _openapi_field_available, base_power = _openapi_field_base_power, converter_loss_from = _openapi_field_converter_loss_from, converter_loss_to = _openapi_field_converter_loss_to, dc_control_from = _openapi_field_dc_control_from, dc_control_to = _openapi_field_dc_control_to, dc_current = _openapi_field_dc_current, dc_setpoint_from = _openapi_field_dc_setpoint_from, dc_setpoint_to = _openapi_field_dc_setpoint_to, dc_voltage_droop_from = _openapi_field_dc_voltage_droop_from, dc_voltage_droop_to = _openapi_field_dc_voltage_droop_to, g = _openapi_field_g, id = _openapi_field_id, max_dc_current_from = _openapi_field_max_dc_current_from, max_dc_current_to = _openapi_field_max_dc_current_to, name = _openapi_field_name, power_factor_weighting_fraction_from = _openapi_field_power_factor_weighting_fraction_from, power_factor_weighting_fraction_to = _openapi_field_power_factor_weighting_fraction_to, power_units = _openapi_field_power_units, rated_ac_voltage_from = _openapi_field_rated_ac_voltage_from, rated_ac_voltage_to = _openapi_field_rated_ac_voltage_to, rated_dc_voltage = _openapi_field_rated_dc_voltage, rating = _openapi_field_rating, rating_from = _openapi_field_rating_from, rating_to = _openapi_field_rating_to, reactive_power_from = _openapi_field_reactive_power_from, reactive_power_limits_from = _openapi_field_reactive_power_limits_from, reactive_power_limits_to = _openapi_field_reactive_power_limits_to, reactive_power_to = _openapi_field_reactive_power_to, remote_bus_control_from = _openapi_field_remote_bus_control_from, remote_bus_control_to = _openapi_field_remote_bus_control_to, rmpct_from = _openapi_field_rmpct_from, rmpct_to = _openapi_field_rmpct_to, setpoint_voltage_units = _openapi_field_setpoint_voltage_units, voltage_limits_from = _openapi_field_voltage_limits_from, voltage_limits_to = _openapi_field_voltage_limits_to, voltage_units = _openapi_field_voltage_units, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TwoTerminalVSCLine)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.ac_control_from isa Absent || (_openapi_output["ac_control_from"] = _encode(_openapi_value.ac_control_from))
    _openapi_value.ac_control_to isa Absent || (_openapi_output["ac_control_to"] = _encode(_openapi_value.ac_control_to))
    _openapi_value.ac_setpoint_from isa Absent || (_openapi_output["ac_setpoint_from"] = _encode(_openapi_value.ac_setpoint_from))
    _openapi_value.ac_setpoint_to isa Absent || (_openapi_output["ac_setpoint_to"] = _encode(_openapi_value.ac_setpoint_to))
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.active_power_limits_from isa Absent || (_openapi_output["active_power_limits_from"] = _encode(_openapi_value.active_power_limits_from))
    _openapi_value.active_power_limits_to isa Absent || (_openapi_output["active_power_limits_to"] = _encode(_openapi_value.active_power_limits_to))
    _openapi_value.admittance_units isa Absent || (_openapi_output["admittance_units"] = _encode(_openapi_value.admittance_units))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.converter_loss_from isa Absent || (_openapi_output["converter_loss_from"] = _encode(_openapi_value.converter_loss_from))
    _openapi_value.converter_loss_to isa Absent || (_openapi_output["converter_loss_to"] = _encode(_openapi_value.converter_loss_to))
    _openapi_value.dc_control_from isa Absent || (_openapi_output["dc_control_from"] = _encode(_openapi_value.dc_control_from))
    _openapi_value.dc_control_to isa Absent || (_openapi_output["dc_control_to"] = _encode(_openapi_value.dc_control_to))
    _openapi_value.dc_current isa Absent || (_openapi_output["dc_current"] = _encode(_openapi_value.dc_current))
    _openapi_value.dc_setpoint_from isa Absent || (_openapi_output["dc_setpoint_from"] = _encode(_openapi_value.dc_setpoint_from))
    _openapi_value.dc_setpoint_to isa Absent || (_openapi_output["dc_setpoint_to"] = _encode(_openapi_value.dc_setpoint_to))
    _openapi_value.dc_voltage_droop_from isa Absent || (_openapi_output["dc_voltage_droop_from"] = _encode(_openapi_value.dc_voltage_droop_from))
    _openapi_value.dc_voltage_droop_to isa Absent || (_openapi_output["dc_voltage_droop_to"] = _encode(_openapi_value.dc_voltage_droop_to))
    _openapi_value.g isa Absent || (_openapi_output["g"] = _encode(_openapi_value.g))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_dc_current_from isa Absent || (_openapi_output["max_dc_current_from"] = _encode(_openapi_value.max_dc_current_from))
    _openapi_value.max_dc_current_to isa Absent || (_openapi_output["max_dc_current_to"] = _encode(_openapi_value.max_dc_current_to))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_factor_weighting_fraction_from isa Absent || (_openapi_output["power_factor_weighting_fraction_from"] = _encode(_openapi_value.power_factor_weighting_fraction_from))
    _openapi_value.power_factor_weighting_fraction_to isa Absent || (_openapi_output["power_factor_weighting_fraction_to"] = _encode(_openapi_value.power_factor_weighting_fraction_to))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.rated_ac_voltage_from isa Absent || (_openapi_output["rated_ac_voltage_from"] = _encode(_openapi_value.rated_ac_voltage_from))
    _openapi_value.rated_ac_voltage_to isa Absent || (_openapi_output["rated_ac_voltage_to"] = _encode(_openapi_value.rated_ac_voltage_to))
    _openapi_value.rated_dc_voltage isa Absent || (_openapi_output["rated_dc_voltage"] = _encode(_openapi_value.rated_dc_voltage))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.rating_from isa Absent || (_openapi_output["rating_from"] = _encode(_openapi_value.rating_from))
    _openapi_value.rating_to isa Absent || (_openapi_output["rating_to"] = _encode(_openapi_value.rating_to))
    _openapi_value.reactive_power_from isa Absent || (_openapi_output["reactive_power_from"] = _encode(_openapi_value.reactive_power_from))
    _openapi_value.reactive_power_limits_from isa Absent || (_openapi_output["reactive_power_limits_from"] = _encode(_openapi_value.reactive_power_limits_from))
    _openapi_value.reactive_power_limits_to isa Absent || (_openapi_output["reactive_power_limits_to"] = _encode(_openapi_value.reactive_power_limits_to))
    _openapi_value.reactive_power_to isa Absent || (_openapi_output["reactive_power_to"] = _encode(_openapi_value.reactive_power_to))
    _openapi_value.remote_bus_control_from isa Absent || (_openapi_output["remote_bus_control_from"] = _encode(_openapi_value.remote_bus_control_from))
    _openapi_value.remote_bus_control_to isa Absent || (_openapi_output["remote_bus_control_to"] = _encode(_openapi_value.remote_bus_control_to))
    _openapi_value.rmpct_from isa Absent || (_openapi_output["rmpct_from"] = _encode(_openapi_value.rmpct_from))
    _openapi_value.rmpct_to isa Absent || (_openapi_output["rmpct_to"] = _encode(_openapi_value.rmpct_to))
    _openapi_value.setpoint_voltage_units isa Absent || (_openapi_output["setpoint_voltage_units"] = _encode(_openapi_value.setpoint_voltage_units))
    _openapi_value.voltage_limits_from isa Absent || (_openapi_output["voltage_limits_from"] = _encode(_openapi_value.voltage_limits_from))
    _openapi_value.voltage_limits_to isa Absent || (_openapi_output["voltage_limits_to"] = _encode(_openapi_value.voltage_limits_to))
    _openapi_value.voltage_units isa Absent || (_openapi_output["voltage_units"] = _encode(_openapi_value.voltage_units))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine"), _openapi_output, "encoding TwoTerminalVSCLine"; direction = :neutral)
end

function _form_fields(_openapi_value::TwoTerminalVSCLine)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.ac_control_from isa Absent || push!(_openapi_output, "ac_control_from" => _openapi_value.ac_control_from)
    _openapi_value.ac_control_to isa Absent || push!(_openapi_output, "ac_control_to" => _openapi_value.ac_control_to)
    _openapi_value.ac_setpoint_from isa Absent || push!(_openapi_output, "ac_setpoint_from" => _openapi_value.ac_setpoint_from)
    _openapi_value.ac_setpoint_to isa Absent || push!(_openapi_output, "ac_setpoint_to" => _openapi_value.ac_setpoint_to)
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.active_power_limits_from isa Absent || push!(_openapi_output, "active_power_limits_from" => _openapi_value.active_power_limits_from)
    _openapi_value.active_power_limits_to isa Absent || push!(_openapi_output, "active_power_limits_to" => _openapi_value.active_power_limits_to)
    _openapi_value.admittance_units isa Absent || push!(_openapi_output, "admittance_units" => _openapi_value.admittance_units)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.converter_loss_from isa Absent || push!(_openapi_output, "converter_loss_from" => _openapi_value.converter_loss_from)
    _openapi_value.converter_loss_to isa Absent || push!(_openapi_output, "converter_loss_to" => _openapi_value.converter_loss_to)
    _openapi_value.dc_control_from isa Absent || push!(_openapi_output, "dc_control_from" => _openapi_value.dc_control_from)
    _openapi_value.dc_control_to isa Absent || push!(_openapi_output, "dc_control_to" => _openapi_value.dc_control_to)
    _openapi_value.dc_current isa Absent || push!(_openapi_output, "dc_current" => _openapi_value.dc_current)
    _openapi_value.dc_setpoint_from isa Absent || push!(_openapi_output, "dc_setpoint_from" => _openapi_value.dc_setpoint_from)
    _openapi_value.dc_setpoint_to isa Absent || push!(_openapi_output, "dc_setpoint_to" => _openapi_value.dc_setpoint_to)
    _openapi_value.dc_voltage_droop_from isa Absent || push!(_openapi_output, "dc_voltage_droop_from" => _openapi_value.dc_voltage_droop_from)
    _openapi_value.dc_voltage_droop_to isa Absent || push!(_openapi_output, "dc_voltage_droop_to" => _openapi_value.dc_voltage_droop_to)
    _openapi_value.g isa Absent || push!(_openapi_output, "g" => _openapi_value.g)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_dc_current_from isa Absent || push!(_openapi_output, "max_dc_current_from" => _openapi_value.max_dc_current_from)
    _openapi_value.max_dc_current_to isa Absent || push!(_openapi_output, "max_dc_current_to" => _openapi_value.max_dc_current_to)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_factor_weighting_fraction_from isa Absent || push!(_openapi_output, "power_factor_weighting_fraction_from" => _openapi_value.power_factor_weighting_fraction_from)
    _openapi_value.power_factor_weighting_fraction_to isa Absent || push!(_openapi_output, "power_factor_weighting_fraction_to" => _openapi_value.power_factor_weighting_fraction_to)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.rated_ac_voltage_from isa Absent || push!(_openapi_output, "rated_ac_voltage_from" => _openapi_value.rated_ac_voltage_from)
    _openapi_value.rated_ac_voltage_to isa Absent || push!(_openapi_output, "rated_ac_voltage_to" => _openapi_value.rated_ac_voltage_to)
    _openapi_value.rated_dc_voltage isa Absent || push!(_openapi_output, "rated_dc_voltage" => _openapi_value.rated_dc_voltage)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.rating_from isa Absent || push!(_openapi_output, "rating_from" => _openapi_value.rating_from)
    _openapi_value.rating_to isa Absent || push!(_openapi_output, "rating_to" => _openapi_value.rating_to)
    _openapi_value.reactive_power_from isa Absent || push!(_openapi_output, "reactive_power_from" => _openapi_value.reactive_power_from)
    _openapi_value.reactive_power_limits_from isa Absent || push!(_openapi_output, "reactive_power_limits_from" => _openapi_value.reactive_power_limits_from)
    _openapi_value.reactive_power_limits_to isa Absent || push!(_openapi_output, "reactive_power_limits_to" => _openapi_value.reactive_power_limits_to)
    _openapi_value.reactive_power_to isa Absent || push!(_openapi_output, "reactive_power_to" => _openapi_value.reactive_power_to)
    _openapi_value.remote_bus_control_from isa Absent || push!(_openapi_output, "remote_bus_control_from" => _openapi_value.remote_bus_control_from)
    _openapi_value.remote_bus_control_to isa Absent || push!(_openapi_output, "remote_bus_control_to" => _openapi_value.remote_bus_control_to)
    _openapi_value.rmpct_from isa Absent || push!(_openapi_output, "rmpct_from" => _openapi_value.rmpct_from)
    _openapi_value.rmpct_to isa Absent || push!(_openapi_output, "rmpct_to" => _openapi_value.rmpct_to)
    _openapi_value.setpoint_voltage_units isa Absent || push!(_openapi_output, "setpoint_voltage_units" => _openapi_value.setpoint_voltage_units)
    _openapi_value.voltage_limits_from isa Absent || push!(_openapi_output, "voltage_limits_from" => _openapi_value.voltage_limits_from)
    _openapi_value.voltage_limits_to isa Absent || push!(_openapi_output, "voltage_limits_to" => _openapi_value.voltage_limits_to)
    _openapi_value.voltage_units isa Absent || push!(_openapi_output, "voltage_units" => _openapi_value.voltage_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
