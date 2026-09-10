# OpenAPI.jl's native generator emits code in a shape meant for a machine, not a reader: each
# struct's whole documentation arrives as ONE `@doc "…\n…- `field`: …"` line -- a string
# literal with escaped newlines, often thousands of characters wide -- and the `_decode`/
# `_encode` bodies below it are one unwrapped expression per line, far past any margin. Both
# were called out in review on PowerOpenAPIModels#12 ("Is it possible to make this properly
# formatted?").
#
# Two passes fix it, in this order:
#
#   1. `rewrite_docstring` turns the `@doc "escaped"` one-liner into an ordinary triple-quoted
#      docstring with real line breaks. This must run at *write* time, not on the in-memory
#      chunk: `split_module` finds chunk boundaries by `startswith(line, "@doc \"")` and
#      `emit_docs.jl` parses that same line back into docs/<Name>.md, so both need the
#      generator's original form.
#   2. `format_paths` runs JuliaFormatter with the repo's own .JuliaFormatter.toml, so the
#      generated sources read like the rest of the codebase (margin 92, wrapped calls,
#      spaces in type parameters) rather than like generator output.
#
# Everything here is cosmetic by construction -- pass 1 rewrites a string literal into an
# equivalent literal, pass 2 is JuliaFormatter -- so a regeneration is still reproducible and
# no semantics depend on it.

import JuliaFormatter
import TOML

const CONFIG_DIR = dirname(@__DIR__)

"""
Escape `text` for interpolation into a `\"\"\"`-quoted Julia string literal, as
`(ok, escaped)`.

Only backslash and `\$` need escaping; a lone `\"` is legal inside triple quotes. `ok` is
false when the text cannot be represented safely -- it already contains a `\"\"\"` sequence,
or ends in a `\"` that would close the literal early -- and the caller then leaves the
generator's original single-quoted form alone rather than emitting broken code.
"""
function escape_for_triple_quote(text::AbstractString)
    if occursin("\"\"\"", text) || endswith(text, "\"")
        return false, ""
    end
    escaped = replace(text, "\\" => "\\\\")
    return true, replace(escaped, "\$" => "\\\$")
end

"""
Rewrite a chunk's leading one-line `@doc "…"` into a triple-quoted docstring with real
newlines.

Returns `text` unchanged when there is no `@doc` line (a synthesized nested type such as
`AverageRateCurveFunctionData` generates without one) or when the content cannot be safely
re-quoted.
"""
function rewrite_docstring(text::AbstractString)
    newline = findfirst('\n', text)
    isnothing(newline) && return text
    first_line = text[1:(newline - 1)]
    startswith(first_line, "@doc \"") || return text

    doc = try
        Meta.parse(first_line[6:end])
    catch
        return text
    end
    doc isa String || return text

    ok, escaped = escape_for_triple_quote(doc)
    ok || return text

    return string("\"\"\"\n", escaped, "\n\"\"\"\n", text[(newline + 1):end])
end

"""
The repo's `.JuliaFormatter.toml`, as `format_file` keyword arguments.

`format_file` does no config discovery of its own -- only `JuliaFormatter.format` over a
directory does -- so the settings are read here explicitly. Reading them rather than
hardcoding them keeps generated code and hand-written code on one style definition: edit the
TOML and the next regeneration follows.
"""
function formatter_options()
    config = TOML.parsefile(joinpath(CONFIG_DIR, ".JuliaFormatter.toml"))
    return (Symbol(k) => v for (k, v) in config)
end

"""
Format `paths` in place with the repo's `.JuliaFormatter.toml`.
"""
function format_paths(paths::AbstractVector{<:AbstractString})
    isempty(paths) && return nothing
    options = formatter_options()
    for path in paths
        JuliaFormatter.format_file(path; options...)
    end
    return nothing
end
