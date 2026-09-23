# RoundRotorQuadratic

4-states round-rotor synchronous machine with quadratic saturation: IEEE Std 1110 §5.3.2 (Model 2.2). GENROU model in PSSE and PSLF

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`base_machine`** | **`Int64`** | Round Rotor machine parameters | [required]
**`saturation_coeffs`** | **`Vector{Float64}`** | Derived saturation coefficients for the quadratic saturation model, computed from the Se input | [required]
