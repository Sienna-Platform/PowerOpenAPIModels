# EX4VSA

IEEE Excitation System for Voltage Security Assesment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`iflim`** | **`Float64`** | OEL field current limit | [required]
**`d`** | **`Float64`** | OEL parameter d | [required]
**`f`** | **`Float64`** | OEL parameter f | [required]
**`spar`** | **`Float64`** | OEL parameter Spar | [required]
**`k1`** | **`Float64`** | OEL delay time constant | [required]
**`k2`** | **`Float64`** | OEL parameter K2 | [required]
**`oel_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`g`** | **`Float64`** | AVR exciter gain | [required]
**`ta`** | **`Float64`** | Numerator lead-lag (lead) time constant | [required]
**`tb`** | **`Float64`** | Denominator lead-lag (lag) time constant | [required]
**`te`** | **`Float64`** | Exciter time constant | [required]
**`e_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
