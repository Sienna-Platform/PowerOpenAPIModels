# EXAC2

Modified AC2. This excitation systems consists of an alternator main exciter feeding its output via non-controlled rectifiers. The exciter does not employ self-excitation, and the voltage regulator power is taken from a source that is not affected by external transients. Parameters of IEEE Std 421.5 Type AC2A Excitacion System. The alternator main exciter is used, feeding its output via non-controlled rectifiers. The Type AC2C model is similar to that of Type AC1C except for the inclusion of exciter time constant compensation and exciter field current limiting elements. EXAC2 in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`ka`** | **`Float64`** | Regulator output gain | [required]
**`kb`** | **`Float64`** | Second stage regulator gain | [required]
**`kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`kd`** | **`Float64`** | Demagnetizing factor, function of exciter alternator reactances | [required]
**`ke`** | **`Float64`** | Exciter field proportional constant | [required]
**`kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [required]
**`kh`** | **`Float64`** | Exciter field current regulator feedback gain | [required]
**`kl`** | **`Float64`** | Exciter field current limiter gain | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`ta`** | **`Float64`** | Regulator output time constant | [required]
**`tb`** | **`Float64`** | Regulator denominator (lag) time constant | [required]
**`tc`** | **`Float64`** | Regulator numerator (lead) time constant | [required]
**`te`** | **`Float64`** | Exciter field time constant | [required]
**`tf`** | **`Float64`** | Rate feedback time constant | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`v_lr`** | **`Float64`** | Maximum exciter field current | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`va_lim`** | **`MinMax`** | Limits for regulator output | [required]
**`vr_lim`** | **`MinMax`** | Limits for exciter field voltage | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
