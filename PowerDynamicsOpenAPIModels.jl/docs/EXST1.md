# EXST1

IEEE Type ST1 Excitation System (PTI version)

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant. Units: s. | [required]
**`vi_lim`** | **`MinMax`** | Voltage input limits | [required]
**`tc`** | **`Float64`** | Numerator lead-lag (lead) time constant. Units: s. | [required]
**`tb`** | **`Float64`** | Denominator lead-lag (lag) time constant. Units: s. | [required]
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`ta`** | **`Float64`** | Amplifier time constant. Units: s. | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`kc`** | **`Float64`** | Current field constant limiter multiplier | [required]
**`kf`** | **`Float64`** | Excitation control system stabilizer gain | [required]
**`tf`** | **`Float64`** | Excitation control system stabilizer time constant. Units: s. | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
