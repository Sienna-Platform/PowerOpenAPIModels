"""
    TimeReference

How a series' timestamps are spelled: utc; zoneless for a wall clock; a fixed UTC offset (-07:00, +0530); or an IANA zone name. Not a grid: does not change what resolution steps on.
"""
const TimeReference = String
