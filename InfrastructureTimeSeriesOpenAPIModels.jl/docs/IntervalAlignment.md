# IntervalAlignment

Position of a timestamp in the period of length `resolution` that its value represents. At a one-hour resolution, the value at 01:00 covers 01:00 to 02:00 for `PERIOD_BEGINNING`, 00:30 to 01:30 for `PERIOD_MIDPOINT`, and 00:00 to 01:00 for `PERIOD_ENDING`. Descriptive: the store records it and does not realign a series.

## Allowed values
- `PERIOD_BEGINNING`
- `PERIOD_MIDPOINT`
- `PERIOD_ENDING`
