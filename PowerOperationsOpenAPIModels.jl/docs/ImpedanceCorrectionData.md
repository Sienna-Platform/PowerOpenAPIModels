# ImpedanceCorrectionData

Supplemental attribute carrying one row of an impedance correction table, linked to a transformer. The correction curve defines intervals over tap ratio or angle shift, and the accompanying fields name which winding the row applies to and whether the controlled quantity is an off-nominal turns ratio or a phase angle shift.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`impedance_correction_curve`** | **`PiecewiseLinearData`** | Data for a piecewise linear function defined by (x, y) points and interpolated linearly between consecutive ones. The y values are absolute values at each x, not per-segment slopes; use `PiecewiseStepData` when the data gives per-segment rates. Points run in ascending x order, and two of them define one segment. | [required]
**`table_number`** | **`Int64`** |  | [required]
**`transformer_control_mode`** | **`ImpedanceCorrectionDataTransformerControlMode`** |  | [required]
**`transformer_winding`** | **`ImpedanceCorrectionDataTransformerWinding`** |  | [required]
