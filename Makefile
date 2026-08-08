SCHEMA_DIR ?= ../SiennaSchemas
CODEGEN_IMAGE ?= ghcr.io/sienna-platform/power-codegen:latest
DOMAINS := core operations investments dynamics

.PHONY: generate generate-docker clean validate schema-version

generate:
	@# materialize_defaults.jl and reorganize.jl's unit emission read
	@# dist/openapi-<domain>-bundled.json rather than the SiennaSchemas sources, and
	@# neither can tell a stale bundle from a fresh one. --check is read-only, which
	@# matters because $(SCHEMA_DIR) is mounted read-only under generate-docker; drift
	@# is a SiennaSchemas-side bug to surface, not to fix by regenerating a copy here.
	cd $(SCHEMA_DIR) && python3 scripts/bundle_specs.py --check
	@for d in $(DOMAINS); do \
	  echo "Generating $$d"; \
	  cd $(SCHEMA_DIR) && openapi-generator generate \
	    -c openapi-config-$$d.json -g julia-client \
	    -o $(CURDIR)/generated/$$d \
	    --additional-properties=packageName=Power$$(echo $$d | awk '{print toupper(substr($$1,1,1)) substr($$1,2)}')OpenAPIModels \
	    > /dev/null; \
	done
	@# Resolve fresh: the repo is bind-mounted into the codegen container, so a
	@# manifest written by the host's Julia would be read by a different version.
	rm -f scripts/Manifest.toml
	julia --project=scripts -e 'using Pkg; Pkg.instantiate()'
	SCHEMA_DIR=$(abspath $(SCHEMA_DIR)) julia --project=scripts scripts/reorganize.jl
	@# openapi-generator's julia-client drops object/array schema defaults (see
	@# PATCHES.md); this rewrites the affected field initializers in place, after the
	@# model files have reached their final package location.
	SCHEMA_DIR=$(abspath $(SCHEMA_DIR)) julia --project=scripts scripts/materialize_defaults.jl

generate-docker:
	docker run --rm \
	  -v $(abspath $(SCHEMA_DIR)):/schemas:ro \
	  -v $(CURDIR):/output \
	  $(CODEGEN_IMAGE)
	@$(MAKE) --no-print-directory schema-version

# Record which schema state the generated output came from. Without this the only evidence
# tying generated code to a schema revision is file mtimes.
#
# CI overwrites this with the SiennaSchemas release tag it regenerated against (see
# .github/workflows/update-schema.yml). A local run records the sibling checkout's git
# description instead, including `-dirty`: output generated from a schema tree with
# uncommitted changes is not reproducible from any committed state, and should say so rather
# than name a revision it does not actually match.
#
# Stamped on the host, not inside the codegen container, which has no git.
schema-version:
	@if git -C $(SCHEMA_DIR) rev-parse --git-dir >/dev/null 2>&1; then \
	  git -C $(SCHEMA_DIR) describe --always --dirty --tags > .schema-version; \
	  echo "stamped .schema-version: $$(cat .schema-version)"; \
	else \
	  echo "SKIP .schema-version: $(SCHEMA_DIR) is not a git checkout"; \
	fi

clean:
	rm -rf generated/ */src/models */src/apis */docs

validate:
	julia test/validate.jl
