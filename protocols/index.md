# RevAIse Protocol Documentation

Machine-checkable SHACL representations of reporting guidelines, aligned with the RevAIse data model.

Each protocol maps an external reporting standard to RevAIse model slots, expressed as SHACL shapes that validate RDF serializations of review documents.

## Available Protocols

| Protocol | Kind | Targets model | Status |
|---|---|---|---|
| [PRISMA 2020](prisma-2020/docs/index.md) | Reporting guideline | ≥0.7.1 | Stable — all 27 items |

## How It Works

Each protocol release is tagged on the `gh-pages` branch (e.g. `gh-pages/prisma-2020-1.0.0`), providing an immutable snapshot of the shapes and documentation at that point. The shapes file for each protocol is served directly from this site and can be referenced by URL for automated validation.

## Data Model Documentation

The RevAIse data model is documented separately on Read the Docs:
[revaise-model.readthedocs.io](https://revaise-model.readthedocs.io)
