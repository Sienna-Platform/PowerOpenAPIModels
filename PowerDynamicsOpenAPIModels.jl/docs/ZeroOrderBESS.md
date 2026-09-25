# ZeroOrderBESS

Parameters for the DC-side with a Battery Energy Storage System from 'Grid-Coupled Dynamic Response of Battery-Driven Voltage Source Converters'

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`rated_voltage`** | **`Float64`** | Rated voltage (V) | [required]
**`rated_current`** | **`Float64`** | Rated current (A) | [required]
**`battery_voltage`** | **`Float64`** | Battery voltage | [required]
**`battery_resistance`** | **`Float64`** | Rated current (A) | [required]
**`dc_dc_inductor`** | **`Float64`** | DC/DC inductance | [required]
**`dc_link_capacitance`** | **`Float64`** | DC-link capacitance | [required]
**`fs`** | **`Float64`** | DC/DC converter switching frequency | [required]
**`kpv`** | **`Float64`** | Voltage controller proportional gain | [required]
**`kiv`** | **`Float64`** | Voltage controller integral gain | [required]
**`kpi`** | **`Float64`** | Current controller proportional gain | [required]
**`kii`** | **`Float64`** | Current controller integral gain | [required]
**`vdc_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference DC-voltage set-point | [optional]
