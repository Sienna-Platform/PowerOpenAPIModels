# EXST1

IEEE Type ST1 Excitation System (PTI version)

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`kc`** | **`Float64`** | Current field constant limiter multiplier | [required]
**`kf`** | **`Float64`** | Excitation control system stabilizer gain | [required]
**`ta`** | **`Float64`** | Amplifier time constant | [required]
**`tb`** | **`Float64`** | Denominator lead-lag (lag) time constant | [required]
**`tc`** | **`Float64`** | Numerator lead-lag (lead) time constant | [required]
**`tf`** | **`Float64`** | Excitation control system stabilizer time constant | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`vi_lim`** | **`MinMax`** | Voltage input limits | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
