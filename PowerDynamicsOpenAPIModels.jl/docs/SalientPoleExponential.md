# SalientPoleExponential

3-states salient-pole synchronous machine with exponential saturation: IEEE Std 1110 §5.3.2 (Model 2.1). GENSAE in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`base_machine`** | **`Int64`** | Salient pole machine parameters | [required]
**`saturation_coeffs`** | **`Vector{Float64}`** | Derived saturation coefficients for the exponential saturation model, computed from the Se input | [required]
