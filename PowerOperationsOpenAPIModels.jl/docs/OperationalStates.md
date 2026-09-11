# OperationalStates

The on/off lifecycle of an in-service committable unit. OFFLINE: shut down. ONLINE: synchronized and producing. STARTUP/SHUTDOWN: mid-transition. Distinct from availability: an outaged unit has available = false regardless of state.

## Allowed values
- `OFFLINE`
- `ONLINE`
- `STARTUP`
- `SHUTDOWN`
