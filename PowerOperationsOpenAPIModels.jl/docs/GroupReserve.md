# GroupReserve

A reserve product, or a limit, over a group of individual reserves: a device contributing to a member reserve also counts toward the group. A demand curve on `variable` prices the group, `max_requirement` caps the members' total, and `participation_bounds` bounds each member's share. Membership is carried by `ServiceAssociation` rows, not by a field here.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`requirement`** | **`Float64`** | The value of required reserves. Units: MW. | [required]
**`max_requirement`** | **`Union{Absent,Union{Float64,Nothing}}`** | The most the group's members may be awarded in total, scaled per step by a `max_requirement` time series when one is attached. Omit when the group has no cap. Units: MW. | [optional]
**`participation_bounds`** | **`Union{Absent,Nothing,Vector{Vector{Float64}}}`** | Per-member bounds on the members' awards, one `[member, min, max]` triple per bounded member. `member` is the component id of a member reserve (also a member through a `ServiceAssociation` row), written as a whole number, `min` a fraction of the group's requirement (0 for no floor) and `max` a fraction of its `max_requirement` (1 for no cap beyond the group's); fractions are finite and >= 0. A dimensionless `participation_bound_min` or `participation_bound_max` time series on the group with the feature `member` set to that id scales the fraction per step. Omit when the group has none. | [optional]
**`variable`** | **`Union{Absent,CostCurve,Nothing}`** | Operating reserve demand curve for the group, either static or time-series-backed. A group carrying a curve is elastic: its requirement is priced by the curve rather than enforced. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the group has no demand curve. | [optional]
**`reserve_direction`** | **`ReserveDirection`** | Whether the reserve is an upward, downward, or symmetric reserve product. | [required]
