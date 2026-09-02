@doc "    NodeBusType\n\nAC Bus Type for a node."
struct NodeBusType
    value::String
    function NodeBusType(value::String)
        value in ("PQ","PV","REF","ISOLATED","SLACK") || throw(ArgumentError("invalid NodeBusType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{NodeBusType}, value) = _decode(NodeBusType, value, true)
function _decode(::Type{NodeBusType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/Node/properties/bus_type"), value, "decoding NodeBusType"; direction = :neutral)
    return NodeBusType(_decode(String, value, _openapi_validate))
end
function _encode(value::NodeBusType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/Node/properties/bus_type"), output, "encoding NodeBusType"; direction = :neutral)
end
Base.string(value::NodeBusType) = string(value.value)
