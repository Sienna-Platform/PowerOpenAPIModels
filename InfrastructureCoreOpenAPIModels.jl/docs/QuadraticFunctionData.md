# QuadraticFunctionData

Data for a quadratic function `f(x) = quadratic_term * x^2 + proportional_term * x + constant_term`. A non-negative `quadratic_term` makes the function convex.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`constant_term`** | **`Float64`** | Units: the wrapped function's output unit. | [required]
**`function_type`** | **`String`** |  | [required]
**`proportional_term`** | **`Float64`** | Units: the wrapped function's output unit per unit of its input. | [required]
**`quadratic_term`** | **`Float64`** | Units: the wrapped function's output unit per unit of its input squared. | [required]
