# TwoWindingTransformer


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`circuit`** | **`Int64`** | The &#x60;TransformerCircuit&#x60; carrying this transformer&#39;s series electrical data. | [default to nothing]
**`admittance_units`** | **`String`** | Unit basis for the magnetizing_shunt admittance. | [optional] [default to "DEVICE_BASE"]
**`magnetizing_shunt`** | [**`*ComplexNumber`**](ComplexNumber.md) |  | [optional] [default to nothing]
**`shunt_location`** | **`String`** | Placement of &#x60;magnetizing_shunt&#x60; on the two sides of the circuit arc. | [optional] [default to "PRIMARY"]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


