#!/usr/bin/env bash
set -euo pipefail

SCHEMA_DIR="schema"
OUT="site"
VER="${1:-dev}"

rm -rf "$OUT"
mkdir -p "$OUT/schema/$VER" "$OUT/schema/latest" "$OUT/docs/$VER"

# Build the main revaise schema
echo "Building RevAIse schema..."
gen-json-schema "$SCHEMA_DIR/revaise.yaml" > "$OUT/schema/$VER/revaise.schema.json"
gen-jsonld-context "$SCHEMA_DIR/revaise.yaml" > "$OUT/schema/$VER/context.jsonld"
gen-doc "$SCHEMA_DIR/revaise.yaml" --directory "$OUT/docs/$VER"
cp "$SCHEMA_DIR/revaise.yaml" "$OUT/schema/$VER/revaise.yaml"

# Copy to latest
cp "$OUT/schema/$VER/"*.{yaml,json,jsonld} "$OUT/schema/latest/"

# Create index
echo '{"revaise": {"yaml": "/schema/'$VER'/revaise.yaml", "jsonschema": "/schema/'$VER'/revaise.schema.json", "context": "/schema/'$VER'/context.jsonld", "docs": "/docs/'$VER'/"}}' > "$OUT/schema/latest/index.json"

# Create index.html
cat > "$OUT/index.html" <<EOF
<!doctype html><meta charset="utf-8">
<title>RevAIse Data Model</title>
<h1>RevAIse (revaise) Data Model</h1>
<p>Programmatic pointer: <a href="/schema/latest/index.json">/schema/latest/index.json</a></p>
<p>Docs: <a href="/docs/$VER/">/docs/$VER/</a></p>
<p>JSON Schema: <a href="/schema/latest/revaise.schema.json">/schema/latest/revaise.schema.json</a></p>
<p>YAML Schema: <a href="/schema/latest/revaise.yaml">/schema/latest/revaise.yaml</a></p>
<p>JSON-LD Context: <a href="/schema/latest/context.jsonld">/schema/latest/context.jsonld</a></p>
EOF

echo "Build complete!"
