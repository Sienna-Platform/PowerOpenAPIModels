# ACBus


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`number`** | **`Int64`** | A unique bus identification number (positive integer). | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. This field should not be confused with the ISOLATED enum value. | [default to nothing]
**`bustype`** | **`String`** | Used to describe the connectivity and behavior of this bus. in psy5 a required param with an option to be nothing | [optional] [default to nothing]
**`angle`** | **`Float64`** | Angle of the bus. Units: rad. | [optional] [default to nothing]
**`magnitude`** | **`Float64`** | Voltage as a multiple of &#x60;base_voltage&#x60;. Units: pu. | [optional] [default to nothing]
**`voltage_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`base_voltage`** | **`Float64`** | The base voltage. Units: kV. | [optional] [default to nothing]
**`area`** | **`Int64`** | ID of the area containing the bus. | [optional] [default to nothing]
**`load_zone`** | **`Int64`** | ID of the load zone containing the bus. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


