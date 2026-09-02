@doc "    ThermalFuels\n\nThermal fuels that reflect options in the EIA annual energy review."
struct ThermalFuels
    value::String
    function ThermalFuels(value::String)
        value in ("ANTHRACITE_COAL","BITUMINOUS_COAL","LIGNITE_COAL","SUBBITUMINOUS_COAL","WASTE_COAL","REFINED_COAL","SYNTHESIS_GAS_COAL","DISTILLATE_FUEL_OIL","JET_FUEL","KEROSENE","PETROLEUM_COKE","RESIDUAL_FUEL_OIL","PROPANE","SYNTHESIS_GAS_PETROLEUM_COKE","WASTE_OIL","BLAST_FURNACE_GAS","NATURAL_GAS","OTHER_GAS","AG_BYPRODUCT","MUNICIPAL_WASTE","OTHER_BIOMASS_SOLIDS","WOOD_WASTE_SOLIDS","OTHER_BIOMASS_LIQUIDS","SLUDGE_WASTE","BLACK_LIQUOR","WOOD_WASTE_LIQUIDS","LANDFILL_GAS","OTHER_BIOMASS_GAS","NUCLEAR","WASTE_HEAT","TIRE_DERIVED_FUEL","COAL","GEOTHERMAL","OTHER") || throw(ArgumentError("invalid ThermalFuels value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalFuels}, value) = _decode(ThermalFuels, value, true)
function _decode(::Type{ThermalFuels}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ThermalFuels"), value, "decoding ThermalFuels"; direction = :neutral)
    return ThermalFuels(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalFuels)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ThermalFuels"), output, "encoding ThermalFuels"; direction = :neutral)
end
Base.string(value::ThermalFuels) = string(value.value)
