#!/usr/bin/env bash
set -euo pipefail

SCHEMA_DIR="schema"
OUT="site"

# Determine version from argument, Git, VERSION file, or fallback.
# Priority: argument > Git tag > Git branch > VERSION file > 'dev'
if [ -n "${1:-}" ]; then
    # Use provided argument
    VER="$1"
elif git describe --exact-match --tags HEAD 2>/dev/null; then
    # We're on a tag, use it (remove 'v' prefix if present)
    VER=$(git describe --exact-match --tags HEAD | sed 's/^v//')
elif [ "$(git rev-parse --abbrev-ref HEAD)" = "main" ] || [ "$(git rev-parse --abbrev-ref HEAD)" = "master" ]; then
    # We're on main/master branch, check if VERSION file exists for development version
    if [ -f "VERSION" ]; then
        # Append -dev to distinguish from stable
        VER="$(cat VERSION | tr -d '[:space:]')-dev"
    else
        VER="dev"
    fi
elif [ -f "VERSION" ]; then
    # Not on tag or main, use VERSION file
    VER=$(cat VERSION | tr -d '[:space:]')
else
    # Default to dev
    VER="dev"
fi

# For ReadTheDocs environment, check environment variables
if [ -n "${READTHEDOCS_VERSION:-}" ]; then
    if [ "$READTHEDOCS_VERSION" = "latest" ]; then
        # Building latest from main branch
        if [ -f "VERSION" ]; then
            VER="$(cat VERSION | tr -d '[:space:]')-dev"
        else
            VER="dev"
        fi
    elif [ "$READTHEDOCS_VERSION" = "stable" ]; then
        # Building stable - use VERSION file without -dev suffix
        if [ -f "VERSION" ]; then
            VER=$(cat VERSION | tr -d '[:space:]')
        fi
    else
        # Building a specific version tag
        VER="$READTHEDOCS_VERSION"
    fi
fi

BASE_URL="/revaise-model"

rm -rf "$OUT"
mkdir -p "$OUT/schema/$VER" "$OUT/schema/latest" "$OUT/docs/$VER"

# Build the main revaise schema
echo "Building main RevAIse schema (version: $VER)..."

