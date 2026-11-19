# VoltageModeControl

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`kpv`** | **`Float64`** | voltage controller proportional gain | [required]
**`kiv`** | **`Float64`** | voltage controller integral gain | [required]
**`kffv`** | **`Float64`** | Binary variable to enable feed-forward gain of voltage | [required]
**`rv`** | **`Float64`** | virtual resistance | [required]
**`lv`** | **`Float64`** | virtual inductance | [required]
**`kpc`** | **`Float64`** | current controller proportional gain | [required]
**`kic`** | **`Float64`** | current controller integral gain | [required]
**`kffi`** | **`Float64`** | Binary variable to enable feed-forward gain of current | [required]
**`active_damping_filter_frequency`** | **`Float64`** | Active damping filter cutoff frequency, in natural units. Units: Hz. | [required]
**`kad`** | **`Float64`** | active damping gain | [required]
