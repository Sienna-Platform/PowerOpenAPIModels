# ESAC6A

This excitation systems consists of an alternator main exciter feeding its output via non-controlled rectifiers. The exciter does not employ self-excitation, and the voltage regulator power is taken from a source that is not affected by external transients. Parameters of IEEE Std 421.5 Type AC6A Excitacion System. ESAC6A in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`ka`** | **`Float64`** | Regulator output gain | [required]
**`kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`kd`** | **`Float64`** | Demagnetizing factor, function of exciter alternator reactances | [required]
**`ke`** | **`Float64`** | Exciter field proportional constant | [required]
**`kh`** | **`Float64`** | Exciter field current regulator feedback gain | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`ta`** | **`Float64`** | Regulator output lag time constant | [required]
**`tb`** | **`Float64`** | Regulator denominator (lag) time constant | [required]
**`tc`** | **`Float64`** | Regulator numerator (lead) time constant | [required]
**`te`** | **`Float64`** | Exciter field time constant | [required]
**`th`** | **`Float64`** | Exciter field current limiter denominator (lag) time constant | [required]
**`tj`** | **`Float64`** | Exciter field current limiter (lead) time constant | [required]
**`tk`** | **`Float64`** | Voltage regulator lead time constant | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`vfe_lim`** | **`Float64`** | Exciter field current limiter reference | [required]
**`vh_max`** | **`Float64`** | Exciter field current limiter maximum output | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`va_lim`** | **`MinMax`** | Limits for regulator output | [required]
**`vr_lim`** | **`MinMax`** | Limits for excitor field voltage | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
