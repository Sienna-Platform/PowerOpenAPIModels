FROM julia:1.11-bookworm

# OpenAPI.jl 1.0's native pure-Julia generator (OpenAPI.client) replaced the Java
# openapi-generator + Docker JVM toolchain this image used to carry -- no JRE, no jar
# download, no `openapi-generator` shim. make/python3 remain: make drives the pipeline, and
# python3 runs SiennaSchemas' own scripts/check_refs.py.
RUN apt-get update && \
    apt-get install -y --no-install-recommends make python3 && \
    rm -rf /var/lib/apt/lists/*

# scripts/generate_native.jl reads the SiennaSchemas selectors (JSON) and lets OpenAPI.jl
# resolve the $ref graph across files -- both must be in the depot before the repo is
# mounted at /output.
RUN julia -e 'using Pkg; Pkg.add(name="JSON", version="1"); Pkg.add(name="OpenAPI", version="1.1")'

WORKDIR /output
ENTRYPOINT ["make", "generate", "SCHEMA_DIR=/schemas"]
