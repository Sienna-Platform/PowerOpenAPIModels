# UnitSystem

Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a loss curve's own `power_units` (`LossCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series). Cost curves have no basis: they are always in natural units.

## Allowed values
- `COMPONENT_BASE`
- `NATURAL_UNITS`
