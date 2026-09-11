# GroupReserve

A reserve product met by a group of individual reserves. The group requirement is additional to each member's own; a device contributing to a member reserve also counts toward the group. Membership is carried by ServiceAssociation rows.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`requirement`** | **`Float64`** | The value of required reserves. Units: MW. | [required]
**`reserve_direction`** | **`ReserveDirection`** | Whether the reserve is an upward, downward, or symmetric reserve product. | [required]
**`variable`** | **`Union{Absent,CostCurve,Nothing}`** | Operating reserve demand curve for the group, static or time-series-backed. A curve makes the group elastic, priced rather than enforced. Omit if none. | [optional]
