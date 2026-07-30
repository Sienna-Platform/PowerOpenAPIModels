# EnergyReservoirStorage


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`prime_mover_type`** | **`String`** | Prime mover technology according to EIA 923. | [default to nothing]
**`storage_technology_type`** | **`String`** | Storage Technology Complementary to EIA 923. | [default to nothing]
**`storage_capacity`** | **`Float64`** | Maximum storage capacity (can be in units of, e.g., MWh for batteries or liters for hydrogen). When in MWh, this value divided by base_power gives an approximate duration in hours, assuming unity power factor. Units: MWh. | [default to nothing]
**`storage_level_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`initial_storage_capacity_level`** | **`Float64`** | Initial storage capacity level as a ratio [0, 1.0] of &#x60;storage_capacity&#x60;. Units: 1. | [default to nothing]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: MVA. | [default to nothing]
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: MW. | [default to nothing]
**`input_active_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`output_active_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`efficiency`** | [**`*InOut`**](InOut.md) |  | [default to nothing]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: MVAr. | [default to nothing]
**`reactive_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [default to nothing]
**`operation_cost`** | [**`*StorageCost`**](StorageCost.md) |  | [default to nothing]
**`conversion_factor`** | **`Float64`** | Conversion factor of &#x60;storage_capacity&#x60; to MWh, if different than 1.0. For example, X MWh/liter hydrogen. Units: 1. | [optional] [default to 1.0]
**`storage_target`** | **`Float64`** | Storage target at the end of simulation as ratio of storage capacity. Units: 1. | [optional] [default to 0.0]
**`cycle_limits`** | **`Int64`** | Storage Maximum number of cycles per year. Units: 1. | [optional] [default to 10000]
**`ramp_limits`** | [**`*UpDown`**](UpDown.md) |  | [optional] [default to nothing]
**`self_discharge`** | **`Float64`** | Self-discharge (leakage loss) as a fraction of the stored energy lost per hour (pu/hr of storage_capacity), modeled as E[t] &#x3D; (1 - self_discharge * dt) * E[t-1]. Units: 1. | [optional] [default to 0.0]
**`standing_loss`** | **`Float64`** | Constant standing-loss power drawn by the storage system. Reduces the effective charging power (p_in - standing_loss) and increases the power drawn from the storage when discharging (p_out + standing_loss). Units: MW. | [optional] [default to 0.0]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


