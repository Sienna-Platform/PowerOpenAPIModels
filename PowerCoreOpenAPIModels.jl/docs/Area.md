# Area

A collection of buses for control purposes. The `Area` can be specified when defining each `ACBus` or `DCBus` in the area.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`peak_active_power`** | **`Union{Absent,Float64,Nothing}`** | Peak active power in the area. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`peak_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Peak reactive power in the area. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`load_response`** | **`Union{Absent,Float64,Nothing}`** | Load-frequency damping parameter modeling how much the load in the area changes due to changes in frequency. Units: MW/Hz. | [optional]
**`scheduled_net_interchange`** | **`Union{Absent,Union{Float64,Nothing}}`** | Scheduled net active power interchange of the area (PSS/E PDES): the area's total export minus its total import that area interchange control holds. Positive means the area exports power. `null` when the area has no scheduled interchange; `0.0` is a valid schedule. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`out_of_area_load_ids`** | **`Union{Absent,Nothing,Vector{Int64}}`** | IDs of the loads that belong to this area but connect to a bus in another area (PSS/E off-area loads). When area interchange control includes these loads (PSS/E AREAIN=2), their demand counts in the net interchange of this area, not of the area of their bus. | [optional]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
