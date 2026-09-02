# ColocatedSupplyStorageTechnology

Supply technology that supports storage co-located with wind and solar generation. Capital costs, operating costs, capacity limits, and lifetimes are carried separately for the solar, wind, storage, and inverter portions, which share one grid connection.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Union{Absent,Bool,Nothing}`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [optional]
**`capacity_energy_limits`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapacityEnergyLimits,Nothing}`** | Allowable installed energy capacity for the storage component. Units: MWh. | [optional]
**`capacity_limits_solar`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapacityLimitsSolar,Nothing}`** | Maximum allowable installed capacity for the solar component. Units: MW. | [optional]
**`capacity_limits_wind`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapacityLimitsWind,Nothing}`** | Maximum allowable installed capacity for the wind component. Units: MW. | [optional]
**`capacity_power_limits`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapacityPowerLimits,Nothing}`** | Allowable installed power capacity for the storage component. Units: MW. | [optional]
**`capital_costs_energy`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsEnergy,Nothing}`** | Capital costs for investing in the storage technology's energy capacity. Units: USD/MWh. | [optional]
**`capital_costs_inverter`** | **`ColocatedSupplyStorageTechnologyCapitalCostsInverter`** | Capital costs for investing in inverter capacity. Units: USD/MW. | [required]
**`capital_costs_power`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsPower,Nothing}`** | Capital costs for investing in the storage technology's charge/discharge capacity. Units: USD/MW. | [optional]
**`capital_costs_solar`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsSolar,Nothing}`** | Capital costs for investing in a solar technology. Units: USD/MW. | [optional]
**`capital_costs_wind`** | **`Union{Absent,ColocatedSupplyStorageTechnologyCapitalCostsWind,Nothing}`** | Capital costs for investing in a wind technology. Units: USD/MW. | [optional]
**`duration_limits`** | **`Union{Absent,ColocatedSupplyStorageTechnologyDurationLimits,Nothing}`** | Minimum and maximum duration limits for the storage component (minutes). Units: min. | [optional]
**`efficiency_storage`** | **`Union{Absent,ColocatedSupplyStorageTechnologyEfficiencyStorage,Nothing}`** | Efficiency of charging storage, fraction of total charge (in) and discharge (out) capacity. Units: 1. | [optional]
**`financial_data`** | **`ColocatedSupplyStorageTechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`inverter_efficiency`** | **`Float64`** | Efficiency of AC to DC conversion of inverter. Units: 1. | [required]
**`inverter_supply_ratio`** | **`Float64`** | Ratio of generation capacity to grid connection capacity. Units: 1. | [required]
**`lifetime_solar`** | **`Union{Absent,Int64,Nothing}`** | Maximum number of years the solar component can be active once installed. Units: yr. | [optional]
**`lifetime_storage`** | **`Union{Absent,Int64,Nothing}`** | Maximum number of years the storage component can be active once installed. Units: yr. | [optional]
**`lifetime_wind`** | **`Union{Absent,Int64,Nothing}`** | Maximum number of years the wind component can be active once installed. Units: yr. | [optional]
**`losses_storage`** | **`Union{Absent,Float64,Nothing}`** | Self-discharge of storage (fraction of stored energy per hour). Units: 1. | [optional]
**`max_inverter_capacity`** | **`Union{Absent,Float64,Nothing}`** | Limit on inverter capacity. Units: MW. | [optional]
**`min_inverter_capacity`** | **`Union{Absent,Float64,Nothing}`** | Minimum inverter capacity. Units: MW. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`operation_costs_energy`** | **`Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsEnergy,Nothing}`** | Fixed and variable O&M costs for the storage energy component. Units: USD/MWh. | [optional]
**`operation_costs_inverter`** | **`ColocatedSupplyStorageTechnologyOperationCostsInverter`** | Operational costs for using inverter in co-located systems. Units: USD/MWh. | [required]
**`operation_costs_power`** | **`Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsPower,Nothing}`** | Fixed and variable O&M costs for the storage power component. Units: USD/MWh. | [optional]
**`operation_costs_solar`** | **`Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsSolar,Nothing}`** | Fixed and variable O&M costs for the solar component. Units: USD/MWh. | [optional]
**`operation_costs_wind`** | **`Union{Absent,ColocatedSupplyStorageTechnologyOperationCostsWind,Nothing}`** | Fixed and variable O&M costs for the wind component. Units: USD/MWh. | [optional]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
