# DiscreteControlledACBranch

Used to represent switches and breakers connecting AC Buses.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`branch_status`** | **`Union{Absent,DiscreteControlledACBranchBranchStatus,Nothing}`** | Open or Close status. | [optional]
**`discrete_branch_type`** | **`Union{Absent,DiscreteControlledACBranchDiscreteBranchType,Nothing}`** | Type of discrete control. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`normal_branch_status`** | **`Union{Absent,DiscreteControlledACBranchNormalBranchStatus,Nothing}`** | Normal (as-designed) open or close status of the device. | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`r`** | **`Float64`** | Resistance. Per-unit on `base_power`, which records the system base. Units: pu. | [required]
**`rating`** | **`Float64`** | Thermal rating. Flow on the branch must be between -`rating` and `rating`. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`x`** | **`Float64`** | Reactance. Per-unit on `base_power`, which records the system base. Units: pu. | [required]
