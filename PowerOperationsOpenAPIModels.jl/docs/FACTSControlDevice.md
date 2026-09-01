# FACTSControlDevice


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | Sending end bus number. | [default to nothing]
**`control_mode`** | **`String`** | Control mode. Used to describe the behavior of the control device. in psy5 a required param with an option to be nothing | [optional] [default to nothing]
**`voltage_setpoint_units`** | **`String`** | Unit basis for voltage_setpoint. COMPONENT_BASE (pu on the bus base voltage) is PSS/E RAW native (VSET). | [optional] [default to "COMPONENT_BASE"]
**`voltage_setpoint`** | **`Float64`** | Voltage setpoint at the sending end bus in kV, it has to be a &#x60;PV&#x60; bus. Units: kV. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [default to nothing]
**`max_shunt_current`** | **`Float64`** | Maximum shunt current at the sending end bus; entered at unity voltage. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [default to nothing]
**`reactive_power_required`** | **`Float64`** | Total reactive power required to hold voltage at sending bus, as a fraction in the range 0-1. Units: 1. | [default to nothing]
**`max_reactive_power`** | **`Float64`** | Independent maximum reactive power ceiling; the device reactive limit is min(the current/susceptance law on max_shunt_current, this value). Non-binding at the 9999.0 default. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional] [default to 9999.0]
**`shunt_control_type`** | **`String`** | Device class selecting the reactive-limit law (SVC vs STATCOM). | [optional] [default to "STATCOM"]
**`regulated_bus_number`** | **`Int64`** | Bus whose voltage this device regulates; 0 means local (sending) bus (PSS/E FCREG). Units: 1. | [optional] [default to 0]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component&#39;s per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [default to nothing]
**`power_units`** | **`String`** | Unit basis for this component&#39;s power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component&#39;s own base_power. NATURAL_UNITS: the field&#39;s physical unit. | [default to nothing]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection model for FACTS control device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


