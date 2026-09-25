# ImpedanceCorrectionData

Supplemental attribute carrying one row of an impedance correction table, linked to a transformer. Exactly one correction curve is present, selected by `transformer_control_mode`: `tap_ratio_correction_curve` spans off-nominal turns ratio and `phase_angle_correction_curve` spans phase-shift angle. `transformer_winding` names the winding the row applies to.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`table_number`** | **`Int64`** |  | [required]
**`tap_ratio_correction_curve`** | **`Union{Absent,PiecewiseLinearData,Nothing}`** | Impedance correction factor as a function of off-nominal tap ratio (x axis in tap ratio, y axis a multiplier on the winding impedance). Present only when `transformer_control_mode` is `TAP_RATIO`. Units: 1. | [optional]
**`phase_angle_correction_curve`** | **`Union{Absent,PiecewiseLinearData,Nothing}`** | Impedance correction factor as a function of phase-shift angle (x axis in radians, y axis a multiplier on the winding impedance). Present only when `transformer_control_mode` is `PHASE_SHIFT_ANGLE`. Units: rad. | [optional]
**`transformer_winding`** | **`ImpedanceCorrectionDataTransformerWinding`** |  | [required]
**`transformer_control_mode`** | **`ImpedanceCorrectionDataTransformerControlMode`** |  | [required]
