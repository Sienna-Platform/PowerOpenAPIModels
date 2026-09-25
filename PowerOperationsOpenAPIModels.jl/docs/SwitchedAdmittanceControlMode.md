# SwitchedAdmittanceControlMode

Control mode of a switched shunt admittance (PSS/E MODSW). `UNDEFINED` leaves the mode unspecified; `FIXED` holds the admittance constant. `DISCRETE_VOLTAGE` and `CONTINUOUS_VOLTAGE` regulate voltage in steps or continuously and use `voltage_limits`. `DISCRETE_REACTIVE_PLANT`, `DISCRETE_REACTIVE_VSC`, `DISCRETE_ADMITTANCE_REMOTE` and `DISCRETE_REACTIVE_FACTS` regulate a plant's, a voltage-source-converter terminal's, a remote bus's, or a FACTS device's reactive quantity in steps and use `reactive_power_range_limits`.

## Allowed values
- `UNDEFINED`
- `FIXED`
- `DISCRETE_VOLTAGE`
- `CONTINUOUS_VOLTAGE`
- `DISCRETE_REACTIVE_PLANT`
- `DISCRETE_REACTIVE_VSC`
- `DISCRETE_ADMITTANCE_REMOTE`
- `DISCRETE_REACTIVE_FACTS`
