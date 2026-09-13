# HydroReservoir

A hydropower reservoir feeding, or fed by, the turbines attached to it. Storage level, inflow, outflow, and spillage are recorded in the basis named by `level_data_type` — volume, head, or energy — and the upstream and downstream associations set the reservoir's place in a cascade.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`name`** | **`String`** |  | [required]
**`available`** | **`Bool`** |  | [required]
**`storage_level_limits`** | **`MinMax`** | Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [required]
**`initial_level`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [required]
**`spillage_limits`** | **`Union{Absent,MinMax,Nothing}`** | in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [optional]
**`inflow`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [required]
**`outflow`** | **`Float64`** | Units: per level_data_type — USABLE_VOLUME: m3/s, TOTAL_VOLUME: m3/s, HEAD: m/s, ENERGY: MW . | [required]
**`level_targets`** | **`Union{Absent,Float64,Nothing}`** | in psy5 a required param with an option to be nothing Units: per level_data_type — USABLE_VOLUME: m3, TOTAL_VOLUME: m3, HEAD: m, ENERGY: MWh . | [optional]
**`intake_elevation`** | **`Float64`** | Units: m. | [required]
**`head_to_volume_factor`** | **`FunctionData`** | `FunctionData` mapping reservoir head to stored volume. | [required]
**`upstream_turbines`** | **`Union{Absent,Nothing,Vector{Int64}}`** |  | [optional]
**`downstream_turbines`** | **`Union{Absent,Nothing,Vector{Int64}}`** |  | [optional]
**`upstream_reservoirs`** | **`Union{Absent,Nothing,Vector{Int64}}`** |  | [optional]
**`operation_cost`** | **`HydroReservoirOperationCost`** |  | [required]
**`evaporative_loss`** | **`Union{Absent,Float64,Nothing}`** | Standing loss from evaporation as a fraction of the reservoir's stored volume/energy lost per hour. Units: 1. | [optional]
**`level_data_type`** | **`Union{Absent,HydroReservoirLevelDataType,Nothing}`** |  | [optional]
