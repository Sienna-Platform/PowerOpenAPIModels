# HybridSystem

A hybrid system co-locating a thermal unit, electric load, storage, and/or renewable unit behind a single grid interconnection.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point. The steady-state operating point for power flow; an optional starting point for other solvers. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization, which is commonly the same as `interconnection_rating`. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`electric_load`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of a load with supertype `ElectricLoad`, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`input_active_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum stable input active power levels. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`interconnection_efficiency`** | **`Union{Absent,InOut,Nothing}`** | Efficiency [0, 1.0] at the grid interconnection to model losses `in` and `out` of the common DC-side conversion. Set to `null` if not applicable. | [optional]
**`interconnection_impedance`** | **`Union{Absent,ComplexNumber,Nothing}`** | Impedance between the hybrid system and the grid interconnection. Per-unit on `base_power`. Units: pu. | [optional]
**`interconnection_rating`** | **`Union{Absent,Union{Float64,Nothing}}`** | Maximum rating of the hybrid system's interconnection with the transmission network. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`operation_cost`** | **`MarketBidCost`** | `MarketBidCost` of operating the hybrid system. | [required]
**`output_active_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum stable output active power levels. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`renewable_unit`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of a renewable generator with supertype `RenewableGen`, if any. | [optional]
**`status`** | **`OperationalStates`** | Operating state of the unit at the start of a simulation. | [required]
**`storage`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of an energy storage system with supertype `Storage`, if any. | [optional]
**`thermal_unit`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of a thermal generator with supertype `ThermalGen`, if any. | [optional]
