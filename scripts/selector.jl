# Read a SiennaSchemas domain selector (`openapi-<domain>.json`).
#
# A selector maps each component name onto a bare external `$ref` into the schema tree:
# a whole file (`Core/Topology/ACBus.json`) or one definition
# (`Core/common.json#/$defs/MinMax`). It declares every schema the domain reaches, which
# is what lets `OpenAPI.client` name every generated type -- the generator names models
# after `components.schemas` keys and invents a positional name per reference site for
# anything it reaches but the document does not declare. SiennaSchemas' check_refs.py
# gates that completeness.
#
# The post-passes here need the schema bodies (units, `const` fields, published names),
# not a resolved document: every annotation they read sits on the schema or the property
# that carries it, never behind the `$ref`. So this resolves one level -- selector entry
# to authored body -- and leaves the references inside alone for OpenAPI.jl to follow.

function _resolve_fragment(doc, fragment)
    node = doc
    if isempty(fragment) || fragment == "/"
        return node
    end
    for token in split(strip(fragment, '/'), '/')
        token = replace(replace(token, "~1" => "/"), "~0" => "~")
        if !(node isa AbstractDict) || !haskey(node, token)
            error("fragment token '$token' not found in $fragment")
        end
        node = node[token]
    end
    return node
end

selector_path(schema_dir, domain) = joinpath(schema_dir, "openapi-$domain.json")

# common.json is the target of most entries in every domain; parse each file once.
const _SCHEMA_FILE_CACHE = Dict{String, Dict{String, Any}}()

function _load_schema_file(path)
    key = abspath(path)
    return get!(_SCHEMA_FILE_CACHE, key) do
        JSON.parsefile(key; dicttype=Dict{String, Any})
    end
end

_is_bare_ref(entry) = false
function _is_bare_ref(entry::AbstractDict)
    return length(entry) == 1 && get(entry, "\$ref", 0) isa AbstractString
end

"""
Every component the domain declares, as `name => authored schema body`.
"""
function selector_definitions(schema_dir, domain)
    path = selector_path(schema_dir, domain)
    spec = _load_schema_file(path)
    schemas = get(get(spec, "components", Dict{String, Any}()), "schemas", Dict{String, Any}())
    result = Dict{String, Any}()
    for (name, entry) in schemas
        if !_is_bare_ref(entry)
            error("$(basename(path)): components.schemas.$name must be a bare \$ref")
        end
        parts = split(entry["\$ref"], '#'; limit=2)
        file = joinpath(dirname(path), String(parts[1]))
        fragment = ""
        if length(parts) == 2
            fragment = String(parts[2])
        end
        result[name] = _resolve_fragment(_load_schema_file(file), fragment)
    end
    return result
end
