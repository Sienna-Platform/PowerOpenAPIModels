# HydroReservoir


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [default to nothing]
**`name`** | **`String`** |  | [default to nothing]
**`available`** | **`Bool`** |  | [default to nothing]
**`storage_level_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`initial_level`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [default to nothing]
**`spillage_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`inflow`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [default to nothing]
**`outflow`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [default to nothing]
**`level_targets`** | **`Float64`** | in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [optional] [default to nothing]
**`intake_elevation`** | **`Float64`** | Units: m. | [default to nothing]
**`head_to_volume_factor`** | [**`*FunctionData4`**](FunctionData4.md) |  | [default to nothing]
**`upstream_turbines`** | **`Vector{Int64}`** |  | [optional] [default to nothing]
**`downstream_turbines`** | **`Vector{Int64}`** |  | [optional] [default to nothing]
**`upstream_reservoirs`** | **`Vector{Int64}`** |  | [optional] [default to nothing]
**`operation_cost`** | [**`*HydroReservoirOperationCost`**](HydroReservoirOperationCost.md) |  | [default to nothing]
**`evaporative_loss`** | **`Float64`** | Standing loss from evaporation as a fraction of the reservoir&#39;s stored volume/energy lost per hour. Units: 1. | [optional] [default to 0.0]
**`level_data_type`** | **`String`** |  | [optional] [default to "USABLE_VOLUME"]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


