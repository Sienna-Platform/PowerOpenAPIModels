# HydroReservoir

A hydropower reservoir feeding, or fed by, the turbines attached to it. Storage level, inflow, outflow, and spillage are recorded in the basis named by `level_data_type` — volume, head, or energy — and the upstream and downstream associations set the reservoir's place in a cascade.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** |  | [required]
**`downstream_turbines`** | **`Union{Absent,Nothing,Vector{Int64}}`** |  | [optional]
**`evaporative_loss`** | **`Union{Absent,Float64,Nothing}`** | Standing loss from evaporation as a fraction of the reservoir's stored volume/energy lost per hour. Units: 1. | [optional]
**`head_to_volume_factor`** | **`HydroReservoirHeadToVolumeFactor`** | `FunctionData` mapping reservoir head to stored volume. | [required]
**`id`** | **`Int64`** |  | [required]
**`inflow`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [required]
**`initial_level`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [required]
**`intake_elevation`** | **`Float64`** | Units: m. | [required]
**`level_data_type`** | **`Union{Absent,HydroReservoirLevelDataType,Nothing}`** |  | [optional]
**`level_targets`** | **`Union{Absent,Float64,Nothing}`** | in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [optional]
**`name`** | **`String`** |  | [required]
**`operation_cost`** | **`HydroReservoirOperationCost`** |  | [required]
**`outflow`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [required]
**`spillage_limits`** | **`Union{Absent,HydroReservoirSpillageLimits,Nothing}`** | in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [optional]
**`storage_level_limits`** | **`HydroReservoirStorageLevelLimits`** | Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [required]
**`upstream_reservoirs`** | **`Union{Absent,Nothing,Vector{Int64}}`** |  | [optional]
**`upstream_turbines`** | **`Union{Absent,Nothing,Vector{Int64}}`** |  | [optional]
