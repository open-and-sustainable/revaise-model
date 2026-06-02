# Formats and Release Artifacts

RevAIse is authored in LinkML and distributed as versioned, generated artifacts.

The source schema lives in `schema/revaise.yaml` and `schema/model/**/*.yaml`. Release artifacts are generated from that source and published under immutable versioned paths plus a `latest` copy.

## Artifact Roles

| Artifact | Role |
| --- | --- |
| `revaise.linkml.yaml` | Versioned LinkML schema artifact |
| `revaise.schema.json` | Primary JSON/YAML validation schema |
| `context.jsonld` | JSON-LD context for linked data use |
| `revaise.shacl.ttl` | SHACL shapes for RDF validation |
| `revaise.owl.ttl` | OWL ontology artifact |
| `revaise.rdf.ttl` | RDF representation of the schema |
| `manifest.json` | Release metadata, root class, artifact list, and checksums |
| `SHA256SUMS` | Checksums for generated release artifacts |

## Accessing Artifacts

Release artifacts are published under:

```text
https://open-and-sustainable.github.io/revaise-model/schema/<version>/
```

For example, version `0.5.0` artifacts are available at:

```text
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/revaise.linkml.yaml
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/revaise.schema.json
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/context.jsonld
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/revaise.shacl.ttl
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/revaise.owl.ttl
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/revaise.rdf.ttl
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/manifest.json
https://open-and-sustainable.github.io/revaise-model/schema/0.5.0/SHA256SUMS
```

The latest published release is available through:

```text
https://open-and-sustainable.github.io/revaise-model/schema/latest/index.json
```

Use versioned URLs for reproducible software. Use `latest` only when you intentionally want the newest published release.

Example Python access:

```python
import json
import urllib.request

version = "0.5.0"
base_url = f"https://open-and-sustainable.github.io/revaise-model/schema/{version}"

with urllib.request.urlopen(f"{base_url}/manifest.json") as response:
    manifest = json.load(response)

schema_name = manifest["artifacts"]["json_schema"]

with urllib.request.urlopen(f"{base_url}/{schema_name}") as response:
    json_schema = json.load(response)
```

Example discovery through `latest`:

```python
import json
import urllib.request

index_url = "https://open-and-sustainable.github.io/revaise-model/schema/latest/index.json"

with urllib.request.urlopen(index_url) as response:
    index = json.load(response)

schema_url = "https://open-and-sustainable.github.io" + index["revaise"]["jsonschema"]

with urllib.request.urlopen(schema_url) as response:
    json_schema = json.load(response)
```

## Versioning

Each released version is immutable. `latest` points to the newest released version.

Patch releases contain documentation changes, generation fixes, or non-breaking schema corrections. Minor releases may add optional classes, slots, enum values, or examples. Major releases are reserved for incompatible changes such as renamed or removed slots, changed required fields, changed enum meanings, or changed root document shape.

Release tags build and publish the generated artifacts under `site/schema/<version>/` and refresh `site/schema/latest/`.

## Validation

RevAIse review documents are JSON or YAML documents whose root object is `Review`.

Generated JSON Schema uses `Review` as the top-level class. Example documents are validated during CI against the generated schema.
