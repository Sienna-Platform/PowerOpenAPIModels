# TModelHVDCLine


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [default to nothing]
**`arc`** | **`Int64`** | An &#x60;Arc&#x60; defining this line &#x60;from&#x60; a bus &#x60;to&#x60; another bus. | [default to nothing]
**`parameter_units`** | **`String`** | Unit basis for this line&#39;s impedance field (r). | [optional] [default to "NATURAL_UNITS"]
**`base_current`** | **`Float64`** | Base current for per-unitization of this line&#39;s per-unit fields — this DC line per-unitizes against a current base, not a power base. Units: A. | [default to nothing]
**`r`** | **`Float64`** | Total series resistance, split equally on both sides of the shunt capacitance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [default to nothing]
**`l`** | **`Float64`** | Total series inductance, split equally on both sides of the shunt capacitance. Per-unit on this line&#39;s &#x60;base_current&#x60;. Units: pu. | [default to nothing]
**`c`** | **`Float64`** | Shunt capacitance. Per-unit on this line&#39;s &#x60;base_current&#x60;. Units: pu. | [default to nothing]
**`active_power_limits_from`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`active_power_limits_to`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


