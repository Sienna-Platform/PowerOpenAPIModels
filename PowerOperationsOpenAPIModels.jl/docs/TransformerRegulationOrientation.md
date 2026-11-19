# TransformerRegulationOrientation

Which end of a transformer circuit's `arc` the tap adjustment treats the regulated bus as lying on, when the regulated bus is not an end of the arc: a remote bus, or another winding's terminal of a three-winding transformer. It sets the direction the tap moves to raise that bus's voltage (PSS/E sign of CONT). The `from` end is the tapped winding. UNDEFINED: the regulated bus is an end of the arc, so the connections give the direction, or there is no regulated bus. FROM: adjust as if the regulated bus lies on the `from` side (PSS/E negative CONT). TO: adjust as if it lies on the `to` side (PSS/E positive CONT).

## Allowed values
- `UNDEFINED`
- `FROM`
- `TO`
