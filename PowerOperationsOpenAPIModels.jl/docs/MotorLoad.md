# MotorLoad

An induction-motor static load, representing the steady-state power draw of motor-driven demand.

This load models the aggregate real and reactive power consumed by induction motors, along with the motor technology parameters that characterize their electrical behavior. For a simple constant-power load with no motor characteristics, see `PowerLoad`. For voltage-dependent ZIP loads used in dynamics modeling, see `StandardLoad`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial steady-state active power demand. A positive value indicates power consumption. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`motor_technology`** | **`Union{Absent,MotorLoadMotorTechnology,Nothing}`** | AC Motor type. | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `MotorLoad`) must have unique names, but components of different types (e.g., `MotorLoad` and `ACBus`) can have the same name. | [required]
**`power_units`** | **`MotorLoadPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial steady-state reactive power demand. A positive value indicates reactive power consumption. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,MotorLoadReactivePowerLimits,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
