# SalientPoleQuadratic

3-states salient-pole synchronous machine with quadratic saturation: IEEE Std 1110 §5.3.2 (Model 2.1). GENSAL in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`base_machine`** | **`Int64`** | ID of the SalientPoleMachine function block that holds the base parameters of this machine. | [required]
**`saturation_coeffs`** | **`Vector{Float64}`** | Derived saturation coefficients for the quadratic saturation model, computed from the Se input | [required]
