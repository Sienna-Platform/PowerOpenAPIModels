# RenewableEnergyConverterTypeA


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`T_g`** | **`Float64`** | Converter time constant. Units: s. | [default to nothing]
**`Rrpwr`** | **`Float64`** | Low Voltage Power Logic (LVPL) ramp rate limit. | [default to nothing]
**`Brkpt`** | **`Float64`** | LVPL characteristic voltage 2. | [default to nothing]
**`Zerox`** | **`Float64`** | LVPL characteristic voltage 1. | [default to nothing]
**`Lvpl1`** | **`Float64`** | LVPL gain. | [default to nothing]
**`Vo_lim`** | **`Float64`** | Voltage limit for high voltage reactive current management. | [default to nothing]
**`Lv_pnts`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Io_lim`** | **`Float64`** | Current limit for high voltage reactive current management (specified as a negative value). | [default to nothing]
**`T_fltr`** | **`Float64`** | Voltage filter time constant for low voltage active current management. Units: s. | [default to nothing]
**`K_hv`** | **`Float64`** | Overvoltage compensation gain used in the high voltage reactive current management. | [default to nothing]
**`Iqr_lims`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Accel`** | **`Float64`** | Acceleration factor. | [default to nothing]
**`Lvpl_sw`** | **`Bool`** | Low voltage power logic (LVPL) switch. (&#x60;false&#x60;: LVPL not present, &#x60;true&#x60;: LVPL present). | [default to nothing]
**`Q_ref`** | **`Float64`** | Initial condition of reactive power from power flow. | [optional] [default to 1.0]
**`R_source`** | **`Float64`** | Output resistor used for the Thevenin Equivalent. | [optional] [default to 0.0]
**`X_source`** | **`Float64`** | Output reactance used for the Thevenin Equivalent. | [optional] [default to 100000.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


