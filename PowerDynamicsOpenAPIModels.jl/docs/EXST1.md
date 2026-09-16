# EXST1

IEEE Type ST1 Excitation System (PTI version)

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`vi_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`tc`** | **`Float64`** | Numerator lead-lag (lead) time constant | [required]
**`tb`** | **`Float64`** | Denominator lead-lag (lag) time constant | [required]
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`ta`** | **`Float64`** | Amplifier time constant | [required]
**`vr_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`kc`** | **`Float64`** | Current field constant limiter multiplier | [required]
**`kf`** | **`Float64`** | Excitation control system stabilizer gain | [required]
**`tf`** | **`Float64`** | Excitation control system stabilizer time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
