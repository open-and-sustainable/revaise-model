# PRISMA 2020 (RevAIse protocol)

Declarative SHACL representation of the PRISMA 2020 reporting guideline, aligned with the
RevAIse data model. A review document declares conformance via `conforms_to`, and is
validated against the shapes in `prisma-2020.shacl.ttl`.

- **External standard:** PRISMA 2020 — Page MJ, et al. BMJ 2021;372:n71.
- **Kind:** reporting guideline.
- **Targets data model:** `>=0.6.0`.
- **Status:** scaffold — flow-diagram step (item 16a) implemented and tested; remaining
  items tracked in `mapping.md`.

## What is checked

The flow-diagram counts must be present and must not increase along the selection
sequence: records identified ≥ screened ≥ sought ≥ assessed ≥ studies included.

Only machine-statable items are encoded; prose-judgment items are left to human/AI review.

## Artifacts

- `prisma-2020.shacl.ttl` — the validation shapes.
- `mapping.md` — item-by-item mapping to model slots.
- `examples/` — conforming and non-conforming RDF records used by the conformance test.
