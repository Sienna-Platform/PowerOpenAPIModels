# Defaults every discriminator field the schemas fix to one value.
#
# A discriminator property (`function_type`, `curve_type`, `cost_type`, `time_series_type`,
# `variable_cost_type`, ...) is declared `{"type": "string", "const": "LINEAR", "default":
# "LINEAR"}`: the schema already decided the value, but the native generator still emits a
# required `name::String` field with no default, so every construction site across five
# downstream repos must repeat `function_type = "LINEAR"` or fail with `UndefKeywordError`.
# This is the single largest error class in those repos' test suites.
#
# Only a field with no default already (a required, non-`Absent` `name::String`) is rewritten.
# A `const` property the schema also marks optional (e.g. `HydroGenerationCost.cost_type`)
# already generates as `Union{Absent, Nothing, String} = ABSENT` and is left alone -- it has a
# default, just not this one, and defaulting it further is out of scope here.
#
# `_decode`/`_encode` are untouched: decode still runs `_validate_schema`, so an explicit wrong
# value still fails there, and encode already omits a field only when it `isa Absent`, which a
# plain `String` never is -- so a defaulted field is always emitted, with no encode change
# needed.

"""
Map every generated struct name to its `const` fields, as `{field_name => const_value}`.

Scans every schema each domain's selector declares -- the same set `published_schema_names`
(`dedup_structs.jl`) reads -- since a discriminator field is always a plain property on the
schema itself, never behind further `\$ref`/`allOf` composition. A schema whose `const` and
`default` disagree fails loudly: that is the schema contradicting itself, not something to
paper over by preferring one value.
"""
function load_const_fields(schema_dir, domains)
    result = Dict{String, Dict{String, String}}()
    for domain in domains
        for (schema_name, body) in selector_definitions(schema_dir, domain)
            body isa AbstractDict || continue
            props = get(body, "properties", nothing)
            props === nothing && continue
            type_name = generated_type_name(schema_name)
            fields = get!(result, type_name, Dict{String, String}())
            for (prop_name, prop_body) in props
                prop_body isa AbstractDict || continue
                haskey(prop_body, "const") || continue
                const_value = prop_body["const"]
                default_value = get(prop_body, "default", nothing)
                if default_value !== nothing && default_value != const_value
                    error(
                        "schema $schema_name property $prop_name: const " *
                        "$(repr(const_value)) disagrees with default $(repr(default_value))",
                    )
                end
                if haskey(fields, prop_name) && fields[prop_name] != const_value
                    error(
                        "schema $schema_name property $prop_name: conflicting const values " *
                        "$(repr(fields[prop_name])) and $(repr(const_value)) across domains",
                    )
                end
                fields[prop_name] = const_value
            end
        end
    end
    return result
end

const EMPTY_CONST_FIELDS = Dict{String, String}()

"""
Give each of `chunk_text`'s `const` fields its schema value as a Julia default.

Matches only the exact bare declaration line `    <field>::String` (a required field with no
default yet); a field already defaulted to `ABSENT` does not match and is left unchanged.
Returns `(text, n)`, `n` the number of fields defaulted, for the caller's summary count.
"""
function default_const_fields(text::AbstractString, const_fields::AbstractDict{String, String})
    isempty(const_fields) && return text, 0
    n = 0
    for (field, value) in const_fields
        old = "    $field::String\n"
        occursin(old, text) || continue
        text = replace(text, old => "    $field::String = \"$value\"\n"; count=1)
        n += 1
    end
    return text, n
end
