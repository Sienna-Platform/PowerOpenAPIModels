# DiscreteControlledACBranch

Used to represent switches and breakers connecting AC Buses.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`branch_status`** | **`Union{Absent,DiscreteControlledACBranchBranchStatus,Nothing}`** | Open or Close status. | [optional]
**`discrete_branch_type`** | **`Union{Absent,DiscreteControlledACBranchDiscreteBranchType,Nothing}`** | Type of discrete control. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`normal_branch_status`** | **`Union{Absent,DiscreteControlledACBranchNormalBranchStatus,Nothing}`** | Normal (as-designed) open or close status of the device. | [optional]
**`power_units`** | **`DiscreteControlledACBranchPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`r`** | **`Float64`** | Resistance. Per-unit on `base_power`, which records the system base. Units: pu. | [required]
**`rating`** | **`Float64`** | Thermal rating. Flow on the branch must be between -`rating` and `rating`. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`x`** | **`Float64`** | Reactance. Per-unit on `base_power`, which records the system base. Units: pu. | [required]
