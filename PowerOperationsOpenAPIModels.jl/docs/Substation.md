# Substation

Represents a substation grouping node buses and switching devices of a full-topology network model. Attach to every member component. Attach GeographicInfo separately for geospatial data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`grounding_resistance`** | **`Float64`** | Substation grounding DC resistance. Units: ohm. | [required]
**`id`** | **`Int64`** |  | [required]
**`name`** | **`String`** | Name of the substation | [required]
**`number`** | **`Int64`** | Substation number in the source power flow data | [required]
