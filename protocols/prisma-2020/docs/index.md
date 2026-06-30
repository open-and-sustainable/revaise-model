# PRISMA 2020 (RevAIse protocol)

Machine-checkable SHACL representation of the PRISMA 2020 reporting guideline, aligned with the RevAIse data model. A review document is validated against the shapes in `prisma-2020.shacl.ttl`, which covers all 27 checklist items.

- **External standard:** PRISMA 2020 — Page MJ, McKenzie JE, Bossuyt PM, et al. BMJ 2021;372:n71. doi:10.1136/bmj.n71
- **Kind:** reporting guideline
- **Targets data model:** `>=0.7.0`
- **Status:** stable — all 27 items implemented

## What is checked

Each PRISMA 2020 item that requires a specific element to be present is encoded as a SHACL `sh:minCount 1` property constraint on the corresponding RevAIse model slot. Items requiring prose narrative adequacy (interpretation, discussion quality) are left to human or AI assessment and are not encoded as SHACL.

Ten target classes are covered: `Review`, `ReviewNarrative`, `Protocol`, `SearchStage`, `ScreeningStage`, `ExtractionStage`, `RiskOfBiasAssessmentStage`, `SynthesisStage`, `FlowDiagram`, `LiteratureRecord`.

See `mapping.md` for the full item-by-item mapping.

## Artifacts

- `prisma-2020.shacl.ttl` — the validation shapes (generated from `checklists/prisma-2020.yaml`).
- `mapping.md` — item-by-item mapping to model slots.
- `examples/conforming.ttl` — RDF fixture that satisfies all shapes.
- `examples/non-conforming.ttl` — RDF fixture that violates two shapes (used in CI).

## Regenerating the shapes

```bash
python scripts/gen_protocol_shacl.py checklists/prisma-2020.yaml protocols/prisma-2020/prisma-2020.shacl.ttl
```
