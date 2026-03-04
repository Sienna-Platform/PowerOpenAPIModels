SCHEMA_DIR ?= ../SiennaSchemas
DOMAINS := core operations investments dynamics

.PHONY: generate clean validate

generate:
	@for d in $(DOMAINS); do \
	  echo "Generating $$d"; \
	  cd $(SCHEMA_DIR) && openapi-generator generate \
	    -c openapi-config-$$d.json -g julia-client \
	    -o $(CURDIR)/generated/$$d \
	    --additional-properties=packageName=Power$$(echo $$d | sed 's/./\U&/')OpenAPIModels \
	    > /dev/null; \
	done
	julia scripts/reorganize.jl

clean:
	rm -rf generated/ */src/models */src/apis

validate:
	julia test/validate.jl
