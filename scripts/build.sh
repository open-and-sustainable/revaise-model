#!/usr/bin/env bash
set -euo pipefail

SCHEMA_DIR="schema"
OUT="site"
VER="${1:-dev}"
BASE_URL="/revaise-model"

rm -rf "$OUT"
mkdir -p "$OUT/schema/$VER" "$OUT/schema/latest" "$OUT/docs/$VER"

# Build the main revaise schema
echo "Building RevAIse schema..."
gen-json-schema "$SCHEMA_DIR/revaise.yaml" > "$OUT/schema/$VER/revaise.schema.json"
gen-jsonld-context "$SCHEMA_DIR/revaise.yaml" > "$OUT/schema/$VER/context.jsonld"
gen-doc "$SCHEMA_DIR/revaise.yaml" --directory "$OUT/docs/$VER"
cp "$SCHEMA_DIR/revaise.yaml" "$OUT/schema/$VER/revaise.yaml"

# Copy to latest
cp "$OUT/schema/$VER/revaise.schema.json" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/context.jsonld" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/revaise.yaml" "$OUT/schema/latest/"

# Copy docs to latest
cp -r "$OUT/docs/$VER" "$OUT/docs/latest"

# Create index.json with correct paths
cat > "$OUT/schema/latest/index.json" <<EOF
{
  "revaise": {
    "yaml": "${BASE_URL}/schema/${VER}/revaise.yaml",
    "jsonschema": "${BASE_URL}/schema/${VER}/revaise.schema.json",
    "context": "${BASE_URL}/schema/${VER}/context.jsonld",
    "docs": "${BASE_URL}/docs/${VER}/"
  }
}
EOF

# Create index.html with correct paths and better formatting
cat > "$OUT/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>RevAIse Data Model</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            line-height: 1.6;
        }
        h1 { color: #333; }
        h2 { color: #555; margin-top: 2rem; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 0.5rem 0; }
        a {
            color: #0066cc;
            text-decoration: none;
            padding: 0.25rem 0.5rem;
            display: inline-block;
        }
        a:hover {
            text-decoration: underline;
            background-color: #f0f0f0;
            border-radius: 3px;
        }
        .version-info {
            background-color: #f8f9fa;
            padding: 1rem;
            border-radius: 5px;
            margin: 1rem 0;
        }
    </style>
</head>
<body>
    <h1>RevAIse Data Model</h1>
    <p>A LinkML schema for AI-assisted systematic literature reviews.</p>

    <div class="version-info">
        <strong>Version:</strong> ${VER}
    </div>

    <h2>Schema Resources</h2>
    <ul>
        <li>📄 <a href="${BASE_URL}/schema/latest/revaise.yaml">YAML Schema</a> - LinkML source schema</li>
        <li>🔧 <a href="${BASE_URL}/schema/latest/revaise.schema.json">JSON Schema</a> - For validation</li>
        <li>🔗 <a href="${BASE_URL}/schema/latest/context.jsonld">JSON-LD Context</a> - For linked data</li>
        <li>📚 <a href="${BASE_URL}/docs/${VER}/">Documentation</a> - Complete reference</li>
        <li>🔍 <a href="${BASE_URL}/schema/latest/index.json">Programmatic Index</a> - For tool integration</li>
    </ul>

    <h2>Quick Links</h2>
    <ul>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/Review.md">Review Class Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/SearchStage.md">Search Stage Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/ScreeningStage.md">Screening Stage Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/StageExecution.md">Stage Execution Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/LiteratureRecord.md">Literature Record Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/Author.md">Author Documentation</a></li>
    </ul>

    <h2>Available Versions</h2>
    <ul>
        <li><a href="${BASE_URL}/schema/latest/">Latest (${VER})</a></li>
EOF

# Add links to other versions if they exist
if [ "$VER" != "dev" ]; then
    echo "        <li><a href=\"${BASE_URL}/schema/dev/\">Development</a></li>" >> "$OUT/index.html"
fi

cat >> "$OUT/index.html" <<EOF
    </ul>

    <h2>Source Code</h2>
    <p>
        <a href="https://github.com/open-and-sustainable/revaise-model">GitHub Repository</a>
    </p>
</body>
</html>
EOF

# Create a simple 404 page
cat > "$OUT/404.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>404 - Page Not Found</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            max-width: 600px;
            margin: 4rem auto;
            padding: 2rem;
            text-align: center;
        }
        h1 { color: #333; }
        a { color: #0066cc; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>404 - Page Not Found</h1>
    <p>The page you're looking for doesn't exist.</p>
    <p><a href="${BASE_URL}/">Return to homepage</a></p>
</body>
</html>
EOF

echo "Build complete!"
echo "Files generated in $OUT/"
echo "Site will be available at: https://open-and-sustainable.github.io/revaise-model/"
