# Formats and Release Artifacts

RevAIse is authored in LinkML and distributed as versioned, generated artifacts.

The source schema lives in `schema/revaise.yaml` and `schema/model/**/*.yaml`. Artifacts are generated from that source and published alongside the documentation on Read the Docs, with every released version available at its own versioned path.

## Artifact Roles

| Artifact | Role |
| --- | --- |
| `revaise.linkml.yaml` | Versioned LinkML schema artifact |
| `revaise.schema.json` | Primary JSON/YAML validation schema |
| `context.jsonld` | JSON-LD context for linked data use |
| `revaise.shacl.ttl` | SHACL shapes for RDF validation |
| `revaise.owl.ttl` | OWL ontology artifact |
| `revaise.rdf.ttl` | RDF representation of the schema |

## Accessing Artifacts

Artifacts are published with the documentation on Read the Docs. **Every released version is available — and citable — at its own versioned path.** Switch versions with the documentation version selector, or edit the version segment of the URL:

```text
https://revaise-model.readthedocs.io/<version>/api/<artifact>
```

For example:

```text
https://revaise-model.readthedocs.io/stable/api/revaise.linkml.yaml
https://revaise-model.readthedocs.io/stable/api/revaise.schema.json
https://revaise-model.readthedocs.io/stable/api/context.jsonld
https://revaise-model.readthedocs.io/stable/api/revaise.shacl.ttl
https://revaise-model.readthedocs.io/stable/api/revaise.owl.ttl
https://revaise-model.readthedocs.io/stable/api/revaise.rdf.ttl
```

`stable` resolves to the latest release; `latest` is the development build. **For reproducible work, cite a specific version**, e.g. `https://revaise-model.readthedocs.io/0.6.1/api/revaise.schema.json`.

Example Python access:

```python
import urllib.request

version = "0.6.1"  # any released version, or "stable"
base_url = f"https://revaise-model.readthedocs.io/{version}/api"

with urllib.request.urlopen(f"{base_url}/revaise.schema.json") as response:
    json_schema = response.read()
```

## Versioning

Each released version is immutable. `latest` points to the newest released version.

Patch releases contain documentation changes, generation fixes, or non-breaking schema corrections. Minor releases may add optional classes, slots, enum values, or examples. Major releases are reserved for incompatible changes such as renamed or removed slots, changed required fields, changed enum meanings, or changed root document shape.

Each released version is built on Read the Docs and its artifacts are served under `…/<version>/api/`; `stable` tracks the latest release and `latest` the development build. All built versions are listed in the documentation version selector (the flyout menu); a version appears there once it has been activated in the Read the Docs *Versions* admin.

## Validation

RevAIse review documents are JSON or YAML documents whose root object is `Review`.

Generated JSON Schema uses `Review` as the top-level class. Example documents are validated during CI against the generated schema.
