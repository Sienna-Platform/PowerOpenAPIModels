# LCLFilter

Parameters of a LCL filter outside the converter, the states are in the grid's reference frame

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`lf`** | **`Float64`** | Series inductance of converter filter. Units: pu. | [required]
**`rf`** | **`Float64`** | Series resistance of converter filter. Units: pu. | [required]
**`cf`** | **`Float64`** | Shunt capacitance of converter filter. Units: pu. | [required]
**`lg`** | **`Float64`** | Series inductance of converter filter to the grid. Units: pu. | [required]
**`rg`** | **`Float64`** | Series resistance of converter filter to the grid. Units: pu. | [required]
