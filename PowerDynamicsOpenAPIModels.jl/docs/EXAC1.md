# EXAC1

Modified ESAC1A. This excitation systems consists of an alternator main exciter feeding its output via non-controlled rectifiers. The exciter does not employ self-excitation, and the voltage regulator power is taken from a source that is not affected by external transients. Parameters of IEEE Std 421.5 Type AC1A. EXAC1 in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`tb`** | **`Float64`** | Regulator denominator (lag) time constant | [required]
**`tc`** | **`Float64`** | Regulator numerator (lead) time constant | [required]
**`ka`** | **`Float64`** | Regulator output gain | [required]
**`ta`** | **`Float64`** | Regulator output time constant | [required]
**`vr_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`te`** | **`Float64`** | Exciter field time constant | [required]
**`kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [required]
**`tf`** | **`Float64`** | Rate feedback time constant | [required]
**`kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`kd`** | **`Float64`** | Demagnetizing factor, function of exciter alternator reactances | [required]
**`ke`** | **`Float64`** | Exciter field proportional constant | [required]
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
