# EX4VSA

IEEE Excitation System for Voltage Security Assesment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`g`** | **`Float64`** | AVR exciter gain | [required]
**`iflim`** | **`Float64`** | OEL field current limit | [required]
**`k1`** | **`Float64`** | OEL delay time constant | [required]
**`k2`** | **`Float64`** | OEL parameter K2 | [required]
**`oel_lim`** | **`MinMax`** | OEL integrator limits | [required]
**`spar`** | **`Float64`** | OEL parameter Spar | [required]
**`ta`** | **`Float64`** | Numerator lead-lag (lead) time constant | [required]
**`tb`** | **`Float64`** | Denominator lead-lag (lag) time constant | [required]
**`te`** | **`Float64`** | Exciter time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`d`** | **`Float64`** | OEL parameter d | [required]
**`f`** | **`Float64`** | OEL parameter f | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
