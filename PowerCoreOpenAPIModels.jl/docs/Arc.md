# Arc

A topological directed edge connecting two buses. Arcs are used to define the `from_id` and `to_id` endpoints when defining a line or transformer.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`from_id`** | **`Int64`** | ID of the initial bus. | [required]
**`to_id`** | **`Int64`** | ID of the terminal bus. | [required]
