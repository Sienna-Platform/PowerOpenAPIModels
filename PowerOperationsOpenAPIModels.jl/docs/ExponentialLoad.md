# ExponentialLoad

A voltage-dependent ZIP load, most commonly used for dynamics modeling.

An `ExponentialLoad` models active power as P = P0 * V^α and reactive power as Q = Q0 * V^β, where the exponents α and β select govern the voltage dependency. For an alternative three-part formulation of the ZIP model, see `StandardLoad`. For a simpler load model with no voltage dependency, see `PowerLoad`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Active power coefficient, P0. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`alpha`** | **`Float64`** | Exponent relating voltage dependency for active power. 0 = constant power only, 1 = constant current only, and 2 = constant impedance only. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`beta`** | **`Float64`** | Exponent relating voltage dependency for reactive power. 0 = constant power only, 1 = constant current only, and 2 = constant impedance only. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,ExponentialLoadConformity,Nothing}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`power_units`** | **`ExponentialLoadPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power`** | **`Float64`** | Reactive power coefficient, Q0. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
