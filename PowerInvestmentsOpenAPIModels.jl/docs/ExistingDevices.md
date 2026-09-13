# ExistingDevices

Supplemental attribute mapping a technology in the portfolio to the existing system — for example, the list of existing generators that correspond to one supply technology.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`existing_devices`** | **`Union{Absent,Nothing,Vector{String}}`** | List of individual existing devices to map to a specific technology in the portfolio. | [optional]
