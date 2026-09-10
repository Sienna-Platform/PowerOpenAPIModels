# SiennaSchemas' bundler (bundle_specs.py) hoists every shared schema to a top-level `$defs`
# object and leaves `components.schemas` holding thin `{"$ref": "#/$defs/<Name>"}` redirects.
# openapi-generator's Java tool resolves that fine; OpenAPI.jl 1.0's document loader validates
# the root object against the OpenAPI Document schema, which does not recognize `$defs` as a
# sibling of `components`, and rejects the whole document:
#
#   ERROR [spec_schema] ...#/$defs:183:3: fails the `schema` constraint
#
# The fix is mechanical and lossless: every overlapping name is confirmed (see the PR that
# introduced this file) to be exactly that redirect shape, so merging `$defs` bodies into
# `components.schemas`, dropping `$defs`, and rewriting `#/$defs/X` refs to
# `#/components/schemas/X` reproduces the same effective document the Java generator already
# resolves.
function normalize_bundle(path::AbstractString)
    doc = JSON.parsefile(path; dicttype=Dict{String, Any})
    defs = get(doc, "\$defs", nothing)
    if defs !== nothing
        schemas = doc["components"]["schemas"]
        for (name, body) in defs
            schemas[name] = body
        end
        delete!(doc, "\$defs")
    end
    text = JSON.json(doc)
    return replace(text, "#/\$defs/" => "#/components/schemas/")
end
