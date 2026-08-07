# Generated from SiennaSchemas x-unit annotations. Do not edit.

const UNIT_VOCABULARY = Dict{Tuple{String, String}, Float64}(
    ("ActivePower", "MW") => 1.0,
    ("ActivePowerChangeRate", "MW/min") => 1.0,
    ("Angle", "deg") => 0.017453292519943295,
    ("Angle", "rad") => 1.0,
    ("ApparentPower", "MVA") => 1.0,
    ("CO2Emissions", "t/MMBtu") => 1.0,
    ("CalendarPeriod", "yr") => 1.0,
    ("Capacitance", "F") => 1.0,
    ("Conductance", "S") => 1.0,
    ("CostPerCapacity", "USD/MW") => 1.0,
    ("CostPerEnergy", "USD/MWh") => 1.0,
    ("CostPerLevel", "USD/m") => 1.0,
    ("CostPerMass", "USD/t") => 1.0,
    ("CostPerTime", "USD/h") => 1.0,
    ("CostPerVolume", "USD/m3") => 1.0,
    ("CurrentFlow", "A") => 0.001,
    ("CurrentFlow", "kA") => 1.0,
    ("Dimensionless", "1") => 1.0,
    ("Duration", "s") => 1.0,
    ("ElectricalEnergy", "MJ") => 0.0002777777777777778,
    ("ElectricalEnergy", "MWh") => 1.0,
    ("ElectricalEnergy", "MWmin") => 0.016666666666666666,
    ("Elevation", "m") => 1.0,
    ("EmissionRate", "Mt/MWh") => 1.0e6,
    ("EmissionRate", "t/MWh") => 1.0,
    ("Fraction", "1") => 1.0,
    ("FractionPerTime", "1/min") => 1.0,
    ("Frequency", "Hz") => 60.0,
    ("HeadRate", "m/s") => 1.0,
    ("HeatRate", "MMBtu/MWh") => 1.0,
    ("Impedance", "ohm") => 1.0,
    ("Inductance", "H") => 1.0,
    ("Length", "km") => 1.0,
    ("Length", "m") => 0.001,
    ("Mass", "Mt") => 1.0e6,
    ("Mass", "kg") => 0.001,
    ("Mass", "lb") => 0.00045359237,
    ("Mass", "ston") => 0.90718474,
    ("Mass", "t") => 1.0,
    ("Money", "USD") => 1.0,
    ("OperationalDuration", "min") => 1.0,
    ("PowerFactor", "1") => 1.0,
    ("PowerPerFrequency", "MW/Hz") => 1.0,
    ("Reactance", "ohm") => 1.0,
    ("ReactivePower", "MVAr") => 1.0,
    ("Resistance", "ohm") => 1.0,
    ("StartFuelPerCapacity", "MMBtu/MW") => 1.0,
    ("Susceptance", "S") => 1.0,
    ("Voltage", "kV") => 1.0,
    ("Volume", "m3") => 1.0,
    ("VolumeFlowRate", "m3/s") => 1.0,
)

has_conversion_factor(q::AbstractString, u::AbstractString) = haskey(UNIT_VOCABULARY, (String(q), String(u)))
conversion_factor(q::AbstractString, u::AbstractString) = UNIT_VOCABULARY[(String(q), String(u))]

has_declared_unit(::Type{<:OpenAPI.APIModel}, ::Val) = false
has_unit_base(::Type{<:OpenAPI.APIModel}, ::Val) = false
has_declared_unit(o::T, v::Val) where {T <: OpenAPI.APIModel} = has_declared_unit(T, v)

function declared_unit(::Type{T}, ::Val{P}) where {T <: OpenAPI.APIModel, P}
    error("$(nameof(T)).$P has no declared unit")
end
function declared_quantity(::Type{T}, ::Val{P}) where {T <: OpenAPI.APIModel, P}
    error("$(nameof(T)).$P has no declared quantity")
end
function unit_base(::Type{T}, ::Val{P}) where {T <: OpenAPI.APIModel, P}
    error("$(nameof(T)).$P has no unit base")
end

declared_unit(o::T, v::Val) where {T <: OpenAPI.APIModel} = declared_unit(T, v)
declared_quantity(o::T, v::Val) where {T <: OpenAPI.APIModel} = declared_quantity(T, v)
unit_base(o::T, v::Val) where {T <: OpenAPI.APIModel} = unit_base(T, v)

