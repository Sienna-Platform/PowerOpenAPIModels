# Source

An infinite bus with a constant voltage output.

Commonly used in dynamics simulations to represent a very large machine on a single bus or for the representation of import/exports in operational simulations.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`r_th`** | **`Union{Absent,Float64,Nothing}`** | Source Thevenin resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_th`** | **`Union{Absent,Float64,Nothing}`** | Source Thevenin reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`active_power`** | **`Union{Absent,Float64,Nothing}`** | Initial active power set point. The steady-state operating point for power flow; an optional starting point for other solvers. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`active_power_limits`** | **`Union{Absent,Nothing,MinMax}`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Union{Absent,Float64,Nothing}`** | Base power of the unit for per unitization. Units: MVA. | [optional]
**`base_voltage`** | **`Union{Absent,Float64,Nothing}`** | The base voltage. Units: kV. | [optional]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`internal_angle`** | **`Union{Absent,Float64,Nothing}`** | Internal angle. Units: rad. | [optional]
**`internal_voltage`** | **`Union{Absent,Float64,Nothing}`** | Internal voltage. Units: pu. | [optional]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`operation_cost`** | **`SourceOperationCost`** | Cost of importing and exporting power at the source. or MarketBidCost | [required]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for this source's impedance fields (R_th, X_th). | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`reactive_power_limits`** | **`Union{Absent,Nothing,MinMax}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
