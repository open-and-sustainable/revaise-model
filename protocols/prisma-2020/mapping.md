# PRISMA 2020 → RevAIse mapping

Maps PRISMA 2020 items to RevAIse model elements, and records which are machine-checkable
as SHACL versus prose-judgment items left to human/AI assessment downstream.

Constraint types: `presence`, `value`, `numeric` (cross-field consistency).
Checkable: `yes` (SHACL), `partial` (presence only), `no` (prose).
Status: ✅ done · 🟡 stubbed · ⬜ not started.

## Step: Reporting — Flow diagram (item 16a)  ✅

| PRISMA | Element | RevAIse path | Constraint | Checkable |
| --- | --- | --- | --- | --- |
| 16a | Records identified | `PrismaFlowDiagram.records_identified` | presence, ≥0 | yes |
| 16a | Records screened | `PrismaFlowDiagram.records_screened` | presence; ≤ identified | yes |
| 16a | Reports sought | `PrismaFlowDiagram.reports_sought` | presence; ≤ screened | yes |
| 16a | Reports assessed | `PrismaFlowDiagram.reports_assessed` | presence; ≤ sought | yes |
| 16a | Studies included | `PrismaFlowDiagram.prisma_studies_included` | presence; ≤ assessed | yes |

## Step: Registration & protocol (items 24a–24c)  🟡
## Step: Search (items 6–7)  ⬜
## Step: Screening / selection (items 8–9)  ⬜

## Out of scope (prose-judgment items)

Items requiring narrative adequacy (rationale, discussion, interpretation, limitations)
are not encoded as SHACL; they are left to human/AI assessment downstream.

> TODO: complete items 1–27 before promoting status beyond `scaffold`.
