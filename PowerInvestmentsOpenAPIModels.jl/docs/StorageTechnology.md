# StorageTechnology

Candidate storage technology in a region. Charge capacity, discharge capacity, and energy capacity are added independently, each with its own capital cost, unit size, and capacity limits; charge and discharge efficiency, self-discharge losses, and limits on the ratio of energy to discharge capacity complete the description.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`capacity_limits_charge`** | **`Union{Absent,Nothing,StorageTechnologyCapacityLimitsCharge}`** | Allowable installed power capacity for charging of a storage technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW. | [optional]
**`capacity_limits_discharge`** | **`Union{Absent,Nothing,StorageTechnologyCapacityLimitsDischarge}`** | Allowable installed power capacity for discharging of a storage technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW. | [optional]
**`capacity_limits_energy`** | **`Union{Absent,Nothing,StorageTechnologyCapacityLimitsEnergy}`** | Allowable installed energy capacity for a storage technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MWh. | [optional]
**`capital_costs`** | **`Union{Absent,Nothing,StorageCapitalCost}`** | Capital and interconnection cost for investing in a storage technology's charge, discharge, and energy capacity (charge and discharge in USD/MW, energy in USD/MWh). | [optional]
**`duration_limits`** | **`Union{Absent,Nothing,MinMax}`** | Minimum and maximum duration limits (energy to discharge capacity ratio) for a storage technology (minutes). Units: min. | [optional]
**`efficiency`** | **`Union{Absent,Nothing,InOut}`** | Efficiency of charging storage, fraction of total charge (in) and discharge (out) capacity. Units: 1. | [optional]
**`financial_data`** | **`TechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`lifetime`** | **`Union{Absent,Int64,Nothing}`** | Maximum number of years a technology can be active once installed. Units: yr. | [optional]
**`losses`** | **`Union{Absent,Float64,Nothing}`** | Self-discharge of storage (fraction of energy stored per hour). Units: 1. | [optional]
**`min_discharge_fraction`** | **`Union{Absent,Float64,Nothing}`** | Minimum discharge as a fraction of total discharge capacity. Units: 1. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`operation_costs`** | **`Union{Absent,Nothing,StorageTechnologyOperationCosts}`** | Fixed and variable O&M costs for a storage technology. Units: USD/MWh. | [optional]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`prime_mover_type`** | **`Union{Absent,Nothing,PrimeMovers}`** | Prime mover for generator. | [optional]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`storage_tech`** | **`StorageTech`** | Storage Technology Type. | [required]
**`unit_size_charge`** | **`Union{Absent,Float64,Nothing}`** | Used for discrete investment decisions. Unit size of charging capacity. Units: MW. | [optional]
**`unit_size_discharge`** | **`Union{Absent,Float64,Nothing}`** | Used for discrete investment decisions. Size of each unit of discharging capacity being built. Units: MW. | [optional]
**`unit_size_energy`** | **`Union{Absent,Float64,Nothing}`** | Used for discrete investment decisions. Size of each unit of energy capacity being built. Units: MWh. | [optional]
