# TwoTerminalVSCLine


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`arc`** | **`Int64`** | An Arc defining this line &#x60;from&#x60; a bus &#x60;to&#x60; another bus. | [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flowing from the from-bus to the to-bus in DC. Units: MW. | [default to nothing]
**`rating`** | **`Float64`** | Maximum output power rating of the converter. Units: MVA. | [default to nothing]
**`active_power_limits_from`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`active_power_limits_to`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`admittance_units`** | **`String`** | Unit basis for the series conductance g. | [optional] [default to "NATURAL_UNITS"]
**`g`** | **`Float64`** | Series conductance of the DC line. Per-unit on system base. Units: pu. Units: per admittance_units — SYSTEM_BASE: pu, NATURAL_UNITS: S, DEVICE_MVAR: MW . | [optional] [default to 0.0]
**`dc_current`** | **`Float64`** | DC current on the converter flowing in the DC line, from &#x60;from&#x60; bus to &#x60;to&#x60; bus. Units: A. | [optional] [default to 0.0]
**`reactive_power_from`** | **`Float64`** | Initial condition of reactive power flowing into the from-bus. Units: MVAr. | [optional] [default to 0.0]
**`dc_control_from`** | **`String`** | DC-side control mode of the &#x60;from&#x60; converter. | [optional] [default to "DC_VOLTAGE"]
**`ac_control_from`** | **`String`** | AC-side control mode of the &#x60;from&#x60; converter. | [optional] [default to "AC_VOLTAGE"]
**`dc_setpoint_from`** | **`Float64`** | Converter DC setpoint in the &#x60;from&#x60; bus converter. When &#x60;dc_control_from&#x60; regulates DC voltage this number is the DC voltage on the DC side of the converter; when it controls DC power this value is the power demand in MW, if positive the converter is supplying power to the AC network at the &#x60;from&#x60; bus; if negative, the converter is withdrawing power from the AC network at the &#x60;from&#x60; bus. Units: per dc_control_from — DC_POWER: MW, DC_VOLTAGE: (per voltage_units — SYSTEM_BASE: pu, NATURAL_UNITS: kV), DC_VOLTAGE_DROOP: (per voltage_units — SYSTEM_BASE: pu, NATURAL_UNITS: kV) . | [optional] [default to 0.0]
**`ac_setpoint_from`** | **`Float64`** | Converter AC setpoint in the &#x60;from&#x60; bus converter. When &#x60;ac_control_from&#x60; regulates AC voltage this number is the AC voltage on the AC side of the converter; when it controls reactive power this value is the power factor setpoint. Units: per ac_control_from — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per voltage_units — SYSTEM_BASE: pu, NATURAL_UNITS: kV) . | [optional] [default to 1.0]
**`converter_loss_from`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [optional] [default to nothing]
**`max_dc_current_from`** | **`Float64`** | Maximum stable dc current limits. Units: A. | [optional] [default to 100000000]
**`rating_from`** | **`Float64`** | Converter rating in the &#x60;from&#x60; bus. Units: MVA. | [optional] [default to 100000000]
**`reactive_power_limits_from`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`power_factor_weighting_fraction_from`** | **`Float64`** | Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1. | [optional] [default to 1.0]
**`voltage_units`** | **`String`** | Unit basis for the DC bus voltage limits. SYSTEM_BASE: per-unit on the bus base voltage. NATURAL_UNITS: kV. | [optional] [default to "NATURAL_UNITS"]
**`voltage_limits_from`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`dc_voltage_droop_from`** | **`Float64`** | DC-voltage droop gain on the &#x60;from&#x60; converter, used when &#x60;dc_control_from&#x60; is &#x60;DC_VOLTAGE_DROOP&#x60;: &#x60;V_dc &#x3D; dc_setpoint_from - dc_voltage_droop_from * P_c&#x60;. Units: pu. | [optional] [default to 0.0]
**`reactive_power_to`** | **`Float64`** | Initial condition of reactive power flowing into the to-bus. Units: MVAr. | [optional] [default to 0.0]
**`dc_control_to`** | **`String`** | DC-side control mode of the &#x60;to&#x60; converter. | [optional] [default to "DC_VOLTAGE"]
**`ac_control_to`** | **`String`** | AC-side control mode of the &#x60;to&#x60; converter. | [optional] [default to "AC_VOLTAGE"]
**`dc_setpoint_to`** | **`Float64`** | Converter DC setpoint in the &#x60;to&#x60; bus converter. When &#x60;dc_control_to&#x60; regulates DC voltage this number is the DC voltage on the DC side of the converter; when it controls DC power this value is the power demand in MW, if positive the converter is supplying power to the AC network at the &#x60;to&#x60; bus; if negative, the converter is withdrawing power from the AC network at the &#x60;to&#x60; bus. Units: per dc_control_to — DC_POWER: MW, DC_VOLTAGE: (per voltage_units — SYSTEM_BASE: pu, NATURAL_UNITS: kV), DC_VOLTAGE_DROOP: (per voltage_units — SYSTEM_BASE: pu, NATURAL_UNITS: kV) . | [optional] [default to 0.0]
**`ac_setpoint_to`** | **`Float64`** | Converter AC setpoint in the &#x60;to&#x60; bus converter. When &#x60;ac_control_to&#x60; regulates AC voltage this number is the AC voltage on the AC side of the converter; when it controls reactive power this value is the power factor setpoint. Units: per ac_control_to — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per voltage_units — SYSTEM_BASE: pu, NATURAL_UNITS: kV) . | [optional] [default to 1.0]
**`converter_loss_to`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [optional] [default to nothing]
**`max_dc_current_to`** | **`Float64`** | Maximum stable dc current limits. Units: A. | [optional] [default to 100000000]
**`rating_to`** | **`Float64`** | Converter rating in the &#x60;to&#x60; bus. Units: MVA. | [optional] [default to 100000000]
**`reactive_power_limits_to`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`power_factor_weighting_fraction_to`** | **`Float64`** | Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1. | [optional] [default to 1.0]
**`voltage_limits_to`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`dc_voltage_droop_to`** | **`Float64`** | DC-voltage droop gain on the &#x60;to&#x60; converter, used when &#x60;dc_control_to&#x60; is &#x60;DC_VOLTAGE_DROOP&#x60;: &#x60;V_dc &#x3D; dc_setpoint_to - dc_voltage_droop_to * P_c&#x60;. Units: pu. | [optional] [default to 0.0]
**`rated_dc_voltage`** | **`Float64`** | Rated (base) DC voltage of the link in kV. Used as the DC voltage base for interpreting DC-voltage setpoints; 0.0 means unspecified (DC-voltage setpoints are taken as per-unit directly). Units: kV. | [optional] [default to 0.0]
**`remote_bus_control_from`** | **`Int64`** | Number of the AC bus whose voltage the &#x60;from&#x60; converter regulates when &#x60;ac_control_from&#x60; is &#x60;AC_VOLTAGE&#x60;; null regulates its own terminal bus. | [optional] [default to nothing]
**`remote_bus_control_to`** | **`Int64`** | Number of the AC bus whose voltage the &#x60;to&#x60; converter regulates when &#x60;ac_control_to&#x60; is &#x60;AC_VOLTAGE&#x60;; null regulates its own terminal bus. | [optional] [default to nothing]
**`rmpct_from`** | **`Float64`** | Percent of the total Mvar required to hold the voltage at the bus regulated by the &#x60;from&#x60; converter that is contributed by this converter. Units: 1. | [optional] [default to 100.0]
**`rmpct_to`** | **`Float64`** | Percent of the total Mvar required to hold the voltage at the bus regulated by the &#x60;to&#x60; converter that is contributed by this converter. Units: 1. | [optional] [default to 100.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


