# Substation

Supplemental attribute representing a substation that groups node buses and switching devices of a full-topology (node-breaker) network model. Attach the attribute to every member component. Geospatial data is not stored here; attach a GeographicInfo attribute to the member components instead.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`grounding_resistance`** | **`Float64`** | Substation grounding DC resistance. Units: ohm. | [required]
**`id`** | **`Int64`** |  | [required]
**`name`** | **`String`** | Name of the substation | [required]
**`number`** | **`Int64`** | Substation number in the source power flow data | [required]
