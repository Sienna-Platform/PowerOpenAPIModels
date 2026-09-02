# GroupReserve

A reserve product met by a group of individual reserves. The group requirement is additional to each member's own requirement, and a device contributing to a member reserve also counts toward the group. Membership is carried by `ServiceAssociation` rows, not by a field here.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`requirement`** | **`Float64`** | The value of required reserves. Units: MW. | [required]
**`reserve_direction`** | **`GroupReserveReserveDirection`** | Whether the reserve is an upward, downward, or symmetric reserve product. | [required]
**`variable`** | **`Union{Absent,GroupReserveVariable,Nothing}`** | Operating reserve demand curve for the group, either static or time-series-backed. A group carrying a curve is elastic: its requirement is priced by the curve rather than enforced. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the group has no demand curve. | [optional]
