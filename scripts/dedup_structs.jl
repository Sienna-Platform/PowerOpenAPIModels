# Collapses the generator's per-reference-site copies of a shared schema onto the shared
# type.
#
# The schemas reference shared definitions properly, by `$ref` to a named `$defs` entry. The
# generator still materializes an anonymous copy for any `$ref` that carries siblings, and
# 323 properties carry a `description` (the `Units:` channel SiennaSchemas' gate 2 enforces,
# so they cannot simply be dropped). The result was 112 redundant types out of 344: 65 copies
# of `MinMax` (`ACBusVoltageLimits`, `DCBusVoltageLimits`, …), 5 of `ComplexNumber`
# (`FixedAdmittanceY`, `TwoWindingTransformerMagnetizingShunt`, …), 7 of
# `TechnologyFinancialData`, and so on. They fragment the API for no benefit: a `MinMax` read
# off one component cannot be passed where another component's copy is expected.
#
# This is the struct-level analogue of the cross-domain dedup `generate_native.jl` already
# does, and it merges only on hard evidence:
#
#   1. The survivor's name must be one a domain selector declares as a named schema.
#      A copy's name never is -- the generator
#      derives it from the reference site (`<Owner><Property>`), which is exactly what makes
#      the two tellable apart.
#   2. The two must be structurally identical: same declared field names AND field types for
#      an object, same allowed values for an enum.
#
# Field *types* are compared, not just names, so two schemas that happen to share field names
# with different types are never merged. Every merge is printed, so the list is auditable
# rather than something to take on trust.

"""
Structural signature of a chunk: what it would have to match to be the same type.

`nothing` for anything without a comparable structure (a `const` alias, a `oneOf` wrapper --
whose `value::Union{...}` names its variants and so is already identity-bearing).
"""
function struct_signature(text::AbstractString)
    enum = match(ENUM_CTOR_RE, text)
    if !isnothing(enum)
        values = sort!([strip(v, [' ', '"']) for v in split(enum.captures[1], ',')])
        return ("enum", values)
    end
    body = match(r"^Base\.@kwdef struct \w+[^\n]*\n(.*?)^end"ms, text)
    isnothing(body) && return nothing
    fields = sort!(
        [string(m.captures[1], "::", strip(m.captures[2])) for
         m in eachmatch(r"^    (\w+)::([^\n=]+?)(?:\s*=.*)?$"m, body.captures[1])],
    )
    isempty(fields) && return nothing
    return ("struct", fields)
end

"""
Names a selector declares as a schema of its own. These, and only these, are eligible to
survive a merge -- a type the generator named after a reference site rather than a
declared component is not a shared type, whatever it looks like.
"""
function published_schema_names(schema_dir, domains)
    names = Set{String}()
    for domain in domains
        for key in keys(selector_definitions(schema_dir, domain))
            push!(names, generated_type_name(key))
        end
    end
    return names
end

"""
The Julia type name the generator produces for a schema name.

It strips whatever is not alphanumeric, so `FromTo_ToFrom` generates as `FromToToFrom` and
`XY_Coords` as `XYCoords` -- the only two published names in the tree that are re-spelled.
Comparing raw schema names against generated ones therefore misses them, and a copy of
`FromTo_ToFrom` (`AreaInterchangeFlowLimits`, `MonitoredLineFlowLimits`) found no survivor to
collapse onto.
"""
generated_type_name(schema_name) = replace(String(schema_name), r"[^A-Za-z0-9]" => "")

"""
Map every duplicate chunk name to the published name it collapses onto.

`chunks_by_domain` is the per-domain kept-chunk list; the survivor may live in any domain,
since a copy in `operations` routinely duplicates a shared type owned by
`infrastructure-core`.
"""
function build_rename_map(chunks_by_domain, published)
    canonical = Dict{Tuple{String, Vector{String}}, String}()
    duplicates = Dict{String, String}()
    all_chunks = [c for domain in keys(chunks_by_domain) for c in chunks_by_domain[domain]]

    # Published names first, so a copy can never win the canonical slot regardless of the
    # order domains happen to be walked in.
    for c in all_chunks
        c.name in published || continue
        signature = struct_signature(c.text)
        isnothing(signature) && continue
        haskey(canonical, signature) || (canonical[signature] = c.name)
    end
    for c in all_chunks
        c.name in published && continue
        signature = struct_signature(c.text)
        isnothing(signature) && continue
        survivor = get(canonical, signature, "")
        isempty(survivor) && continue
        survivor == c.name && continue
        duplicates[c.name] = survivor
    end
    return duplicates
end

"""
Rewrite every whole-word occurrence of a duplicate's name with its survivor.
"""
function apply_renames(text::AbstractString, renames::AbstractDict{String, String})
    isempty(renames) && return text
    out = text
    for (from, to) in renames
        out = replace(out, Regex("\\b\\Q$from\\E\\b") => to)
    end
    return out
end

"""
The names a chunk's *struct definition* references -- its field types, and nothing else.

Deliberately narrow. Julia needs a type to exist when the `struct` block is evaluated, but a
mention inside a `_decode`/`_encode` body resolves when that method is called, long after
every include has run. Scanning whole chunks instead reports cycles that do not exist: a
`oneOf` wrapper names its variants in `value::Union{…}` while each variant names the wrapper
back in its own decode body, which is fine in Julia and unorderable as a graph.

The docstring is skipped for the same reason -- it repeats field descriptions and would
manufacture dependencies on types the definition never mentions.
"""
function referenced_names(chunk::Chunk, candidates)
    body = match(r"^(?:Base\.@kwdef )?struct \w+[^\n]*\n(.*?)^end"ms, chunk.text)
    isnothing(body) && return Set{String}()
    found = Set{String}()
    for line in eachmatch(r"^    \w+::([^\n]*)$"m, body.captures[1])
        for word in eachmatch(r"\b[A-Z]\w*\b", line.captures[1])
            name = word.match
            name == chunk.name && continue
            name in candidates && push!(found, name)
        end
    end
    return found
end

"""
Reorder a domain's chunks so every type is defined before the chunks that reference it.

The generator emits its own chunks in dependency order -- a synthesized nested type sits
immediately before the struct using it -- and collapsing a copy onto a shared survivor breaks
that: `AggregateTransportTechnology` referenced `AggregateTransportTechnologyFinancialData`
defined just above it, and after the merge it references `TechnologyFinancialData`, defined
40 includes later. Julia needs the type to exist when the referencing `include` runs, so the
order has to be rebuilt rather than inherited.

A stable topological sort: original order is the tiebreak, so a domain with nothing to
reorder comes back byte-identical. If a cycle appears (mutually referencing structs, which
the generator's own order proves absent today), the remaining chunks are appended in original
order rather than dropped -- a wrong order fails loudly at precompile, a dropped type fails
mysteriously much later.
"""
function topo_order(chunks::Vector{Chunk})
    names = Set(c.name for c in chunks)
    deps = Dict(c.name => referenced_names(c, names) for c in chunks)
    emitted = Set{String}()
    ordered = Chunk[]
    remaining = copy(chunks)
    while !isempty(remaining)
        ready = [c for c in remaining if issubset(deps[c.name], emitted)]
        if isempty(ready)
            @warn "dependency cycle among generated types; keeping generator order" types =
                [c.name for c in remaining]
            append!(ordered, remaining)
            break
        end
        for c in ready
            push!(ordered, c)
            push!(emitted, c.name)
        end
        ready_names = Set(c.name for c in ready)
        remaining = [c for c in remaining if !(c.name in ready_names)]
    end
    return ordered
end
