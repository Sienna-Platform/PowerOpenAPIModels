# Reconstructs per-type docs/<Name>.md, the same layout the old openapi-generator pipeline
# produced (docs/README.md's per-model pages are not reproduced -- that index page was
# openapi-generator's own, and nothing here depended on it existing).
#
# OpenAPI.jl 1.0's native generator has no per-file markdown-docs capability at all (see
# MIGRATION.md's "Capabilities dropped" section: "Per-model / per-API file layout and
# markdown docs. Output is a single file."). The same title/description/field documentation
# is still there, just as a Julia `@doc` docstring on each struct instead of a `.md` file, so
# nothing is actually lost -- this renders it back to a file for anyone reading docs/*.md
# directly (a docs site, GitHub browsing, ...).

# A bare `type: string` enum (`enum: [...]`, no `properties`) generates a validating wrapper
# struct with this exact inner-constructor shape, distinct from an object schema's
# `Base.@kwdef` struct and from a oneOf wrapper's plain `struct X; value::Union{...}; end`.
# The old pipeline generated these as a bare `const X = String` alias, which openapi-generator
# inconsistently gave either an empty stub doc (no properties to show) or no doc at all. Real
# allowed values are cheap to pull from the validating constructor, so this gives every enum a
# doc listing them -- strictly more useful than either of the old outcomes.
const ENUM_CTOR_RE = r"value in \(([^)]*)\) \|\| throw\(ArgumentError"

"""
Parse a chunk's leading `@doc "..."` line into (body, field_desc), where `body` is the
description with any trailing per-field bullet block removed, and `field_desc` maps field
name to its bullet description. Returns `(nothing, nothing)` if the chunk has no `@doc` line
(a doc-less synthesized nested type, e.g. `AverageRateCurveFunctionData` -- these never had a
standalone doc page under the old pipeline either, since they had no name of their own then).
"""
function parse_doc(chunk_text)
    first_line = split(chunk_text, '\n'; limit=2)[1]
    startswith(first_line, "@doc \"") || return (nothing, nothing)
    raw = Meta.parse(first_line[6:end])::String
    parts = split(raw, "\n\n")
    length(parts) < 2 && return ("", Dict{String, String}())

    field_desc = Dict{String, String}()
    body_parts = parts[2:end]
    if !isempty(body_parts) &&
       all(l -> occursin(r"^- `\w+`: ", l), split(body_parts[end], '\n'))
        for line in split(body_parts[end], '\n')
            m = match(r"^- `(\w+)`: (.*)$", line)
            m === nothing && continue
            field_desc[m.captures[1]] = m.captures[2]
        end
        body_parts = body_parts[1:(end - 1)]
    end
    return join(body_parts, "\n\n"), field_desc
end

"""
Parse a struct's field list from its chunk text: `(name, julia_type, required)` per field, in
declaration order, excluding the synthetic `additional_properties` field.
"""
function parse_fields(chunk_text)
    fields = Tuple{String, String, Bool}[]
    for line in split(chunk_text, '\n')
        m = match(r"^    (\w+)::(.+?)(?:\s*=\s*.+)?$", line)
        m === nothing && continue
        name, typ = m.captures[1], m.captures[2]
        name == "additional_properties" && continue
        push!(fields, (name, typ, !occursin("=", line)))
    end
    return fields
end

"""
Write `dest_dir/<Name>.md` for every chunk that has documentable content (an object schema, a
oneOf wrapper, or a bare enum); returns whether anything was written.
"""
function emit_docs_for(chunks, dest_dir)
    wrote_any = false
    for c in chunks
        body, field_desc = parse_doc(c.text)
        body === nothing && continue

        enum_match = match(ENUM_CTOR_RE, c.text)
        fields = enum_match === nothing ? parse_fields(c.text) : nothing
        (fields === nothing || !isempty(fields)) || continue

        wrote_any || mkpath(dest_dir)
        wrote_any = true
        open(joinpath(dest_dir, "$(c.name).md"), "w") do io
            println(io, "# $(c.name)")
            println(io)
            isempty(body) || (println(io, body); println(io))
            if enum_match !== nothing
                values = [strip(v, '"') for v in split(enum_match.captures[1], ',')]
                println(io, "## Allowed values")
                for v in values
                    println(io, "- `$v`")
                end
            else
                println(io, "## Properties")
                println(io, "Name | Type | Description | Notes")
                println(io, "------------ | ------------- | ------------- | -------------")
                for (name, typ, required) in fields
                    desc = get(field_desc, name, "")
                    notes = required ? "[required]" : "[optional]"
                    println(io, "**`$name`** | **`$typ`** | $desc | $notes")
                end
            end
        end
    end
    return wrote_any
end
