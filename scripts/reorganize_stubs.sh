#!/usr/bin/env bash
# scripts/reorganize_stubs.sh
#
# Redistributes auto-generated OpenAPI stubs into the monorepo subpackages.
# Run from the repository root after openapi-generator has written to generated/.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GENERATED="$REPO_ROOT/generated"

# Map: domain -> subpackage directory name
declare -A DOMAINS=(
  [core]="PowerCoreOpenAPIModels.jl"
  [operations]="PowerOperationsOpenAPIModels.jl"
  [investments]="PowerInvestmentsOpenAPIModels.jl"
  [dynamics]="PowerDynamicsOpenAPIModels.jl"
)

for domain in "${!DOMAINS[@]}"; do
  pkg_dir="$REPO_ROOT/${DOMAINS[$domain]}"
  gen_dir="$GENERATED/$domain"

  if [[ ! -d "$gen_dir" ]]; then
    echo "WARNING: $gen_dir not found, skipping $domain"
    continue
  fi

  echo "==> Processing $domain -> ${DOMAINS[$domain]}"

  # Clean previous generated source (preserve Project.toml and test/)
  rm -rf "$pkg_dir/src/models" "$pkg_dir/src/apis"
  mkdir -p "$pkg_dir/src/models" "$pkg_dir/src/apis"

  # Copy model files
  if [[ -d "$gen_dir/src/models" ]]; then
    cp "$gen_dir/src/models/"*.jl "$pkg_dir/src/models/" 2>/dev/null || true
  fi

  # Copy API files
  if [[ -d "$gen_dir/src/apis" ]]; then
    cp "$gen_dir/src/apis/"*.jl "$pkg_dir/src/apis/" 2>/dev/null || true
  fi

  # Regenerate the top-level module include file
  MODULE_FILE="$pkg_dir/src/${DOMAINS[$domain]%.jl}.jl"
  PKG_NAME="${DOMAINS[$domain]%.jl}"

  cat > "$MODULE_FILE" <<EOF
module $PKG_NAME

using OpenAPI
using JSON3
using HTTP
EOF

  # Add dependency on Core for non-core packages
  if [[ "$domain" != "core" ]]; then
    echo "using PowerCoreOpenAPIModels" >> "$MODULE_FILE"
  fi

  echo "" >> "$MODULE_FILE"

  # Include all model files
  echo "# --- Models ---" >> "$MODULE_FILE"
  for f in "$pkg_dir/src/models/"*.jl; do
    [[ -f "$f" ]] && echo "include(\"models/$(basename "$f")\")" >> "$MODULE_FILE"
  done

  # Include all API files
  echo "" >> "$MODULE_FILE"
  echo "# --- APIs ---" >> "$MODULE_FILE"
  for f in "$pkg_dir/src/apis/"*.jl; do
    [[ -f "$f" ]] && echo "include(\"apis/$(basename "$f")\")" >> "$MODULE_FILE"
  done

  # Export all public symbols (types and API functions)
  echo "" >> "$MODULE_FILE"
  echo "# --- Exports ---" >> "$MODULE_FILE"
  grep -rh "^struct \|^abstract type \|^function " "$pkg_dir/src/models/" "$pkg_dir/src/apis/" 2>/dev/null \
    | sed -E 's/^struct ([A-Za-z_]+).*/export \1/' \
    | sed -E 's/^abstract type ([A-Za-z_]+).*/export \1/' \
    | sed -E 's/^function ([A-Za-z_]+).*/export \1/' \
    | sort -u >> "$MODULE_FILE"

  echo "" >> "$MODULE_FILE"
  echo "end # module" >> "$MODULE_FILE"

  echo "    Wrote $MODULE_FILE"
done

# Clean up generated directory
echo "==> Cleaning generated/"
rm -rf "$GENERATED"

echo "==> Done. Review git diff before committing."
