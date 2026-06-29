#!/usr/bin/env bash
# Assemble publishable artifacts for a single protocol version, for GitHub Pages.
#
# The version comes from the release tag (e.g. prisma-2020-1.0.0 -> name prisma-2020,
# version 1.0.0); it is never hand-written. Lays artifacts under immutable versioned paths
# plus a `latest` copy, with a provenance manifest.json (commit + shapes blob hash).
#
# Usage: scripts/build_protocols.sh <protocol_name> <version> [out_dir]
set -euo pipefail

NAME="${1:?protocol name required (e.g. prisma-2020)}"
VER="${2:?version required (e.g. 1.0.0)}"
OUT="${3:-site_protocols}"

SRC="protocols/${NAME}"
[ -d "$SRC" ] || { echo "Unknown protocol: $SRC not found" >&2; exit 1; }
SHAPES_FILE="$(ls "$SRC"/*.shacl.ttl 2>/dev/null | head -1)"
[ -n "$SHAPES_FILE" ] || { echo "No *.shacl.ttl in $SRC" >&2; exit 1; }

DEST="${OUT}/protocols/${NAME}/${VER}"
LATEST="${OUT}/protocols/${NAME}/latest"
rm -rf "$DEST" "$LATEST"
mkdir -p "$DEST"

cp "$SRC"/*.shacl.ttl "$DEST"/
[ -f "$SRC/protocol.yaml" ] && cp "$SRC/protocol.yaml" "$DEST"/
[ -f "$SRC/mapping.md" ]   && cp "$SRC/mapping.md"   "$DEST"/
[ -d "$SRC/docs" ]         && cp -r "$SRC/docs"      "$DEST"/
[ -d "$SRC/examples" ]     && cp -r "$SRC/examples"  "$DEST"/

COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
SHAPES_HASH="$(git hash-object "$SHAPES_FILE" 2>/dev/null || sha256sum "$SHAPES_FILE" | cut -d' ' -f1)"

cat > "$DEST/manifest.json" <<EOF
{
  "protocol": "${NAME}",
  "version": "${VER}",
  "source_commit": "${COMMIT}",
  "shapes_file": "$(basename "$SHAPES_FILE")",
  "shapes_blob_sha1": "${SHAPES_HASH}"
}
EOF

cat > "$DEST/index.html" <<EOF
<!doctype html><meta charset="utf-8"><title>${NAME} ${VER}</title>
<h1>${NAME} ${VER}</h1>
<ul>
<li><a href="$(basename "$SHAPES_FILE")">SHACL shapes</a></li>
<li><a href="protocol.yaml">protocol.yaml</a></li>
<li><a href="mapping.md">mapping.md</a></li>
<li><a href="manifest.json">manifest.json</a></li>
</ul>
EOF

( cd "$DEST" && sha256sum ./*.ttl ./*.yaml ./*.md manifest.json 2>/dev/null > SHA256SUMS || true )

cp -r "$DEST" "$LATEST"

mkdir -p "${OUT}/protocols"
[ -f protocols/index.json ] && cp protocols/index.json "${OUT}/protocols/index.json"

echo "Built protocol ${NAME} ${VER} -> ${DEST} (+ latest)"
