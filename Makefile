SCHEMA_DIR ?= ../SiennaSchemas
CODEGEN_IMAGE ?= ghcr.io/sienna-platform/power-codegen:latest
DOMAINS := core operations investments dynamics

.PHONY: generate generate-docker clean validate

generate:
	@for d in $(DOMAINS); do \
	  echo "Generating $$d"; \
	  cd $(SCHEMA_DIR) && openapi-generator generate \
	    -c openapi-config-$$d.json -g julia-client \
	    -o $(CURDIR)/generated/$$d \
	    --additional-properties=packageName=Power$$(echo $$d | awk '{print toupper(substr($$1,1,1)) substr($$1,2)}')OpenAPIModels \
	    > /dev/null; \
	done
	julia scripts/reorganize.jl

generate-docker:
	docker run --rm \
	  -v $(abspath $(SCHEMA_DIR)):/schemas:ro \
	  -v $(CURDIR):/output \
	  $(CODEGEN_IMAGE)

clean:
	rm -rf generated/ */src/models */src/apis */docs

validate:
	julia test/validate.jl
