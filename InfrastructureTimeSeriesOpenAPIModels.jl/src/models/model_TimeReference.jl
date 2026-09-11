"""
    TimeReference

How a series' timestamps were spelled, recorded so a read hands back what the write declared instead of relabelling every series UTC. Four forms share one string, and are unambiguous because a zone name that would read as either literal or as an offset is rejected: `utc`; `zoneless` for a wall clock, which names no instant; a fixed UTC offset (`-07:00`, `+0530`, `+05`); or an IANA zone name (`America/Denver`). Only the name's shape is checked here — whether a zone exists is a tz-database question, and the store records the name either way. A spelling, not a grid: it does not change what a calendar `resolution` steps on, and a series on a local-clock grid is a NonSequentialTimeSeries. Descriptive, so two series differing only in it are duplicates rather than distinct series, but not inert — a query's bounds must match the series' spelling, and the zoneless series form their own group.
"""
const TimeReference = String
