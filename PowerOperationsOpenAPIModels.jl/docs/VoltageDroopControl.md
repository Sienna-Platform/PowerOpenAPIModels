# VoltageDroopControl

Supplemental attribute for a voltage droop controller (PSS/E voltage droop control): a set of generators jointly regulating the reactive power at one bus along a Q–V characteristic. While the controller is available its regulated bus overrides each member's own target and their voltage setpoints are ignored; while it is unavailable the members fall back to their own targets. Membership and each member's relative reactive power weight are VoltageControlAssociation rows. The characteristic holds `reactive_power_limits.max` below `voltage_limits.min`, ramps to `deadband_reactive_power` at `deadband_voltage_limits.min`, holds it through `deadband_voltage_limits.max`, ramps to `reactive_power_limits.min` at `voltage_limits.max`, and holds it above.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this supplemental attribute. | [required]
**`name`** | **`String`** | Name of the voltage droop controller. | [required]
**`available`** | **`Union{Absent,Bool,Nothing}`** | Whether the controller is in service (PSS/E STATUS). While false, members regulate their own targets. | [optional]
**`regulated_bus_id`** | **`Int64`** | ID of the bus whose reactive power the controller regulates; overrides every member's own regulated bus while the controller is available. | [required]
**`reactive_power_limits`** | **`MinMax`** | Reactive power held below `voltage_limits.min` (max, PSS/E QMAX) and above `voltage_limits.max` (min, PSS/E QMIN). Units: MVAr. | [required]
**`deadband_reactive_power`** | **`Float64`** | Reactive power held while the regulated bus voltage is inside `deadband_voltage_limits` (PSS/E QDB). Must lie strictly between `reactive_power_limits.min` and `reactive_power_limits.max`. Units: MVAr. | [required]
**`voltage_units`** | **`Union{Absent,Nothing,VoltageUnitBasis}`** | Unit basis for the voltage fields. COMPONENT_BASE (per-unit on the regulated bus base voltage) is PSS/E RAW native. | [optional]
**`deadband_voltage_limits`** | **`MinMax`** | Voltage band inside which the controller holds `deadband_reactive_power` (PSS/E VDBLOW, VDBHIGH). Must lie inside `voltage_limits`. Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [required]
**`voltage_limits`** | **`MinMax`** | Voltages at which the characteristic reaches `reactive_power_limits.max` (min, PSS/E VLOW) and `reactive_power_limits.min` (max, PSS/E VHIGH). Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [required]
