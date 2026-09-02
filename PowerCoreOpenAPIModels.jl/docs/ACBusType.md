# ACBusType

Classification of an AC bus for power flow, following the MATPOWER bus-type convention. `PQ` fixes the active and reactive injections and solves for voltage magnitude and angle; `PV` fixes active power and voltage magnitude and solves for reactive power and angle; `REF` names the reference for the system voltage angle; `SLACK` balances the system active and reactive mismatch and sets the reference angle; `ISOLATED` marks a bus not connected to the network.

## Allowed values
- `PQ`
- `PV`
- `REF`
- `ISOLATED`
- `SLACK`
