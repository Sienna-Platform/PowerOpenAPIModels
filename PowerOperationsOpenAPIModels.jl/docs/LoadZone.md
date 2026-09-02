# LoadZone

A load zone for electricity price analysis. The load zone can be specified when defining each `ACBus` or `DCBus` in the zone.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`peak_active_power`** | **`Float64`** | Peak active power in the zone. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`peak_reactive_power`** | **`Float64`** | Peak reactive power in the zone. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`power_units`** | **`LoadZonePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
