# ReactivePowerSharing

Supplemental attribute grouping the setpoint voltage regulating devices that hold the voltage at one bus, so the reactive power required there can be split between them. The members' shares are their VoltageControlAssociation weights, each divided by the sum over the members in service (PSS/E RMPCT). The regulated bus is not stored: every member already resolves to the same bus. A bus regulated by two or more setpoint devices has exactly one sharing group containing all of them; a lone device has none.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this supplemental attribute. | [required]
**`name`** | **`String`** | Name of the sharing group. | [required]
