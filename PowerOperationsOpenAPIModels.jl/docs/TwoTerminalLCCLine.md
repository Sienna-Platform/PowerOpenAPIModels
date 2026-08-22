# TwoTerminalLCCLine


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`arc`** | **`Int64`** | An Arc defining this line &#x60;from&#x60; a rectifier bus &#x60;to&#x60; an inverter bus. The rectifier bus must be specified in the &#x60;from&#x60; bus and inverter bus in the &#x60;to&#x60; bus. | [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [default to nothing]
**`parameter_units`** | **`String`** | Unit basis for this line&#39;s impedance fields (r, rectifier/inverter rc/xc, capacitor reactances, compounding_resistance). | [optional] [default to "NATURAL_UNITS"]
**`r`** | **`Float64`** | Series resistance of the DC line. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [default to nothing]
**`transfer_setpoint`** | **`Float64`** | Desired set-point of power. If &#x60;power_mode &#x3D; true&#x60; this value is in MW units, and if &#x60;power_mode &#x3D; false&#x60; is in Amperes units. This parameter must not be specified in per-unit. A positive value represents the desired consumed power at the rectifier bus, while a negative value represents the desired power at the inverter bus (i.e. the absolute value of &#x60;transfer_setpoint&#x60; is the generated power at the inverter bus). Units: per power_mode — true: MW, false: A . | [default to nothing]
**`dc_voltage_units`** | **`String`** | Unit basis for the DC voltage fields (scheduled_dc_voltage, switch_mode_voltage, min_compounding_voltage). | [optional] [default to "NATURAL_UNITS"]
**`scheduled_dc_voltage`** | **`Float64`** | Scheduled compounded DC voltage. By default this parameter is the scheduled DC voltage in the inverter bus. This parameter must not be specified in per-unit. Units: kV. Units: per dc_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [default to nothing]
**`rectifier_bridges`** | **`Int64`** | Number of bridges in series in the rectifier side. | [default to nothing]
**`rectifier_delay_angle_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`rectifier_rc`** | **`Float64`** | Rectifier commutating transformer resistance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [default to nothing]
**`rectifier_xc`** | **`Float64`** | Rectifier commutating transformer reactance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [default to nothing]
**`rectifier_base_voltage`** | **`Float64`** | Rectifier primary base AC voltage, entered in kV. Units: kV. | [default to nothing]
**`inverter_bridges`** | **`Int64`** | Number of bridges in series in the inverter side. | [default to nothing]
**`inverter_extinction_angle_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`inverter_rc`** | **`Float64`** | Inverter commutating transformer resistance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [default to nothing]
**`inverter_xc`** | **`Float64`** | Inverter commutating transformer reactance per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [default to nothing]
**`inverter_base_voltage`** | **`Float64`** | Inverter primary base AC voltage, entered in kV. Units: kV. | [default to nothing]
**`power_mode`** | **`Bool`** | Boolean flag to identify if the LCC line is in power mode or current mode. If &#x60;power_mode &#x3D; true&#x60;, setpoint values must be specified in MW, and if &#x60;power_mode &#x3D; false&#x60; setpoint values must be specified in Amperes. | [optional] [default to true]
**`switch_mode_voltage`** | **`Float64`** | Mode switch DC voltage. This parameter must not be added in per-unit. If LCC line is in power mode control, and DC voltage falls below this value, the line switch to current mode control. Units: kV. Units: per dc_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [optional] [default to 0.0]
**`compounding_resistance`** | **`Float64`** | Compounding Resistance. This parameter is for control of the DC voltage in the rectifier or inverter end. For inverter DC voltage control, the parameter is set to zero; for rectifier DC voltage control, the parameter is set to the DC line resistance; otherwise, set to a fraction of the DC line resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional] [default to 0.0]
**`min_compounding_voltage`** | **`Float64`** | Minimum compounded voltage. This parameter must not be added in per-unit. Only used in constant gamma operation (gamma_min &#x3D; gamma_max), and the AC transformer is used to control the DC voltage. Units: kV. Units: per dc_voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [optional] [default to 0.0]
**`rectifier_transformer_ratio`** | **`Float64`** | Rectifier transformer ratio between the primary and secondary side AC voltages. Units: 1. | [optional] [default to 1.0]
**`rectifier_tap_setting`** | **`Float64`** | Rectifier transformer tap setting. Units: 1. | [optional] [default to 1.0]
**`rectifier_tap_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`rectifier_tap_step`** | **`Float64`** | Rectifier transformer tap step value. Units: 1. | [optional] [default to 0.00625]
**`rectifier_delay_angle`** | **`Float64`** | Rectifier firing delay angle (alpha). Units: rad. | [optional] [default to 0.0]
**`rectifier_capacitor_reactance`** | **`Float64`** | Commutating rectifier capacitor reactance magnitude per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional] [default to 0.0]
**`inverter_transformer_ratio`** | **`Float64`** | Inverter transformer ratio between the primary and secondary side AC voltages. Units: 1. | [optional] [default to 1.0]
**`inverter_tap_setting`** | **`Float64`** | Inverter transformer tap setting. Units: 1. | [optional] [default to 1.0]
**`inverter_tap_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`inverter_tap_step`** | **`Float64`** | Inverter transformer tap step value. Units: 1. | [optional] [default to 0.00625]
**`inverter_extinction_angle`** | **`Float64`** | Inverter extinction angle (gamma). Units: rad. | [optional] [default to 0.0]
**`inverter_capacitor_reactance`** | **`Float64`** | Commutating inverter capacitor reactance magnitude per bridge. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional] [default to 0.0]
**`active_power_limits_from`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`active_power_limits_to`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`reactive_power_limits_from`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`reactive_power_limits_to`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`loss`** | [**`*TwoTerminalLoss`**](TwoTerminalLoss.md) |  | [optional] [default to nothing]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component&#39;s per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


