module InfrastructureCoreOpenAPIModelsJSONSchemaExt

using JSONSchema
using InfrastructureCoreOpenAPIModels

# JSONSchema.jl stops at the first failure per validation, so a document that fails as a whole
# is walked: each object's `required`/`additionalProperties` are checked here directly, while
# every other node is validated on its own, stripped of its structural keywords, against its
# sub-schema with the bundle's `definitions` attached so local `$ref`s resolve. An `allOf`
# stays on the stripped node as a constraint. For `oneOf`/`anyOf` the branch matching the
# row's discriminator or title is walked, else the branch with the fewest problems.

struct Walker
    definitions::Dict{String, Any}
    full::IdDict{Any, JSONSchema.Schema}
    stripped::IdDict{Any, JSONSchema.Schema}
end

function Walker(definitions)
    return Walker(
        Dict{String, Any}(definitions),
        IdDict{Any, JSONSchema.Schema}(),
        IdDict{Any, JSONSchema.Schema}(),
    )
end

const _STRUCTURAL = ("properties", "required", "additionalProperties", "items")

function _compile(sub::AbstractDict, definitions, drop)
    root = Dict{String, Any}(String(k) => v for (k, v) in sub if !(k in drop))
    root["definitions"] = definitions
    return JSONSchema.Schema(root)
end

function _full!(w::Walker, sub)
    return get!(() -> _compile(sub, w.definitions, ()), w.full, sub)
end

function _stripped!(w::Walker, sub)
    return get!(() -> _compile(sub, w.definitions, _STRUCTURAL), w.stripped, sub)
end

function _resolve(sub::AbstractDict, definitions)
    if haskey(sub, "\$ref")
        return _resolve(definitions[last(split(sub["\$ref"], '/'))], definitions)
    end
    return sub
end

# RFC 6901 JSON Pointer segments, the same path form the other bindings report.
_location(::AbstractVector, index::Integer) = "/$(index - 1)"
function _location(::AbstractDict, key::AbstractString)
    return "/" * replace(key, "~" => "~0", "/" => "~1")
end

_report!(problems, ::Nothing, path) = nothing
function _report!(problems, issue, path)
    if isempty(issue.path) && issue.reason != "required"
        push!(problems, "$path: $(issue.reason)")
    else
        push!(problems, "$path: $(issue.reason) at $(issue.path) (value $(issue.val))")
    end
    return nothing
end

function _branches(sub)
    return get(sub, "oneOf", get(sub, "anyOf", Any[]))
end

function _walk!(w::Walker, problems, sub, value, path)
    sub = _resolve(sub, w.definitions)
    if isempty(_branches(sub))
        return _walk_resolved!(w, problems, sub, value, path)
    end
    return _walk_choice!(w, problems, sub, value, path)
end

_is_valid(::Nothing) = true
_is_valid(issue) = false

function _walk_choice!(w::Walker, problems, sub, value, path)
    issue = JSONSchema.validate(_full!(w, sub), value)
    if !_is_valid(issue)
        _walk_branches!(w, problems, sub, value, path, issue)
    end
    return nothing
end

function _tags(sub, value)
    discriminator = get(sub, "discriminator", Dict{String, Any}())
    raw = get(value, get(discriminator, "propertyName", "attribute_type"), "")
    mapped = get(get(discriminator, "mapping", Dict{String, Any}()), raw, raw)
    return filter(!isempty, [string(raw), String(last(split(string(mapped), '/')))])
end

function _names(w::Walker, branch)
    resolved = _resolve(branch, w.definitions)
    names = String[get(resolved, "title", "")]
    if haskey(branch, "\$ref")
        push!(names, String(last(split(branch["\$ref"], '/'))))
    end
    return names
end

function _preferred(w::Walker, sub, value)
    tags = _tags(sub, value)
    branches = _branches(sub)
    matched = filter(b -> !isdisjoint(_names(w, b), tags), branches)
    if isempty(matched)
        return branches
    end
    return matched
end

function _branch_problems(w::Walker, branch, value, path)
    problems = String[]
    _walk!(w, problems, branch, value, path)
    return problems
end

function _walk_branches!(w::Walker, problems, sub, value::AbstractDict, path, issue)
    found = [_branch_problems(w, b, value, path) for b in _preferred(w, sub, value)]
    best = found[argmin(length.(found))]
    if isempty(best)
        return _report!(problems, issue, path)
    end
    append!(problems, best)
    return nothing
end

function _walk_branches!(w::Walker, problems, sub, value, path, issue)
    return _report!(problems, issue, path)
end

function _walk_resolved!(w::Walker, problems, sub, value, path)
    _report!(problems, JSONSchema.validate(_stripped!(w, sub), value), path)
    return nothing
end

function _walk_resolved!(w::Walker, problems, sub, value::AbstractDict, path)
    _report!(problems, JSONSchema.validate(_stripped!(w, sub), value), path)
    properties = get(sub, "properties", Dict{String, Any}())
    extra = get(sub, "additionalProperties", true)
    for key in get(sub, "required", String[])
        if !haskey(value, key)
            push!(problems, "$path$(_location(value, key)): required property missing")
        end
    end
    for (key, item) in value
        _walk_property!(
            w,
            problems,
            properties,
            extra,
            key,
            item,
            path * _location(value, key),
        )
    end
    return nothing
end

function _walk_property!(w::Walker, problems, properties, extra, key, item, path)
    if haskey(properties, key)
        return _walk!(w, problems, properties[key], item, path)
    end
    return _walk_extra!(w, problems, extra, item, path)
end

function _walk_extra!(w::Walker, problems, allowed::Bool, item, path)
    if !allowed
        push!(problems, "$path: property unknown to this schema")
    end
    return nothing
end

function _walk_extra!(w::Walker, problems, extra::AbstractDict, item, path)
    return _walk!(w, problems, extra, item, path)
end

function _walk_resolved!(w::Walker, problems, sub, value::AbstractVector, path)
    _report!(problems, JSONSchema.validate(_stripped!(w, sub), value), path)
    items = get(sub, "items", Dict{String, Any}())
    for (i, item) in enumerate(value)
        _walk!(w, problems, items, item, path * _location(value, i))
    end
    return nothing
end

function InfrastructureCoreOpenAPIModels._bundle_problems(
    tree::AbstractDict,
    bundle::AbstractDict,
)
    problems = String[]
    if _is_valid(JSONSchema.validate(JSONSchema.Schema(bundle), tree))
        return problems
    end
    root = Dict{String, Any}(String(k) => v for (k, v) in bundle if k != "definitions")
    _walk!(Walker(bundle["definitions"]), problems, root, tree, "")
    return sort!(problems)
end

function __init__()
    InfrastructureCoreOpenAPIModels._VALIDATOR_LOADED[] = true
    return nothing
end

end
