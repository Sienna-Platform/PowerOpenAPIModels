# TransformerRegulatedBusSide

Side of a transformer circuit's controlling winding on which the regulated bus lies, stated when the regulated bus is not one of the transformer's own terminal buses. UNDEFINED: no side is stated, because the regulated bus is one of the circuit's own arc ends (or there is no regulated bus) and the side follows from the connections. CONTROLLING_WINDING: the regulated bus lies beyond the tapped (controlling) winding's terminal, PSS/E's negative CONT. OPPOSITE_WINDING: the regulated bus lies beyond the other winding's terminal, PSS/E's positive CONT.

## Allowed values
- `UNDEFINED`
- `CONTROLLING_WINDING`
- `OPPOSITE_WINDING`
