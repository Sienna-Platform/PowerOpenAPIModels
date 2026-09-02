# AreaInterchange

Flow exchanged between Areas. This Interchange is agnostic to the lines connecting the areas. It does not substitute Interface which is the total flow across a group of lines.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`flow_limits`** | **`AreaInterchangeFlowLimits`** | Max flow between the areas. It ignores lines and other branches totals. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`from_area`** | **`Int64`** | Area from which the power is extracted. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`power_units`** | **`AreaInterchangePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`to_area`** | **`Int64`** | Area to which the power is injected. | [required]
