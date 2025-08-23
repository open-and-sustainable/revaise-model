#!/usr/bin/env bash
set -euo pipefail

SCHEMA="schema/revaise.yaml"
OUT="site"
VER="${1:-dev}"

rm -rf "$OUT"
mkdir -p "$OUT/schema/$VER" "$OUT/schema/latest"

gen-json-schema "$SCHEMA" > "$OUT/schema/$VER/revaise.schema.json"
gen-jsonld-context "$SCHEMA" > "$OUT/schema/$VER/context.jsonld"
gen-doc --schema "$SCHEMA" --output "$OUT/docs/$VER"

cp "$SCHEMA" "$OUT/schema/$VER/revaise.yaml"

if [[ "$VER" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  jq -n --arg v "$VER" \
    '{version:$v,
      files:{
        yaml:"/schema/\($v)/revaise.yaml",
        jsonschema:"/schema/\($v)/revaise.schema.json",
        context:"/schema/\($v)/context.jsonld",
        docs:"/docs/\($v)/"
      }}' > "$OUT/schema/latest/index.json"
  for f in revaise.yaml revaise.schema.json context.jsonld; do
    cp "$OUT/schema/$VER/$f" "$OUT/schema/latest/$f"
  done
fi

cat > "$OUT/index.html" <<EOF
<!doctype html><meta charset="utf-8">
<title>RevAIse Data Model</title>
<h1>RevAIse (revaise) Data Model</h1>
<p>Programmatic pointer: <a href="/schema/latest/index.json">/schema/latest/index.json</a></p>
<p>Docs: <a href="/docs/$VER/">/docs/$VER/</a></p>
EOF
