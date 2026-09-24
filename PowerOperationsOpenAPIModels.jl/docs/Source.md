# Source

An infinite bus with a constant voltage output.

Commonly used in dynamics simulations to represent a very large machine on a single bus or for the representation of import/exports in operational simulations.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`remote_regulated_bus_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the bus whose voltage this unit regulates when that bus is not its own (PSS/E IREG). Null means the unit regulates the bus it is connected to; a value equal to that bus is invalid, so local regulation has exactly one representation. An available voltage droop controller the unit belongs to overrides this target. | [optional]
**`voltage_setpoint_units`** | **`Union{Absent,Nothing,VoltageUnitBasis}`** | Unit basis for voltage_setpoint. COMPONENT_BASE (per-unit on the base voltage of the bus the unit regulates) is PSS/E RAW native (VS). | [optional]
**`voltage_setpoint`** | **`Union{Absent,Float64,Nothing}`** | Voltage magnitude the unit holds at the bus it regulates while its bus type marks it as voltage regulating (PSS/E VS). Ignored while the unit belongs to an available voltage droop controller. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [optional]
**`active_power`** | **`Union{Absent,Float64,Nothing}`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`active_power_limits`** | **`Union{Absent,Nothing,MinMax}`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`reactive_power_limits`** | **`Union{Absent,Nothing,MinMax}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for this source's impedance fields (R_th, X_th). | [optional]
**`r_th`** | **`Union{Absent,Float64,Nothing}`** | Source Thevenin resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_th`** | **`Union{Absent,Float64,Nothing}`** | Source Thevenin reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`internal_voltage`** | **`Union{Absent,Float64,Nothing}`** | Internal voltage. Units: pu. | [optional]
**`internal_angle`** | **`Union{Absent,Float64,Nothing}`** | Internal angle. Units: rad. | [optional]
**`base_voltage`** | **`Union{Absent,Float64,Nothing}`** | The base voltage. Units: kV. | [optional]
**`base_power`** | **`Union{Absent,Float64,Nothing}`** | Base power of the unit for per unitization. Units: MVA. | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`operation_cost`** | **`SourceOperationCost`** | Cost of importing and exporting power at the source. or MarketBidCost | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
