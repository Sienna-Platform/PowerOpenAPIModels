# RenewableEnergyConverterTypeA

Parameters of a renewable energy generator/converter model, this model corresponds to REGCA1 in PSSE.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`accel`** | **`Float64`** | Acceleration factor. | [required]
**`brkpt`** | **`Float64`** | LVPL characteristic voltage 2. | [required]
**`io_lim`** | **`Float64`** | Current limit for high voltage reactive current management (specified as a negative value). | [required]
**`iqr_lims`** | **`RenewableEnergyConverterTypeAIqrLims`** | Limit on rate of change for reactive current (Iqr_min, Iqr_max). | [required]
**`k_hv`** | **`Float64`** | Overvoltage compensation gain used in the high voltage reactive current management. | [required]
**`lv_pnts`** | **`RenewableEnergyConverterTypeALvPnts`** | Voltage points for low voltage active current management (Lvpnt0, Lvpnt1). | [required]
**`lvpl1`** | **`Float64`** | LVPL gain. | [required]
**`lvpl_sw`** | **`Bool`** | Low voltage power logic (LVPL) switch. (`false`: LVPL not present, `true`: LVPL present). | [required]
**`q_ref`** | **`Union{Absent,Float64,Nothing}`** | Initial condition of reactive power from power flow. | [optional]
**`r_source`** | **`Union{Absent,Float64,Nothing}`** | Output resistor used for the Thevenin Equivalent. | [optional]
**`rrpwr`** | **`Float64`** | Low Voltage Power Logic (LVPL) ramp rate limit. | [required]
**`t_fltr`** | **`Float64`** | Voltage filter time constant for low voltage active current management. Units: s. | [required]
**`t_g`** | **`Float64`** | Converter time constant. Units: s. | [required]
**`vo_lim`** | **`Float64`** | Voltage limit for high voltage reactive current management. | [required]
**`x_source`** | **`Union{Absent,Float64,Nothing}`** | Output reactance used for the Thevenin Equivalent. | [optional]
**`zerox`** | **`Float64`** | LVPL characteristic voltage 1. | [required]
