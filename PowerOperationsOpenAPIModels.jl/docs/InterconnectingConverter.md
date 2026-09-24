# InterconnectingConverter

Interconnecting Power Converter (IPC) for transforming power from an ACBus to a DCBus.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus on the AC side of this converter. | [required]
**`dc_bus`** | **`Int64`** | ID of the bus on the DC side of this converter. | [required]
**`active_power`** | **`Float64`** | Active power on the DC side. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`rating`** | **`Float64`** | Maximum output power rating of the converter. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`MinMax`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`base_power`** | **`Float64`** | Base power of the converter for per unitization. Units: MVA. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`dc_current`** | **`Union{Absent,Float64,Nothing}`** | DC current on the converter. Units: A. | [optional]
**`max_dc_current`** | **`Union{Absent,Float64,Nothing}`** | Maximum stable dc current limits. Units: A. | [optional]
**`loss_function`** | **`Union{Absent,LossCurve,Nothing}`** | Linear or quadratic loss function with respect to the converter current. | [optional]
**`dc_control`** | **`Union{Absent,Nothing,VSCDCControlModes}`** | DC-side control mode of the converter. | [optional]
**`ac_control`** | **`Union{Absent,Nothing,VSCACControlModes}`** | AC-side control mode of the converter. | [optional]
**`voltage_setpoint_units`** | **`Union{Absent,Nothing,VoltageUnitBasis}`** | Unit basis for the DC/AC voltage setpoints. | [optional]
**`dc_setpoint`** | **`Union{Absent,Float64,Nothing}`** | DC-voltage target (when `dc_control` regulates DC voltage) or active-power order (otherwise). Units: per dc_control — DC_POWER: MW, DC_VOLTAGE: (per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu), DC_VOLTAGE_DROOP: (per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) . | [optional]
**`ac_setpoint`** | **`Union{Absent,Float64,Nothing}`** | AC-voltage magnitude target (when `ac_control` regulates AC voltage) or power factor setpoint (otherwise). Units: per ac_control — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) . | [optional]
**`dc_voltage_droop`** | **`Union{Absent,Float64,Nothing}`** | DC-voltage droop gain relating DC voltage to converter active power as `V_dc = dc_setpoint - dc_voltage_droop * P_c`. A value of 0.0 disables droop. Units: pu. | [optional]
**`remote_regulated_bus_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the AC bus whose voltage the converter regulates when `ac_control` is `AC_VOLTAGE` and that bus is not its own terminal bus. Null means the converter's own AC bus; a value equal to that bus is invalid. | [optional]
**`power_factor_weighting_fraction`** | **`Union{Absent,Float64,Nothing}`** | Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1. | [optional]
**`voltage_limits`** | **`Union{Absent,MinMax,Nothing}`** | Limits on the voltage at the DC bus in per unit. Units: pu. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
