# HybridSystem

A hybrid system co-locating a thermal unit, electric load, storage, and/or renewable unit behind a single grid interconnection.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization, which is commonly the same as `interconnection_rating`. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`electric_load`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of a load with supertype `ElectricLoad`, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`input_active_power_limits`** | **`Union{Absent,HybridSystemInputActivePowerLimits,Nothing}`** | Minimum and maximum stable input active power levels. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`interconnection_efficiency`** | **`Union{Absent,HybridSystemInterconnectionEfficiency,Nothing}`** | Efficiency [0, 1.0] at the grid interconnection to model losses `in` and `out` of the common DC-side conversion. Set to `null` if not applicable. | [optional]
**`interconnection_impedance`** | **`Union{Absent,HybridSystemInterconnectionImpedance,Nothing}`** | Impedance between the hybrid system and the grid interconnection. Per-unit on `base_power`. Units: pu. | [optional]
**`interconnection_rating`** | **`Union{Absent,Union{Float64,Nothing}}`** | Maximum rating of the hybrid system's interconnection with the transmission network. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`HybridSystemOperationCost`** | `MarketBidCost` of operating the hybrid system. | [required]
**`output_active_power_limits`** | **`Union{Absent,HybridSystemOutputActivePowerLimits,Nothing}`** | Minimum and maximum stable output active power levels. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`power_units`** | **`HybridSystemPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,HybridSystemReactivePowerLimits,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`renewable_unit`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of a renewable generator with supertype `RenewableGen`, if any. | [optional]
**`status`** | **`Bool`** | Initial commitment condition at the start of a simulation (`true` = on or `false` = off). | [required]
**`storage`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of an energy storage system with supertype `Storage`, if any. | [optional]
**`thermal_unit`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of a thermal generator with supertype `ThermalGen`, if any. | [optional]
