# InterruptibleStandardLoad

An interruptible, voltage-dependent ZIP load whose demand can be curtailed through demand response programs, subject to an interruption cost.

Like `StandardLoad`, it breaks the ZIP into three pieces: Z (constant impedance), I (constant current), and P (constant power), according to `P = P_P * V^0 + P_I * V^1 + P_Z * V^2` for active power and `Q = Q_P * V^0 + Q_I * V^1 + Q_Z * V^2` for reactive power. (Voltage V is in per unit.) Unlike `StandardLoad`, it carries an `operation_cost` for interrupting the load.

For a non-interruptible ZIP load, see `StandardLoad`. For an interruptible constant-power load, see `InterruptiblePowerLoad`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the load for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,InterruptibleStandardLoadConformity,Nothing}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
**`constant_active_power`** | **`Union{Absent,Float64,Nothing}`** | Constant active power demand (P_P). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`constant_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Constant reactive power demand (Q_P). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`current_active_power`** | **`Union{Absent,Float64,Nothing}`** | Active power coefficient for constant current load (P_I). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`current_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Reactive power coefficient for constant current load (Q_I). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`impedance_active_power`** | **`Union{Absent,Float64,Nothing}`** | Active power coefficient for constant impedance load (P_Z). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`impedance_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Reactive power coefficient for constant impedance load (Q_Z). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`max_constant_active_power`** | **`Union{Absent,Float64,Nothing}`** | Maximum active power drawn by constant power load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`max_constant_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Maximum reactive power drawn by constant power load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`max_current_active_power`** | **`Union{Absent,Float64,Nothing}`** | Maximum active power drawn by constant current load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`max_current_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Maximum reactive power drawn by constant current load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`max_impedance_active_power`** | **`Union{Absent,Float64,Nothing}`** | Maximum active power drawn by constant impedance load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`max_impedance_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Maximum reactive power drawn by constant impedance load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `InterruptibleStandardLoad`) must have unique names, but components of different types (e.g., `InterruptibleStandardLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`InterruptibleStandardLoadOperationCost`** | Operational cost of interrupting load. or MarketBidCost | [required]
**`power_units`** | **`InterruptibleStandardLoadPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
