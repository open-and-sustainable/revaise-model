#!/usr/bin/env bash
set -euo pipefail

PROFILES_DIR="schema/model/profiles"
OUT="site"
VER="${1:-dev}"

rm -rf "$OUT"
mkdir -p "$OUT/schema/$VER" "$OUT/schema/latest"

index="{}"
for schema in "$PROFILES_DIR"/*.yaml; do
  name=$(basename "$schema" .yaml)
  mkdir -p "$OUT/schema/$VER/$name" "$OUT/docs/$VER/$name" "$OUT/schema/latest/$name"
  gen-json-schema "$schema" > "$OUT/schema/$VER/$name/${name}.schema.json"
  gen-jsonld-context "$schema" > "$OUT/schema/$VER/$name/context.jsonld"
  gen-doc "$schema" --directory "$OUT/docs/$VER/$name"
  cp "$schema" "$OUT/schema/$VER/$name/${name}.yaml"
  cp "$OUT/schema/$VER/$name/"{${name}.yaml,${name}.schema.json,context.jsonld} "$OUT/schema/latest/$name/"
  index=$(echo "$index" | jq --arg n "$name" --arg v "$VER" '. + {($n): {yaml:("/schema/"+$v+"/"+$n+"/"+$n+".yaml"), jsonschema:("/schema/"+$v+"/"+$n+"/"+$n+".schema.json"), context:("/schema/"+$v+"/"+$n+"/context.jsonld"), docs:("/docs/"+$v+"/"+$n+"/")}}')
done

echo "$index" > "$OUT/schema/latest/index.json"

cat > "$OUT/index.html" <<EOF
<!doctype html><meta charset="utf-8">
<title>RevAIse Data Model</title>
<h1>RevAIse (revaise) Data Model</h1>
<p>Programmatic pointer: <a href="/schema/latest/index.json">/schema/latest/index.json</a></p>
<p>Docs: <a href="/docs/$VER/">/docs/$VER/</a></p>
EOF
