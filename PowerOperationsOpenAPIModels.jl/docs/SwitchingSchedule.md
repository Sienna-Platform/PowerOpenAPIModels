# SwitchingSchedule

Supplemental attribute naming the time series that schedules the open or closed state of the switches it is attached to. Schedule values: 1 = closed, 0 = open.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`status_schedule`** | **`String`** | Name of the time series, stored on this attribute, that carries the switch status schedule. | [required]
**`identifier`** | **`Union{Absent,Union{Nothing,String}}`** | Optional user-supplied identifier for the schedule, such as a name or a switching plan id. Null when not set. | [optional]
