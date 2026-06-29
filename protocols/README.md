# Protocol Archive

Declarative representations of review protocols (e.g. PRISMA 2020) as SHACL validation
shapes aligned with the RevAIse data model.

## Scope

This directory ships protocol **definitions** only — what a review claiming conformance
to a protocol must contain, expressed as SHACL shapes that target the RDF vocabulary the
data model emits (the `revaise:` namespace, its classes and slots). Running the validation
(an MCP, an agent, prompt generation) lives in consuming projects, not here.

## Layout

```
protocols/
  index.json                  # registry of available protocols
  prisma-2020/
    protocol.yaml             # metadata (external version, kind, requires_model, uri, citation)
    prisma-2020.shacl.ttl     # SHACL validation shapes (the artifact)
    mapping.md                # protocol item -> model slot -> constraint -> checkable
    docs/index.md             # human documentation
    examples/
      conforming.ttl          # RDF record that satisfies the shapes
      non-conforming.ttl      # RDF record that violates the shapes
```

## Distribution (independent of the data model)

The **data model** is published on Read the Docs. **Protocols** are published on GitHub
Pages, versioned independently.

- Source release tag (on `main`): `<name>-<MAJOR>.<MINOR>.<PATCH>` — e.g. `prisma-2020-1.0.0`.
  These never collide with data-model tags (`MAJOR.MINOR.PATCH`, which have no `-`).
- On that tag, `publish-protocol.yml` builds the artifacts and deploys to the `gh-pages`
  branch (preserving previously released versions), then **tags the deployed `gh-pages`
  commit** as `gh-pages/<name>-<version>` so each deployed snapshot is reachable by tag.
- Published URLs:
  ```
  https://open-and-sustainable.github.io/revaise-model/protocols/<name>/<version>/
  https://open-and-sustainable.github.io/revaise-model/protocols/<name>/latest/
  https://open-and-sustainable.github.io/revaise-model/protocols/index.json
  ```

The shapes version is derived from the release tag (not hand-written) and recorded, with
the shapes blob hash, in each version's `manifest.json`.

## Status

`prisma-2020` is a **scaffold**: the flow-diagram step is implemented and tested; the
remaining checklist items are stubbed by stage in the shapes file and tracked in
`mapping.md`.
