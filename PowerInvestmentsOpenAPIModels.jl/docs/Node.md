# Node

A unit of spatial aggregation for nodal capacity expansion models. Used to define locations for supply, demand, transport, and storage technologies and the relevant policy requirements.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`bus_type`** | **`Union{Absent,NodeBusType,Nothing}`** | AC Bus Type for a node. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
