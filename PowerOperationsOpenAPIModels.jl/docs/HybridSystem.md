# HybridSystem


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`status`** | **`Bool`** | Initial commitment condition at the start of a simulation (&#x60;true&#x60; &#x3D; on or &#x60;false&#x60; &#x3D; off). | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: MW. | [default to nothing]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: MVAr. | [default to nothing]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization, which is commonly the same as &#x60;interconnection_rating&#x60;. Units: MVA. | [default to nothing]
**`operation_cost`** | [**`*MarketBidCost`**](MarketBidCost.md) |  | [default to nothing]
**`thermal_unit`** | **`Int64`** | ID of a thermal generator with supertype &#x60;ThermalGen&#x60;, if any. | [optional] [default to nothing]
**`electric_load`** | **`Int64`** | ID of a load with supertype &#x60;ElectricLoad&#x60;, if any. | [optional] [default to nothing]
**`storage`** | **`Int64`** | ID of an energy storage system with supertype &#x60;Storage&#x60;, if any. | [optional] [default to nothing]
**`renewable_unit`** | **`Int64`** | ID of a renewable generator with supertype &#x60;RenewableGen&#x60;, if any. | [optional] [default to nothing]
**`interconnection_impedance`** | [**`*ComplexNumber1`**](ComplexNumber1.md) |  | [optional] [default to nothing]
**`interconnection_rating`** | **`Float64`** | Maximum rating of the hybrid system&#39;s interconnection with the transmission network. Set to &#x60;null&#x60; if not applicable. Units: MVA. | [optional] [default to nothing]
**`input_active_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`output_active_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`reactive_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`interconnection_efficiency`** | [**`*InOut1`**](InOut1.md) |  | [optional] [default to nothing]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


