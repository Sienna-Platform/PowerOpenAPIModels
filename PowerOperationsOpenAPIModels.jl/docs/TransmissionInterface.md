# TransmissionInterface

A collection of transmission branches whose combined flow is monitored and constrained as an interface.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow_limits`** | **`MinMax`** | Minimum and maximum active power flow limits on the interface. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`direction_mapping`** | **`Union{Absent,Nothing,TransmissionInterfaceDirectionMapping}`** | Dictionary of the line `name`s in the interface and their direction of flow (1 or -1) relative to the flow of the interface. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`violation_penalty`** | **`Union{Absent,Float64,Nothing}`** | Penalty cost for violating the flow limits in the interface. | [optional]
