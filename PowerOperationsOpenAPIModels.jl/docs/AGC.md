# AGC

Automatic generation control (AGC) for the system or a certain `Area` within the system. This model uses a proportional-integral-derivative (PID) control to simulate a "smooth" response of the AGC to the area control error (ACE).

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`k_d`** | **`Float64`** | PID Derivative Constant. | [required]
**`k_i`** | **`Float64`** | PID Integral Constant. | [required]
**`k_p`** | **`Float64`** | PID Proportional Constant. | [required]
**`area`** | **`Union{Absent,Int64,Nothing}`** | ID of the area controlled by the AGC. | [optional]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bias`** | **`Float64`** | Area frequency bias. Units: MW/Hz. | [required]
**`delta_t`** | **`Float64`** | PID Discretization period. Units: s. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`initial_ace`** | **`Union{Absent,Float64,Nothing}`** | Initial condition for ACE. | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
