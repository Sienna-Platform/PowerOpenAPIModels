# ACBusType

Classification of an AC bus for power flow, following the MATPOWER bus-type convention. `PQ` marks a bus with no in-service generation that regulates voltage; it can still have a `voltage_setpoint` that remote devices hold, or that a droop or a reactive power limit stops them from reaching. `PV` marks a bus with in-service generation that regulates voltage: generators, storage, synchronous condensers or sources. Those devices hold the `voltage_setpoint` of the bus they regulate, this bus or their `remote_regulated_bus`; `REF` names the reference for the system voltage angle; `SLACK` balances the system active and reactive mismatch and sets the reference angle; `ISOLATED` marks a bus not connected to the network.

## Allowed values
- `PQ`
- `PV`
- `REF`
- `ISOLATED`
- `SLACK`
