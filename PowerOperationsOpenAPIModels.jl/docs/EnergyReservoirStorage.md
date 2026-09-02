# EnergyReservoirStorage

An energy storage device, modeled as a generic energy reservoir.

This is suitable for modeling storage charging and discharging with average efficiency losses, ignoring the physical dynamics of the storage unit. A variety of energy storage types and chemistries can be modeled with this approach. For pumped hydro storage, alternatively see `HydroPumpTurbine` and `HydroReservoir`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conversion_factor`** | **`Union{Absent,Float64,Nothing}`** | Conversion factor of `storage_capacity` to MWh, if different than 1.0. For example, X MWh/liter hydrogen. Units: 1. | [optional]
**`cycle_limits`** | **`Union{Absent,Int64,Nothing}`** | Storage Maximum number of cycles per year. Units: 1. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`efficiency`** | **`EnergyReservoirStorageEfficiency`** | Average efficiency [0, 1] `in` (charging/filling) and `out` (discharging/consuming) of the storage system. | [required]
**`energy_units`** | **`Union{Absent,EnergyReservoirStorageEnergyUnits,Nothing}`** | Unit basis for `storage_capacity`. MWH is the default interchange form; MWMIN records the same energy on the minutes basis used by operational durations. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`initial_storage_capacity_level`** | **`Float64`** | Initial storage capacity level as a ratio [0, 1.0] of `storage_capacity`. Units: 1. | [required]
**`input_active_power_limits`** | **`EnergyReservoirStorageInputActivePowerLimits`** | Minimum and maximum limits on the input active power (i.e., charging). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`EnergyReservoirStorageOperationCost`** | Operating cost of storage. or MarketBidCost | [required]
**`output_active_power_limits`** | **`EnergyReservoirStorageOutputActivePowerLimits`** | Minimum and maximum limits on the output active power (i.e., discharging). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`power_units`** | **`EnergyReservoirStoragePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`prime_mover_type`** | **`EnergyReservoirStoragePrimeMoverType`** | Prime mover technology according to EIA 923. | [required]
**`ramp_limits`** | **`Union{Absent,EnergyReservoirStorageRampLimits,Nothing}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,EnergyReservoirStorageReactivePowerLimits,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`self_discharge`** | **`Union{Absent,Float64,Nothing}`** | Self-discharge (leakage loss) as a fraction of the stored energy lost per minute (pu/min of storage_capacity), modeled as E[t] = (1 - self_discharge * dt) * E[t-1]; dt must be on the same minutes basis. Units: 1/min. | [optional]
**`standing_loss`** | **`Union{Absent,Float64,Nothing}`** | Constant standing-loss power drawn by the storage system. Reduces the effective charging power (p_in - standing_loss) and increases the power drawn from the storage when discharging (p_out + standing_loss). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`storage_capacity`** | **`Float64`** | Maximum storage capacity (can be in units of, e.g., MWh for batteries or liters for hydrogen). Divided by base_power this gives an approximate duration, assuming unity power factor: in hours under MWH, in minutes under MWMIN. Units: per energy_units — MWH: MWh, MWMIN: MWmin . | [required]
**`storage_level_limits`** | **`EnergyReservoirStorageStorageLevelLimits`** | Minimum and maximum allowable storage levels [0, 1], which can be used to model derates or other restrictions, such as state-of-charge restrictions on battery cycling. | [required]
**`storage_target`** | **`Union{Absent,Float64,Nothing}`** | Storage target at the end of simulation as ratio of storage capacity. Units: 1. | [optional]
**`storage_technology_type`** | **`EnergyReservoirStorageStorageTechnologyType`** | Storage Technology Complementary to EIA 923. | [required]
