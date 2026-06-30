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

All artifacts are served from this site and versioned via `gh-pages` branch tags (e.g. `gh-pages/prisma-2020-1.0.0`):

- **Shapes**: `https://open-and-sustainable.github.io/revaise-model/prisma-2020/prisma-2020.shacl.ttl`
- **Item mapping**: `https://open-and-sustainable.github.io/revaise-model/prisma-2020/mapping/`
- **Conforming fixture**: `https://open-and-sustainable.github.io/revaise-model/prisma-2020/examples/conforming.ttl`
- **Non-conforming fixture**: `https://open-and-sustainable.github.io/revaise-model/prisma-2020/examples/non-conforming.ttl`

## Regenerating the shapes

```bash
python scripts/gen_protocol_shacl.py checklists/prisma-2020.yaml protocols/prisma-2020/prisma-2020.shacl.ttl
```
