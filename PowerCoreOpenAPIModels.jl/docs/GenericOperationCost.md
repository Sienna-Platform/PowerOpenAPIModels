# GenericOperationCost

Operating cost of a generation technology, selected by `cost_type` among the thermal (`THERMAL`), renewable (`RENEWABLE`), and hydro (`HYDRO_GEN`) generation cost representations.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{HydroGenerationCost,RenewableGenerationCost,ThermalGenerationCost}`** |  | [required]
