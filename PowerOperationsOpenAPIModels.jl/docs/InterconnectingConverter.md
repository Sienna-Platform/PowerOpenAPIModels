# InterconnectingConverter


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus on the AC side of this converter. | [default to nothing]
**`dc_bus`** | **`Int64`** | ID of the bus on the DC side of this converter. | [default to nothing]
**`active_power`** | **`Float64`** | Active power on the DC side. Units: MW. | [default to nothing]
**`rating`** | **`Float64`** | Maximum output power rating of the converter. Units: MVA. | [default to nothing]
**`active_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`base_power`** | **`Float64`** | Base power of the converter for per unitization. Units: MVA. | [default to nothing]
**`reactive_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`dc_current`** | **`Float64`** | DC current on the converter. Units: A. | [optional] [default to 0.0]
**`max_dc_current`** | **`Float64`** | Maximum stable dc current limits. Units: A. | [optional] [default to 100000000]
**`loss_function`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [optional] [default to nothing]
**`dc_control`** | **`String`** | DC-side control mode of the converter. | [optional] [default to "DC_VOLTAGE"]
**`ac_control`** | **`String`** | AC-side control mode of the converter. | [optional] [default to "AC_REACTIVE_POWER"]
**`voltage_setpoint_units`** | **`String`** | Unit basis for the DC/AC voltage setpoints. | [optional] [default to "DEVICE_BASE"]
**`dc_setpoint`** | **`Float64`** | DC-voltage target (when &#x60;dc_control&#x60; regulates DC voltage) or active-power order (otherwise). Units: per dc_control — DC_POWER: MW, DC_VOLTAGE: (per voltage_setpoint_units — NATURAL_UNITS: kV, DEVICE_BASE: pu), DC_VOLTAGE_DROOP: (per voltage_setpoint_units — NATURAL_UNITS: kV, DEVICE_BASE: pu) . | [optional] [default to 0.0]
**`ac_setpoint`** | **`Float64`** | AC-voltage magnitude target (when &#x60;ac_control&#x60; regulates AC voltage) or power factor setpoint (otherwise). Units: per ac_control — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per voltage_setpoint_units — NATURAL_UNITS: kV, DEVICE_BASE: pu) . | [optional] [default to 1.0]
**`dc_voltage_droop`** | **`Float64`** | DC-voltage droop gain relating DC voltage to converter active power as &#x60;V_dc &#x3D; dc_setpoint - dc_voltage_droop * P_c&#x60;. A value of 0.0 disables droop. Units: pu. | [optional] [default to 0.0]
**`remote_bus_control`** | **`Int64`** | Number of the AC bus whose voltage the converter regulates when &#x60;ac_control&#x60; is &#x60;AC_VOLTAGE&#x60;; null regulates its own terminal bus. | [optional] [default to nothing]
**`rmpct`** | **`Float64`** | Percent of the total Mvar required to hold the voltage at the bus regulated by this converter that is contributed by this converter. Units: 1. | [optional] [default to 100.0]
**`power_factor_weighting_fraction`** | **`Float64`** | Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1. | [optional] [default to 1.0]
**`voltage_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


