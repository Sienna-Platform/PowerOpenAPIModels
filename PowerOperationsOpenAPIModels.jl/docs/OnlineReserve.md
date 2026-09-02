# OnlineReserve

A reserve product provided by devices already synchronized with the system. The procurement requirement is static unless a `requirement` time series is attached, in which case `requirement` is the scaling factor. Attach an Operating Reserve Demand Curve through `variable` to price the requirement rather than enforce it; omit `variable` when the reserve has no demand curve.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`deployed_fraction`** | **`Union{Absent,Float64,Nothing}`** | Fraction of service procurement that is assumed to be actually deployed. Most commonly, this is assumed to be either 0.0 or 1.0. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_output_fraction`** | **`Union{Absent,Float64,Nothing}`** | The maximum fraction of each device's output that can be assigned to the service. | [optional]
**`max_participation_factor`** | **`Union{Absent,Float64,Nothing}`** | The maximum portion [0, 1.0] of the reserve that can be contributed per device. | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`requirement`** | **`Union{Absent,Float64,Nothing}`** | The value of required reserves. Units: MW. | [optional]
**`reserve_direction`** | **`OnlineReserveReserveDirection`** | Whether the reserve is an upward, downward, or symmetric reserve product. | [required]
**`sustained_time`** | **`Union{Absent,Float64,Nothing}`** | The time reserve contribution must be sustained at a specified level. Units: min. | [optional]
**`time_frame`** | **`Float64`** | The saturation time frame to provide reserve contribution. Units: min. | [required]
**`variable`** | **`Union{Absent,Nothing,OnlineReserveVariable}`** | Operating reserve demand curve, either static or time-series-backed. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the reserve has no demand curve. | [optional]
