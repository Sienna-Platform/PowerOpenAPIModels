# AreaInterchange

Flow exchanged between Areas. This Interchange is agnostic to the lines connecting the areas. It does not substitute Interface which is the total flow across a group of lines.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`flow_limits`** | **`FromToToFrom`** | Max flow between the areas. It ignores lines and other branches totals. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`from_area`** | **`Int64`** | Area from which the power is extracted. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`to_area`** | **`Int64`** | Area to which the power is injected. | [required]
