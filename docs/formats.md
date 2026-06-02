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

## Versioning

Each released version is immutable. `latest` points to the newest released version.

Patch releases contain documentation changes, generation fixes, or non-breaking schema corrections. Minor releases may add optional classes, slots, enum values, or examples. Major releases are reserved for incompatible changes such as renamed or removed slots, changed required fields, changed enum meanings, or changed root document shape.

Release tags build and publish the generated artifacts under `site/schema/<version>/` and refresh `site/schema/latest/`.

## Validation

RevAIse review documents are JSON or YAML documents whose root object is `Review`.

Generated JSON Schema uses `Review` as the top-level class. Example documents are validated during CI against the generated schema.
