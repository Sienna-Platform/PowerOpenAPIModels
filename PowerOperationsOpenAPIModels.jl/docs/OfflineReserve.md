# OfflineReserve

A non-spinning reserve from devices not synchronized but able to come online quickly after a contingency. Upward only. The requirement is static unless a requirement time series is attached, in which case it is the scaling factor.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`deployed_fraction`** | **`Union{Absent,Float64,Nothing}`** | Fraction of service procurement that is assumed to be actually deployed. Most commonly, this is assumed to be either 0.0 or 1.0. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_output_fraction`** | **`Union{Absent,Float64,Nothing}`** | The maximum fraction of each device's output that can be assigned to the service. | [optional]
**`max_participation_factor`** | **`Union{Absent,Float64,Nothing}`** | The maximum portion [0, 1.0] of the reserve that can be contributed per device. | [optional]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`requirement`** | **`Union{Absent,Float64,Nothing}`** | The value of required reserves. Units: MW. | [optional]
**`sustained_time`** | **`Union{Absent,Float64,Nothing}`** | The time reserve contribution must be sustained at a specified level. Units: min. | [optional]
**`time_frame`** | **`Float64`** | The saturation time frame to provide reserve contribution. Units: min. | [required]
**`variable`** | **`Union{Absent,CostCurve,Nothing}`** | Operating reserve demand curve, static or time-series-backed. Time series values are carried via `time_series_associations`. Omit if there is no demand curve. | [optional]
