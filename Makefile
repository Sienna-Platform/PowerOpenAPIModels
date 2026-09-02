SCHEMA_DIR ?= ../SiennaSchemas
CODEGEN_IMAGE ?= ghcr.io/sienna-platform/power-codegen:latest
# SiennaSchemas splits its purely-administrative/association schemas (SupplementalAttribute-
# Association, GeographicInfo, DataSource, the shared MinMax/InOut/UpDown/... value types) into
# a separate `infrastructure-core` bundle -- see openapi-config-infrastructure-core.json and
# scripts/check_layering.py there. InfrastructureCoreOpenAPIModels.jl is that bundle's own
# package, generated and deduped like every other domain in scripts/generate_native.jl's base
# chain.
#
# Order matches the dependency chain in scripts/generate_native.jl: a domain's bases must be
# generated before it, because dedup reads the bases' kept-name sets.
DOMAINS := infrastructure-core timeseries core operations investments dynamics

.PHONY: generate generate-docker clean validate schema-version

# OpenAPI.jl 1.0's native pure-Julia generator (OpenAPI.client) replaces the Java
# openapi-generator + Docker pipeline: no JVM, no jar download, generate-docker below is now
# just `julia` in a container. See scripts/generate_native.jl's header for how the per-domain
# dedup this used to get from reorganize.jl works against the native generator's one-file-
# per-domain output instead.
generate:
	@# scripts/generate_native.jl reads dist/openapi-<domain>-bundled.json rather than the
	@# SiennaSchemas sources, and can't tell a stale bundle from a fresh one. --check is
	@# read-only, which matters because $(SCHEMA_DIR) is mounted read-only under
	@# generate-docker; drift is a SiennaSchemas-side bug to surface, not to fix by
	@# regenerating a copy here.
	cd $(SCHEMA_DIR) && python3 scripts/bundle_specs.py --check
	@# Resolve fresh: the repo is bind-mounted into the codegen container, so a
	@# manifest written by the host's Julia would be read by a different version.
	rm -f scripts/Manifest.toml
	julia --project=scripts -e 'using Pkg; Pkg.instantiate()'
	SCHEMA_DIR=$(abspath $(SCHEMA_DIR)) julia --project=scripts scripts/generate_native.jl

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
	rm -rf .native_raw/

validate:
	julia test/validate.jl
