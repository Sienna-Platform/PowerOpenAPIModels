# ST8C

In these excitation systems, voltage (and also current in compounded systems) is transformed to an appropriate level. Rectifiers, either controlled or non-controlled, provide the necessary direct current for the generator field. Parameters of IEEE Std 421.5 Type ST8C Excitacion System. ST8C in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ifd_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference field current set-point | [optional]
**`k_a`** | **`Float64`** | Field current regulator proportional gain | [required]
**`k_c1`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`k_c2`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [required]
**`k_f`** | **`Float64`** | Exciter field current feedback gain | [required]
**`k_i1`** | **`Float64`** | Potential circuit (current) gain coefficient | [required]
**`k_i2`** | **`Float64`** | Potential circuit (current) gain coefficient | [required]
**`k_ia`** | **`Float64`** | Field current regulator integral gain | [required]
**`k_ir`** | **`Float64`** | Regulator integral gain | [required]
**`k_p`** | **`Float64`** | Potential circuit (voltage) gain coefficient | [required]
**`k_pa`** | **`Float64`** | Field current regulator proportional gain | [required]
**`k_pr`** | **`Float64`** | Regulator proportional gain | [required]
**`oel_flag`** | **`Int64`** | OEL Flag for ST8C: <2: Summation at voltage error, 2: OEL takeover at gate | [required]
**`scl_flag`** | **`Int64`** | SCL Flag for ST8C: <2: Summation at voltage error, 2: SCL takeover at UEL and OEL gates | [required]
**`sw1_flag`** | **`Int64`** | SW1 Flag for power source selector for ST8C: <2: Source from generator terminal voltage, 2: Independent power source | [required]
**`t_a`** | **`Float64`** | Controlled rectifier bridge equivalent time constant | [required]
**`t_f`** | **`Float64`** | Field current feedback time constant | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`uel_flag`** | **`Int64`** | UEL Flag for ST8C: <2: Summation at voltage error, 2: UEL takeover at gate | [required]
**`vb1_max`** | **`Float64`** | Maximum available exciter voltage | [required]
**`vb2_max`** | **`Float64`** | Maximum available exciter voltage | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`va_lim`** | **`MinMax`** | Field current regulator output limits | [required]
**`vpi_lim`** | **`MinMax`** | Regulator input limits | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits | [required]
**`x_l`** | **`Float64`** | Reactance associated with potential source | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`theta_p`** | **`Float64`** | Potential circuit phase angle (degrees) | [required]
