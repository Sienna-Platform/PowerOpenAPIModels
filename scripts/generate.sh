#!/usr/bin/env bash
# scripts/generate.sh
#
# Main entrypoint for code generation. Runs the full pipeline:
#   1. OpenAPI Generator (julia-client target) for each domain
#   2. Reorganize stubs into monorepo subpackages
#   3. Format with JuliaFormatter
#
# Usage: generate.sh <schema-dir> <output-dir>
#   schema-dir  — directory containing core.yaml, operations.yaml, etc.
#   output-dir  — repository root (where scripts/, PowerCore*, etc. live)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

SCHEMA_DIR="${1:?Usage: generate.sh <schema-dir> <output-dir>}"
OUTPUT_DIR="${2:?Usage: generate.sh <schema-dir> <output-dir>}"

declare -A DOMAIN_PKG=(
  [core]="PowerCoreOpenAPIModels"
  [operations]="PowerOperationsOpenAPIModels"
  [investments]="PowerInvestmentsOpenAPIModels"
  [dynamics]="PowerDynamicsOpenAPIModels"
)

# ── Step 1: Generate raw stubs ──────────────────────────────────────────────
echo "==> Generating Julia stubs"
for domain in "${!DOMAIN_PKG[@]}"; do
  pkg="${DOMAIN_PKG[$domain]}"
  echo "    → $domain ($pkg)"
  openapi-generator-cli generate \
    -i "$SCHEMA_DIR/${domain}.yaml" \
    -g julia-client \
    -o "$OUTPUT_DIR/generated/${domain}" \
    --additional-properties=packageName="$pkg" \
    --skip-validate-spec \
    > /dev/null
done

# ── Step 2: Reorganize into monorepo layout ─────────────────────────────────
echo "==> Reorganizing stubs"
bash "$SCRIPT_DIR/reorganize_stubs.sh"

# ── Step 3: Format ──────────────────────────────────────────────────────────
echo "==> Formatting with JuliaFormatter"
julia -e '
  using JuliaFormatter
  for pkg in [
    "PowerCoreOpenAPIModels.jl",
    "PowerOperationsOpenAPIModels.jl",
    "PowerInvestmentsOpenAPIModels.jl",
    "PowerDynamicsOpenAPIModels.jl",
  ]
    dir = joinpath("'"$OUTPUT_DIR"'", pkg, "src")
    if isdir(dir)
      format(dir)
    end
  end
' || true

echo "==> Generation complete"
