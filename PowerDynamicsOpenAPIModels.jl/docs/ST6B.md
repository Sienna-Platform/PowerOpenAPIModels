# ST6B

In these excitation systems, voltage (and also current in compounded systems) is transformed to an appropriate level. Rectifiers, either controlled or non-controlled, provide the necessary direct current for the generator field. Parameters of IEEE Std 421.5 Type ST6B Excitacion System. ST6B in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`i_lr`** | **`Float64`** | Exciter current limiter reference | [required]
**`k_ci`** | **`Float64`** | Exciter output current limit adjustment gain | [required]
**`k_da`** | **`Float64`** | Regulator derivative gain | [required]
**`k_ff`** | **`Float64`** | Pre-control gain of the inner loop field regulator | [required]
**`k_ia`** | **`Float64`** | Regulator integral gain | [required]
**`k_lr`** | **`Float64`** | Exciter output current limiter gain | [required]
**`k_m`** | **`Float64`** | Forward gain of the inner loop field regulator | [required]
**`k_pa`** | **`Float64`** | Regulator proportional gain | [required]
**`kg`** | **`Float64`** | Feedback gain constant of the inner loop field regulator | [required]
**`oel_flag`** | **`Int64`** | OEL Flag for ST6B: 1: before HV gate, 2: after HV gate | [required]
**`t_da`** | **`Float64`** | Voltage regulator derivative channel time constant | [required]
**`tg`** | **`Float64`** | Feedback time constant of the inner loop field voltage regulator | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`va_lim`** | **`MinMax`** | Regulator output limits | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
