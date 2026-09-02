# TwoTerminalVSCLineVoltageLimitsFrom

Limits on the Voltage at the DC `from` Bus in kV. The DC base voltage is the `dc_setpoint` of the converter with `dc_voltage_control` enabled; exactly one converter must control the DC voltage. Units: kV. Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`max`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`min`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
