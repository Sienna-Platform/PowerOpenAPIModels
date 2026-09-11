# EnergyReservoirStorage

An energy storage device modeled as a generic reservoir, suitable for charging and discharging with average efficiency losses across storage types and chemistries. For pumped hydro, see HydroPumpTurbine and HydroReservoir instead.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point. The steady-state operating point for power flow; an optional starting point for other solvers. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conversion_factor`** | **`Union{Absent,Float64,Nothing}`** | Conversion factor of `storage_capacity` to MWh, if different than 1.0. For example, X MWh/liter hydrogen. Units: 1. | [optional]
**`cycle_limits`** | **`Union{Absent,Int64,Nothing}`** | Storage Maximum number of cycles per year. Units: 1. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`efficiency`** | **`InOut`** | Average efficiency [0, 1] `in` (charging/filling) and `out` (discharging/consuming) of the storage system. | [required]
**`energy_units`** | **`Union{Absent,EnergyUnitBasis,Nothing}`** | Unit basis for `storage_capacity`. MWH is the default interchange form; MWMIN records the same energy on the minutes basis used by operational durations. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`initial_storage_capacity_level`** | **`Float64`** | Initial storage capacity level as a ratio [0, 1.0] of `storage_capacity`. Units: 1. | [required]
**`input_active_power_limits`** | **`MinMax`** | Minimum and maximum limits on the input active power (i.e., charging). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`operation_cost`** | **`EnergyReservoirStorageOperationCost`** | Operating cost of storage. or MarketBidCost | [required]
**`output_active_power_limits`** | **`MinMax`** | Minimum and maximum limits on the output active power (i.e., discharging). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`prime_mover_type`** | **`PrimeMovers`** | Prime mover technology according to EIA 923. | [required]
**`ramp_limits`** | **`Union{Absent,UpDown,Nothing}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`self_discharge`** | **`Union{Absent,Float64,Nothing}`** | Self-discharge (leakage) as a fraction of stored energy lost per minute, modeled as E[t] = (1 - self_discharge * dt) * E[t-1]; dt on the same minutes basis. Units: 1/min. | [optional]
**`standing_loss`** | **`Union{Absent,Float64,Nothing}`** | Constant standing-loss power drawn by the storage system: reduces effective charging power and increases power drawn when discharging. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`storage_capacity`** | **`Float64`** | Maximum storage capacity, e.g. MWh for batteries or liters for hydrogen. Divided by base_power gives an approximate duration at unity power factor. Units: per energy_units — MWH: MWh, MWMIN: MWmin . | [required]
**`storage_level_limits`** | **`MinMax`** | Minimum and maximum allowable storage levels [0, 1], usable to model derates or state-of-charge restrictions on cycling. | [required]
**`storage_target`** | **`Union{Absent,Float64,Nothing}`** | Storage target at the end of simulation as ratio of storage capacity. Units: 1. | [optional]
**`storage_technology_type`** | **`StorageTech`** | Storage Technology Complementary to EIA 923. | [required]
