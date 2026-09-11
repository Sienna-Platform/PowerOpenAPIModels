# ESST4B

In these excitation systems, voltage (and also current in compounded systems) is transformed to an appropriate level. Rectifiers, either controlled or non-controlled, provide the necessary direct current for the generator field. Parameters of IEEE Std 421.5 Type ST4B Excitacion System. ESST4B in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`k_im`** | **`Float64`** | Voltage regulator integral gain output | [required]
**`k_ir`** | **`Float64`** | Regulator integral gain | [required]
**`k_pm`** | **`Float64`** | Voltage regulator proportional gain output | [required]
**`k_pr`** | **`Float64`** | Regulator proportional gain | [required]
**`kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`kg`** | **`Float64`** | Feedback gain constant of the inner loop field regulator | [required]
**`ki`** | **`Float64`** | Compound circuit (current) gain coefficient | [required]
**`kp`** | **`Float64`** | Potential circuit (voltage) gain coefficient | [required]
**`ta`** | **`Float64`** | Voltage regulator time constant | [required]
**`vb_max`** | **`Float64`** | Maximum available exciter voltage | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`vm_lim`** | **`MinMax`** | Limits for inner loop output | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits | [required]
**`xl`** | **`Float64`** | Reactance associated with potential source | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`thetap`** | **`Float64`** | Potential circuit phase angle (degrees) | [required]
