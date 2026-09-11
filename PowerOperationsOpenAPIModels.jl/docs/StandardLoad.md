# StandardLoad

A voltage-dependent ZIP load, used for dynamics modeling. Splits demand into Z (impedance), I (current), and P (power) terms. See ExponentialLoad for an exponential formulation, or PowerLoad for no voltage dependency.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the load for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,LoadConformity,Nothing}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
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
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
