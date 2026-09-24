# VoltageControlAssociation

Links a voltage control group (a VoltageDroopControl or a ReactivePowerSharing attribute) to one member device and records the member's relative reactive power weight. One row per (control, member). `entity_id` names a device that regulates voltage to a setpoint; `terminal` picks the converter for a two-terminal member (a TwoTerminalVSCLine) and is null for every other member. A device, or a two-terminal line's converter, belongs to at most one group of either kind. PSS/E RMPCT imports as weight = RMPCT / 100, so the PSS/E default of 100 is the default weight of 1.0.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`control_id`** | **`Int64`** | ID of the VoltageDroopControl or ReactivePowerSharing attribute the member belongs to. | [required]
**`entity_id`** | **`Int64`** | ID of the member device. | [required]
**`weight`** | **`Union{Absent,Float64,Nothing}`** | Positive relative weight of this member. Its share of the reactive power required at the regulated bus is weight divided by the sum of the weights of the members in service. Units: 1. | [optional]
**`terminal`** | **`Union{Absent,Union{Nothing,VoltageControlTerminal}}`** | Converter of a two-terminal member this row refers to; required for a TwoTerminalVSCLine member and null for every other member. | [optional]
