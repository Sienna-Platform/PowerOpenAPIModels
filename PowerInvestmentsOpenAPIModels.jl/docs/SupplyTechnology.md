# SupplyTechnology

Candidate generation technology for a region: thermal or renewable. Carries capital and operating cost of new capacity plus operating characteristics: capacity limits, ramp and time limits, outage derating, fuel, and start-up fuel use.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Union{Absent,Bool,Nothing}`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [optional]
**`capacity_limits`** | **`Union{Absent,Nothing,SupplyTechnologyCapacityLimits}`** | Minimum and maximum allowable installed capacity: a single bound applied to all capacity, or a mapping from a stringified float key to the bound at that key. Units: MW. | [optional]
**`capital_costs`** | **`Union{Absent,CapitalCost,Nothing}`** | Capital and interconnection cost for investing in a technology (capital cost in USD/MW). | [optional]
**`cofire_level_limits`** | **`Union{Absent,Nothing,MinMaxByKey}`** | Minimum and maximum blending level of each fuel during normal generation process for multi-fuel generator. Units: 1. | [optional]
**`cofire_start_limits`** | **`Union{Absent,Nothing,MinMaxByKey}`** | Minimum and maximum blending level of each fuel during start-up process for multi-fuel generator. Units: 1. | [optional]
**`financial_data`** | **`TechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`fuel`** | **`Union{Absent,Nothing,Vector{ThermalFuels}}`** | Fuel type according to IEA. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`lifetime`** | **`Union{Absent,Int64,Nothing}`** | Maximum number of years a technology can be active once installed. Units: yr. | [optional]
**`min_generation_fraction`** | **`Union{Absent,Float64,Nothing}`** | Minimum generation as a fraction of total capacity. Units: 1. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`operation_costs`** | **`Union{Absent,Nothing,SupplyTechnologyOperationCosts}`** | Fixed and variable O&M costs for a technology. Units: USD/MWh. | [optional]
**`outage_factor`** | **`Union{Absent,Nothing,OutageFactors}`** | Planned and forced outage factors for a technology, each a fraction of total availability (the fraction of hours in a year the technology is unavailable). | [optional]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`prime_mover_type`** | **`Union{Absent,Nothing,PrimeMovers}`** | Prime mover for generator. | [optional]
**`ramp_limits`** | **`Union{Absent,Nothing,UpDown}`** | Maximum decrease and increase in output between operation periods. Units: MW/min. | [optional]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`start_fuel_mmbtu_per_mw`** | **`Union{Absent,Float64,Nothing}`** | Startup fuel use per MW of nameplate capacity of each generator. Units: MMBtu/MW. | [optional]
**`time_limits`** | **`Union{Absent,Nothing,UpDown}`** | Minimum amount of time a resource has to stay in the committed or shutdown state (minutes). Units: min. | [optional]
**`unit_size`** | **`Union{Absent,Float64,Nothing}`** | Used for discrete investment decisions. Size of each unit being built. Units: MW. | [optional]
