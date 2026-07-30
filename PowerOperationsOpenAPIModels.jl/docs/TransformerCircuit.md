# TransformerCircuit


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether this circuit is connected and online. | [default to nothing]
**`arc`** | **`Int64`** | An &#x60;Arc&#x60; defining this circuit &#x60;from&#x60; a terminal bus &#x60;to&#x60; the transformer&#39;s other terminal or star bus. | [default to nothing]
**`tap`** | **`Float64`** | Normalized tap changer position for voltage control, varying between 0 and 2, with 1 centered at the nominal voltage. Units: 1. | [optional] [default to 1.0]
**`alpha`** | **`Float64`** | Initial condition of phase shift across this circuit. Units: rad. | [optional] [default to 0.0]
**`r`** | **`Float64`** | Circuit resistance. Units: pu. | [optional] [default to 0.0]
**`x`** | **`Float64`** | Circuit reactance. Units: pu. | [optional] [default to 0.0]
**`control_objective`** | **`String`** | Tap-changer / phase-shifter control objective (PSS/E COD). &#x60;UNDEFINED&#x60; means this circuit has no control block. | [optional] [default to "UNDEFINED"]
**`regulated_bus_number`** | **`Int64`** | Controlled bus number (PSS/E CONT; sign &#x3D; regulation side). | [optional] [default to 0]
**`control_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`controlled_quantity_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`number_of_tap_positions`** | **`Int64`** | Number of tap positions (PSS/E NTP). | [optional] [default to 33]
**`rating`** | **`Float64`** | Thermal rating. Units: MVA. | [optional] [default to nothing]
**`rating_b`** | **`Float64`** | Second current rating. Units: MVA. | [optional] [default to nothing]
**`rating_c`** | **`Float64`** | Third current rating. Units: MVA. | [optional] [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow through this circuit. Units: MW. | [optional] [default to 0.0]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow through this circuit. Units: MVAr. | [optional] [default to 0.0]
**`base_power`** | **`Float64`** | Base power for per unitization of this circuit. Units: MVA. | [optional] [default to 100.0]
**`base_voltage_primary`** | **`Float64`** | Primary (from) terminal-side base voltage; the reference voltage for this circuit&#39;s per-unit impedance. Units: kV. | [optional] [default to nothing]
**`base_voltage_secondary`** | **`Float64`** | Secondary (to) terminal-side base voltage. For a three-winding transformer this defaults to the primary base voltage at parse time. Units: kV. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


