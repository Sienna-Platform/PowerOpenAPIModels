# InterruptiblePowerLoad

A static power load compensated for temporary or continuous interruptions to its demand, used for demand response. Has a target demand profile reduced to satisfy system needs. For simple loads, see PowerLoad.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial steady state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,LoadConformity,Nothing}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`operation_cost`** | **`InterruptiblePowerLoadOperationCost`** | Operational cost of interrupting load. or MarketBidCost | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`reactive_power`** | **`Float64`** | Initial steady state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
