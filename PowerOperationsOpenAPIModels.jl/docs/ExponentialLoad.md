# ExponentialLoad

A voltage-dependent ZIP load, most commonly used for dynamics modeling. Models active power as P = P0 * V^alpha and reactive power as Q = Q0 * V^beta. See StandardLoad for a three-part formulation, or PowerLoad for no voltage dependency.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Active power coefficient, P0. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`alpha`** | **`Float64`** | Exponent relating voltage dependency for active power. 0 = constant power only, 1 = constant current only, and 2 = constant impedance only. | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`beta`** | **`Float64`** | Exponent relating voltage dependency for reactive power. 0 = constant power only, 1 = constant current only, and 2 = constant impedance only. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,LoadConformity,Nothing}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`reactive_power`** | **`Float64`** | Reactive power coefficient, Q0. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
