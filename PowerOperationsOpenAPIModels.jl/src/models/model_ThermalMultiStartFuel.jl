@doc "    ThermalMultiStartFuel\n\nPrime mover fuel according to EIA 923."
struct ThermalMultiStartFuel
    value::String
    function ThermalMultiStartFuel(value::String)
        value in ("ANTHRACITE_COAL","BITUMINOUS_COAL","LIGNITE_COAL","SUBBITUMINOUS_COAL","WASTE_COAL","REFINED_COAL","SYNTHESIS_GAS_COAL","DISTILLATE_FUEL_OIL","JET_FUEL","KEROSENE","PETROLEUM_COKE","RESIDUAL_FUEL_OIL","PROPANE","SYNTHESIS_GAS_PETROLEUM_COKE","WASTE_OIL","BLAST_FURNACE_GAS","NATURAL_GAS","OTHER_GAS","AG_BYPRODUCT","MUNICIPAL_WASTE","OTHER_BIOMASS_SOLIDS","WOOD_WASTE_SOLIDS","OTHER_BIOMASS_LIQUIDS","SLUDGE_WASTE","BLACK_LIQUOR","WOOD_WASTE_LIQUIDS","LANDFILL_GAS","OTHER_BIOMASS_GAS","NUCLEAR","WASTE_HEAT","TIRE_DERIVED_FUEL","COAL","GEOTHERMAL","OTHER") || throw(ArgumentError("invalid ThermalMultiStartFuel value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalMultiStartFuel}, value) = _decode(ThermalMultiStartFuel, value, true)
function _decode(::Type{ThermalMultiStartFuel}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/fuel"), value, "decoding ThermalMultiStartFuel"; direction = :neutral)
    return ThermalMultiStartFuel(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalMultiStartFuel)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/fuel"), output, "encoding ThermalMultiStartFuel"; direction = :neutral)
end
Base.string(value::ThermalMultiStartFuel) = string(value.value)
