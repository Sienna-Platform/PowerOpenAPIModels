CODEGEN_IMAGE := ghcr.io/nrel-sienna/power-codegen:latest

DOMAINS := core operations investments dynamics

.PHONY: generate generate-stubs reorganize clean

generate: generate-stubs reorganize

generate-stubs:
	@for domain in $(DOMAINS); do \
	  echo "==> Generating $$domain stubs"; \
	  openapi-generator-cli generate \
	    -i openapi/$$domain.yaml \
	    -g julia-client \
	    -o generated/$$domain \
	    --additional-properties=packageName=Power$$(echo $$domain | sed 's/^./\U&/')OpenAPIModels; \
	done

reorganize:
	bash scripts/reorganize_stubs.sh

generate-docker:
	docker run --rm \
	  -v $(CURDIR)/openapi:/schemas:ro \
	  -v $(CURDIR):/output \
	  $(CODEGEN_IMAGE) \
	  --target julia --schemas /schemas --output /output

clean:
	rm -rf generated/
