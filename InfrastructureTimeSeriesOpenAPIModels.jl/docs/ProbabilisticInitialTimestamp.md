# ProbabilisticInitialTimestamp

Start of the first forecast window. Written in one of two RFC 3339 forms, with at most 3 fractional-second digits: `date-time`, with `Z` or a UTC offset, names an instant; `date-time-local`, with no offset, is a wall clock and names no instant. `time_reference` fixes the form: `zoneless` requires `date-time-local`, `utc` requires a zero offset, and a fixed offset or an IANA zone requires `date-time`. With no `time_reference`, either form is accepted and none is assumed.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{Dates.DateTime,TimeZones.ZonedDateTime}`** |  | [required]
