FROM julia:1.11-bookworm

# Install Node.js (for openapi-generator-cli) and Java (runtime dependency)
RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs npm default-jre-headless && \
    rm -rf /var/lib/apt/lists/*

# Install openapi-generator-cli
RUN npm install -g @openapitools/openapi-generator-cli

# Pre-install JuliaFormatter
RUN julia -e 'using Pkg; Pkg.add("JuliaFormatter"); Pkg.precompile()'

# Copy scripts into the image
COPY scripts/ /opt/scripts/
RUN chmod +x /opt/scripts/*.sh

ENTRYPOINT ["/opt/scripts/generate.sh"]
