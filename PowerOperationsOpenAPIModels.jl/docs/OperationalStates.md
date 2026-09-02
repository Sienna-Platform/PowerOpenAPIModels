# OperationalStates

The running on/off lifecycle of an in-service committable unit, mutually exclusive. OFFLINE: shut down and not synchronized. STARTUP: in its start-up sequence. ONLINE: synchronized and able to produce. SHUTDOWN: in its shut-down sequence. Availability is not one of these values: a unit on outage is `available = false`; an OFFLINE unit with `available = true` is in service and eligible for re-commitment and off-line ancillary services.

## Allowed values
- `OFFLINE`
- `STARTUP`
- `ONLINE`
- `SHUTDOWN`
