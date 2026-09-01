# HydroTurbine


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [default to nothing]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [default to nothing]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [default to nothing]
**`active_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`reactive_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [default to nothing]
**`power_units`** | **`String`** | Unit basis for this component&#39;s power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component&#39;s own base_power. NATURAL_UNITS: the field&#39;s physical unit. | [default to nothing]
**`operation_cost`** | [**`*HydroDispatchOperationCost`**](HydroDispatchOperationCost.md) |  | [default to nothing]
**`powerhouse_elevation`** | **`Float64`** | Height level above the sea level of the powerhouse on which the turbine is installed. Units: m. | [optional] [default to 0.0]
**`ramp_limits`** | [**`*UpDown`**](UpDown.md) |  | [optional] [default to nothing]
**`time_limits`** | [**`*UpDown`**](UpDown.md) |  | [optional] [default to nothing]
**`outflow_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`efficiency`** | **`Float64`** | Turbine efficiency [0, 1.0]. | [optional] [default to 1.0]
**`turbine_type`** | **`String`** | Type of the turbine. | [optional] [default to "UNKNOWN"]
**`conversion_factor`** | **`Float64`** | Conversion factor from flow/volume to energy: m^3 -&gt; p.u-hr. Units: 1. | [optional] [default to 1.0]
**`prime_mover_type`** | **`String`** | Prime mover technology according to EIA 923. | [optional] [default to "HY"]
**`travel_time`** | **`Float64`** | Downstream (from reservoir into turbine) travel time. Set to &#x60;null&#x60; if not applicable. Units: min. | [optional] [default to nothing]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


