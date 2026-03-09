# FunctionData

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: LinearFunctionData, PiecewiseLinearData, PiecewiseStepData, QuadraticFunctionData |  | [optional]

The discriminator field is `function_type` with the following mapping:

- `LINEAR`: `LinearFunctionData`
- `PIECEWISE_LINEAR`: `PiecewiseLinearData`
- `PIECEWISE_STEP`: `PiecewiseStepData`
- `QUADRATIC`: `QuadraticFunctionData`

[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)
