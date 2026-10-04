SCHEMA_DIR ?= ../SiennaSchemas
CODEGEN_IMAGE ?= ghcr.io/sienna-platform/power-codegen:latest
# SiennaSchemas splits its purely-administrative/association schemas (SupplementalAttribute-
# Association, GeographicInfo, DataSource, the shared MinMax/InOut/UpDown/... value types) into
# a separate `infrastructure-core` bundle -- see openapi-infrastructure-core.json and
# scripts/check_layering.py there. InfrastructureCoreOpenAPIModels.jl is that bundle's own
# package, generated and deduped like every other domain in scripts/generate_native.jl's base
# chain.
#
# Order matches the dependency chain in scripts/generate_native.jl: a domain's bases must be
# generated before it, because dedup reads the bases' kept-name sets.
DOMAINS := infrastructure-core timeseries core operations investments dynamics

.PHONY: generate generate-docker clean validate test precompile docs schema-version package-assets

# DOC_PKG ships the document reader's schema version and strict bundles; TEST_PKG holds the
# cross-package document tests and their vendored fixtures.
DOC_PKG := InfrastructureCoreOpenAPIModels.jl
TEST_PKG := PowerOpenAPIModels.jl

# OpenAPI.jl 1.0's native pure-Julia generator (OpenAPI.client) replaces the Java
# openapi-generator + Docker pipeline: no JVM, no jar download, generate-docker below is now
# just `julia` in a container. See scripts/generate_native.jl's header for how the per-domain
# dedup this used to get from reorganize.jl works against the native generator's one-file-
# per-domain output instead.
generate:
	@# scripts/generate_native.jl reads $(SCHEMA_DIR)/openapi-<domain>.json and lets
	@# OpenAPI.jl resolve the $$ref graph across files, so there is no built artifact to
	@# go stale. The selectors must declare every schema they reach or the generator
	@# names a shared type once per reference site; check_refs.py there is that gate,
	@# and it is read-only, which matters because $(SCHEMA_DIR) is mounted read-only
	@# under generate-docker.
	cd $(SCHEMA_DIR) && python3 scripts/check_refs.py
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
#
# The document reader reads its version from $(DOC_PKG)/schema-version, a copy of the
# root file: the root is outside the registered subpackage, so the copy is what ships.
#
# The vendored fixtures carry a literal schema_version; it is re-stamped to the same version so
# they stay readable once the reader moves to a new line.
schema-version:
	@if git -C $(SCHEMA_DIR) rev-parse --git-dir >/dev/null 2>&1; then \
	  git -C $(SCHEMA_DIR) describe --always --dirty --tags > .schema-version; \
	  echo "stamped .schema-version: $$(cat .schema-version)"; \
	else \
	  echo "SKIP .schema-version: $(SCHEMA_DIR) is not a git checkout"; \
	fi
	cp .schema-version $(DOC_PKG)/schema-version
	python3 scripts/stamp_fixtures.py

# Strict validation bundles (shipped with $(DOC_PKG) for `source`-version writes) and the
# shared reader-rule vectors (vendored for $(TEST_PKG)'s tests). SCHEMA_DIR is either an
# unpacked release tarball (bundles/ and versioning/ at its root, what CI uses) or a
# SiennaSchemas checkout, from which the bundles of the current compatibility line are built.
package-assets:
	rm -rf $(DOC_PKG)/bundles
	@if [ -d $(SCHEMA_DIR)/bundles ]; then \
	  cp -R $(SCHEMA_DIR)/bundles $(DOC_PKG)/bundles; \
	else \
	  python3 $(SCHEMA_DIR)/scripts/build_bundles.py --line --out $(DOC_PKG)/bundles; \
	fi
	mkdir -p $(TEST_PKG)/test/fixtures/versioning
	@if [ -f $(SCHEMA_DIR)/versioning/cases.json ]; then \
	  cp $(SCHEMA_DIR)/versioning/cases.json $(TEST_PKG)/test/fixtures/versioning/cases.json; \
	else \
	  cp $(SCHEMA_DIR)/tests/fixtures/versioning/cases.json $(TEST_PKG)/test/fixtures/versioning/cases.json; \
	fi

clean:
	rm -rf .native_raw/

# Runs every package's own `test/runtests.jl` through `Pkg.test`, in dependency order.
# `test` is the same thing under the name people reach for first.
validate test:
	julia --project=test test/validate.jl

# Each package precompiles on its own -- the check registration makes load-bearing, and the
# one `using` and `Pkg.precompile` both pass on. See test/precompile.jl.
precompile:
	julia test/precompile.jl

# The documentation site for all seven packages. Output lands in docs/build.
docs:
	julia --project=docs -e 'using Pkg; Pkg.instantiate()'
	julia --project=docs docs/make.jl
