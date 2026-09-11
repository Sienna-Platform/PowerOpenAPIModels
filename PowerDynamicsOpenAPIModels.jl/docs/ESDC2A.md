# ESDC2A

Used to represent field-controlled dc commutator exciters with continuously acting voltage regulators having power supplies derived from the generator or auxiliaries bus. Parameters of IEEE Std 421.5 Type DC2A Excitacion System. This model corresponds to ESDC2A in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`ke`** | **`Float64`** | Exciter constant related to self-excited field | [required]
**`kf`** | **`Float64`** | Excitation control system stabilizer gain | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`ta`** | **`Float64`** | Amplifier time constant | [required]
**`tb`** | **`Float64`** | Regulator input time constant | [required]
**`tc`** | **`Float64`** | Regulator input time constant | [required]
**`te`** | **`Float64`** | Exciter time constant, integration rate associated with exciter control | [required]
**`tf`** | **`Float64`** | Excitation control system stabilizer time constant | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`switch`** | **`Int64`** | switch | [required]
