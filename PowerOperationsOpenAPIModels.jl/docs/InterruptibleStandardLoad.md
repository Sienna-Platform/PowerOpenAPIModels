# InterruptibleStandardLoad


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;InterruptibleStandardLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;InterruptibleStandardLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`base_power`** | **`Float64`** | Base power of the load for per unitization. Units: MVA. | [default to nothing]
**`operation_cost`** | [**`*LoadCost`**](LoadCost.md) |  | [default to nothing]
**`conformity`** | **`String`** | Indicates whether the specified load is conforming or non-conforming. | [optional] [default to "UNDEFINED"]
**`constant_active_power`** | **`Float64`** | Constant active power demand (P_P). Units: MW. | [optional] [default to 0.0]
**`constant_reactive_power`** | **`Float64`** | Constant reactive power demand (Q_P). Units: MVAr. | [optional] [default to 0.0]
**`impedance_active_power`** | **`Float64`** | Active power coefficient for constant impedance load (P_Z). Units: MW. | [optional] [default to 0.0]
**`impedance_reactive_power`** | **`Float64`** | Reactive power coefficient for constant impedance load (Q_Z). Units: MVAr. | [optional] [default to 0.0]
**`current_active_power`** | **`Float64`** | Active power coefficient for constant current load (P_I). Units: MW. | [optional] [default to 0.0]
**`current_reactive_power`** | **`Float64`** | Reactive power coefficient for constant current load (Q_I). Units: MVAr. | [optional] [default to 0.0]
**`max_constant_active_power`** | **`Float64`** | Maximum active power drawn by constant power load. Units: MW. | [optional] [default to 0.0]
**`max_constant_reactive_power`** | **`Float64`** | Maximum reactive power drawn by constant power load. Units: MVAr. | [optional] [default to 0.0]
**`max_impedance_active_power`** | **`Float64`** | Maximum active power drawn by constant impedance load. Units: MW. | [optional] [default to 0.0]
**`max_impedance_reactive_power`** | **`Float64`** | Maximum reactive power drawn by constant impedance load. Units: MVAr. | [optional] [default to 0.0]
**`max_current_active_power`** | **`Float64`** | Maximum active power drawn by constant current load. Units: MW. | [optional] [default to 0.0]
**`max_current_reactive_power`** | **`Float64`** | Maximum reactive power drawn by constant current load. Units: MVAr. | [optional] [default to 0.0]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


