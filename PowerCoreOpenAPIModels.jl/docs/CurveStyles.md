# CurveStyles

Curve-clearing style for a bid: 0 = VARIABLE (default; continuous quantity with one or more segments); 1 = FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve.

## Allowed values
- `0`
- `1`