# Create a temporary directory to work in
TEMP_DIR=$(mktemp -d)
cp -r "$SCHEMA_DIR"/* "$TEMP_DIR/"

# Always inject version into the schema
sed -i "s/^name: revaise$/name: revaise\nversion: ${VER}/" "$TEMP_DIR/revaise.yaml"

gen-json-schema --top-class Review --include-range-class-descendants "$TEMP_DIR/revaise.yaml" > "$OUT/schema/$VER/revaise.schema.json"
gen-jsonld-context "$TEMP_DIR/revaise.yaml" > "$OUT/schema/$VER/context.jsonld"
gen-shacl "$TEMP_DIR/revaise.yaml" > "$OUT/schema/$VER/revaise.shacl.ttl"
gen-owl --no-add-ols-annotations -f ttl "$TEMP_DIR/revaise.yaml" > "$OUT/schema/$VER/revaise.owl.ttl"
gen-owl --no-add-ols-annotations -f ttl "$TEMP_DIR/revaise.yaml" > "$OUT/schema/$VER/revaise.rdf.ttl"
gen-doc "$TEMP_DIR/revaise.yaml" --directory "$OUT/docs/$VER/main"
cp "$TEMP_DIR/revaise.yaml" "$OUT/schema/$VER/revaise.yaml"
cp "$TEMP_DIR/revaise.yaml" "$OUT/schema/$VER/revaise.linkml.yaml"

SOURCE_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
LINKML_VERSION=$(gen-json-schema --version 2>/dev/null | awk '{print $NF}' || echo "unknown")

(
  cd "$OUT/schema/$VER"
  sha256sum \
    revaise.linkml.yaml \
    revaise.yaml \
    revaise.schema.json \
    context.jsonld \
    revaise.shacl.ttl \
    revaise.owl.ttl \
    revaise.rdf.ttl > SHA256SUMS
)

checksum_for() {
  sha256sum "$OUT/schema/$VER/$1" | awk '{print $1}'
}

cat > "$OUT/schema/$VER/manifest.json" <<EOF
{
  "name": "revaise",
  "version": "${VER}",
  "source_commit": "${SOURCE_COMMIT}",
  "linkml_version": "${LINKML_VERSION}",
  "root_class": "Review",
  "artifacts": {
    "linkml": "revaise.linkml.yaml",
    "yaml": "revaise.yaml",
    "json_schema": "revaise.schema.json",
    "jsonld_context": "context.jsonld",
    "shacl": "revaise.shacl.ttl",
    "owl": "revaise.owl.ttl",
    "rdf": "revaise.rdf.ttl",
    "checksums": "SHA256SUMS"
  },
  "checksums_sha256": {
    "revaise.linkml.yaml": "$(checksum_for revaise.linkml.yaml)",
    "revaise.yaml": "$(checksum_for revaise.yaml)",
    "revaise.schema.json": "$(checksum_for revaise.schema.json)",
    "context.jsonld": "$(checksum_for context.jsonld)",
    "revaise.shacl.ttl": "$(checksum_for revaise.shacl.ttl)",
    "revaise.owl.ttl": "$(checksum_for revaise.owl.ttl)",
    "revaise.rdf.ttl": "$(checksum_for revaise.rdf.ttl)"
  }
}
EOF

# Clean up temporary directory
rm -rf "$TEMP_DIR"

# Build documentation for core components
echo "Building documentation for core components..."
mkdir -p "$OUT/docs/$VER/objects" "$OUT/docs/$VER/stages"

# Generate docs for each object schema
for schema_file in "$SCHEMA_DIR/model/objects"/*.yaml; do
  if [ -f "$schema_file" ]; then
    basename=$(basename "$schema_file" .yaml)
    echo "  - Processing object: $basename"
    gen-doc "$schema_file" --directory "$OUT/docs/$VER/objects/$basename" 2>/dev/null || echo "    (skipped $basename)"
  fi
done

# Generate docs for each stage schema
for schema_file in "$SCHEMA_DIR/model/stages"/*.yaml; do
  if [ -f "$schema_file" ]; then
    basename=$(basename "$schema_file" .yaml)
    echo "  - Processing stage: $basename"
    gen-doc "$schema_file" --directory "$OUT/docs/$VER/stages/$basename" 2>/dev/null || echo "    (skipped $basename)"
  fi
done

# Copy to latest
cp "$OUT/schema/$VER/revaise.schema.json" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/context.jsonld" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/revaise.shacl.ttl" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/revaise.owl.ttl" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/revaise.rdf.ttl" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/revaise.yaml" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/revaise.linkml.yaml" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/manifest.json" "$OUT/schema/latest/"
cp "$OUT/schema/$VER/SHA256SUMS" "$OUT/schema/latest/"

# Copy docs to latest
cp -r "$OUT/docs/$VER" "$OUT/docs/latest"

# Create index.json with correct paths
cat > "$OUT/schema/latest/index.json" <<EOF
{
  "revaise": {
    "yaml": "${BASE_URL}/schema/${VER}/revaise.yaml",
    "linkml": "${BASE_URL}/schema/${VER}/revaise.linkml.yaml",
    "jsonschema": "${BASE_URL}/schema/${VER}/revaise.schema.json",
    "context": "${BASE_URL}/schema/${VER}/context.jsonld",
    "shacl": "${BASE_URL}/schema/${VER}/revaise.shacl.ttl",
    "owl": "${BASE_URL}/schema/${VER}/revaise.owl.ttl",
    "rdf": "${BASE_URL}/schema/${VER}/revaise.rdf.ttl",
    "manifest": "${BASE_URL}/schema/${VER}/manifest.json",
    "checksums": "${BASE_URL}/schema/${VER}/SHA256SUMS",
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
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem;
            line-height: 1.6;
        }
        .header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .logo {
            max-width: 300px;
            height: auto;
            margin-bottom: 1rem;
        }
        h1 { color: #333; }
        h2 { color: #555; margin-top: 2rem; }
        h3 { color: #666; margin-top: 1.5rem; }
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
        .doc-section {
            margin: 2rem 0;
            padding: 1rem;
            border-left: 3px solid #0066cc;
            background-color: #f8f9fa;
        }
        .columns {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin: 1rem 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="https://raw.githubusercontent.com/open-and-sustainable/revaise-model/main/images/logo_full.png" alt="RevAIse Logo" class="logo">
        <h1>RevAIse Data Model</h1>
        <p>A LinkML schema for AI-assisted systematic literature reviews.</p>
    </div>

    <div class="version-info">
        <strong>Version:</strong> ${VER}
    </div>

    <h2>Schema Resources</h2>
    <ul>
        <li>📄 <a href="${BASE_URL}/schema/latest/revaise.linkml.yaml">LinkML YAML</a> - Source schema release artifact</li>
        <li>🔧 <a href="${BASE_URL}/schema/latest/revaise.schema.json">JSON Schema</a> - Primary validation artifact</li>
        <li>🔗 <a href="${BASE_URL}/schema/latest/context.jsonld">JSON-LD Context</a> - Linked data context</li>
        <li>🔗 <a href="${BASE_URL}/schema/latest/revaise.shacl.ttl">SHACL</a> - RDF validation shapes</li>
        <li>🔗 <a href="${BASE_URL}/schema/latest/revaise.owl.ttl">OWL</a> - Ontology artifact</li>
        <li>🔗 <a href="${BASE_URL}/schema/latest/revaise.rdf.ttl">RDF</a> - RDF schema representation</li>
        <li>📦 <a href="${BASE_URL}/schema/latest/manifest.json">Manifest</a> - Release metadata and checksums</li>
        <li>📚 <a href="${BASE_URL}/docs/${VER}/main/index.md">Complete Documentation</a> - Full reference</li>
        <li>🔍 <a href="${BASE_URL}/schema/latest/index.json">Programmatic Index</a> - For tool integration</li>
    </ul>

    <h2>Documentation</h2>

    <div class="doc-section">
        <h3>Main Schema</h3>
        <ul>
            <li>📖 <a href="${BASE_URL}/docs/${VER}/main/Review.md">Review Class</a> - Root container for systematic reviews</li>
            <li>📖 <a href="${BASE_URL}/docs/${VER}/main/index.md">Full Schema Documentation</a></li>
        </ul>
    </div>

    <div class="doc-section">
        <h3>Core Objects</h3>
        <div class="columns">
            <ul>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/review/index.md">Review</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/author/index.md">Author</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/protocol/index.md">Protocol</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/literature_record/index.md">Literature Record</a></li>
            </ul>
            <ul>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/stage_execution/index.md">Stage Execution</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/stage_output/index.md">Stage Output</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/software_env/index.md">Software Environment</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/registration_template/index.md">Registration Template</a></li>
                <li>📦 <a href="${BASE_URL}/docs/${VER}/objects/enums/index.md">Enumerations</a></li>
            </ul>
        </div>
    </div>

    <div class="doc-section">
        <h3>Review Stages</h3>
        <ul>
            <li>🔄 <a href="${BASE_URL}/docs/${VER}/stages/registration/index.md">Registration Stage</a> - Protocol registration and pre-registration</li>
            <li>🔄 <a href="${BASE_URL}/docs/${VER}/stages/search/index.md">Search Stage</a> - Literature search documentation</li>
            <li>🔄 <a href="${BASE_URL}/docs/${VER}/stages/screening/index.md">Screening Stage</a> - Title/abstract and full-text screening</li>
            <li>🔄 <a href="${BASE_URL}/docs/${VER}/stages/extraction/index.md">Extraction Stage</a> - Data extraction workflows</li>
            <li>🔄 <a href="${BASE_URL}/docs/${VER}/stages/synthesis/index.md">Synthesis Stage</a> - Evidence synthesis workflows</li>
        </ul>
    </div>

    <h2>Quick Links</h2>
    <ul>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/Review.md">Review Class Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/RegistrationStage.md">Registration Stage Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/SearchStage.md">Search Stage Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/ScreeningStage.md">Screening Stage Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/StageExecution.md">Stage Execution Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/LiteratureRecord.md">Literature Record Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/RegistrationTemplate.md">Registration Template Documentation</a></li>
        <li>📖 <a href="${BASE_URL}/docs/${VER}/main/Author.md">Author Documentation</a></li>
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
echo ""
echo "Documentation generated for:"
echo "  - Main schema: $OUT/docs/$VER/main/"
echo "  - Objects: $OUT/docs/$VER/objects/*"
echo "  - Stages: $OUT/docs/$VER/stages/*"
