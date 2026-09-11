# ImpedanceCorrectionData

One row of an impedance correction table, linked to a transformer. The curve defines intervals over tap ratio or angle shift; other fields name the winding and whether the controlled quantity is a turns ratio or a phase angle.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`impedance_correction_curve`** | **`PiecewiseLinearData`** | Data for a piecewise linear function defined by (x, y) points, interpolated linearly between them. Values are absolute at each x, not per-segment slopes. Points run in ascending x order. | [required]
**`table_number`** | **`Int64`** |  | [required]
**`transformer_control_mode`** | **`ImpedanceCorrectionDataTransformerControlMode`** |  | [required]
**`transformer_winding`** | **`ImpedanceCorrectionDataTransformerWinding`** |  | [required]
