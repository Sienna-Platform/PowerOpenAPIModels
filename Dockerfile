FROM julia:1.11-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends default-jre-headless make curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ARG OPENAPI_GENERATOR_VERSION=7.20.0
RUN curl -fsSL -o /usr/local/bin/openapi-generator-cli.jar \
      "https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${OPENAPI_GENERATOR_VERSION}/openapi-generator-cli-${OPENAPI_GENERATOR_VERSION}.jar" && \
    printf '#!/bin/sh\nexec java -jar /usr/local/bin/openapi-generator-cli.jar "$@"\n' > /usr/local/bin/openapi-generator && \
    chmod +x /usr/local/bin/openapi-generator

WORKDIR /output
ENTRYPOINT ["make", "generate", "SCHEMA_DIR=/schemas"]
