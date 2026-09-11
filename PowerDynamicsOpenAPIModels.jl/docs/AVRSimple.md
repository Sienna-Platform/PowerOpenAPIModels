# AVRSimple

Parameters of a simple proportional AVR in the derivative of EMF i.e. an integrator controller on EMF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`kv`** | **`Float64`** | Proportional Gain | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Voltage Set-point | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
