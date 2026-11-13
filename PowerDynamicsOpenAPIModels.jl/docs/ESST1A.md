# ESST1A

This excitation system supplies power through a transformer from the generator terminals and its regulated by a controlled rectifier (via thyristors). Parameters of IEEE Std 421.5 Type ST1A Excitacion System. ESST1A in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`uel_flags`** | **`Int64`** | Code input for Underexcitization limiter (UEL) entry | [required]
**`pss_flags`** | **`Int64`** | Code input for Power System Stabilizer (PSS) or (VOS) entry | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant. Units: s. | [required]
**`vi_lim`** | **`Vector{Float64}`** | Voltage error limits (regulator input) | [required]
**`tc`** | **`Float64`** | First regulator numerator (lead) time constant. Units: s. | [required]
**`tb`** | **`Float64`** | First regulator denominator (lag) time constant. Units: s. | [required]
**`tc1`** | **`Float64`** | Second regulator numerator (lead) time constant. Units: s. | [required]
**`tb1`** | **`Float64`** | Second regulator denominator (lag) time constant. Units: s. | [required]
**`ka`** | **`Float64`** | Voltage regulator gain | [required]
**`ta`** | **`Float64`** | Voltage regulator time constant. Units: s. | [required]
**`va_lim`** | **`MinMax`** | Limits for regulator output | [required]
**`vr_lim`** | **`MinMax`** | Limits for excitor output | [required]
**`kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`kf`** | **`Float64`** | Rate feedback gain | [required]
**`tf`** | **`Float64`** | Rate feedback time constant. Units: s. | [required]
**`k_lr`** | **`Float64`** | Exciter output current limiter gain | [required]
**`i_lr`** | **`Float64`** | Exciter output current limit reference | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
