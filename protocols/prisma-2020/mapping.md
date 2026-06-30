# PRISMA 2020 → RevAIse mapping

Maps all 27 PRISMA 2020 items (Page MJ et al. BMJ 2021;372:n71) to RevAIse model slots,
and records which are machine-checkable as SHACL versus prose-judgment items.

Constraint type: `presence` = `sh:minCount 1` on the named slot.
Checkable: `yes` = SHACL shape implemented · `no` = prose judgment, not machine-checkable.
Status: ✅ done.

## Title / Abstract

| PRISMA item | Topic | RevAIse class | RevAIse slot | Constraint | Checkable | Status |
|---|---|---|---|---|---|---|
| 1 | Title | `Review` | `review_title` | presence | yes | ✅ |
| 2 | Abstract | `Review` | `review_abstract` | presence | yes | ✅ |

## Introduction

| PRISMA item | Topic | RevAIse class | RevAIse slot | Constraint | Checkable | Status |
|---|---|---|---|---|---|---|
| 3 | Rationale | `ReviewNarrative` | `rationale` | presence | yes | ✅ |
| 4 | Objectives | `Protocol` | `research_question` | presence | yes | ✅ |

## Methods

| PRISMA item | Topic | RevAIse class | RevAIse slot | Constraint | Checkable | Status |
|---|---|---|---|---|---|---|
| 5 | Eligibility criteria | `Protocol` | `eligibility_criteria` | presence | yes | ✅ |
| 6 | Information sources | `SearchStage` | `databases` | presence | yes | ✅ |
| 7 | Search strategy | `SearchStage` | `search_queries` | presence | yes | ✅ |
| 8 | Selection process | `ScreeningStage` | `screening_protocol` | presence | yes | ✅ |
| 9 | Data collection process | `ExtractionStage` | `extraction_protocol` | presence | yes | ✅ |
| 10a | Data items — outcomes | `ExtractionStage` | `extraction_forms` | presence | yes | ✅ |
| 10b | Data items — other variables | `ExtractionStage` | `extraction_forms` | presence | yes | ✅ |
| 11 | Study risk-of-bias assessment | `RiskOfBiasAssessmentStage` | `rob_protocol` | presence | yes | ✅ |
| 12 | Effect measures | `SynthesisStage` | `effect_measures` | presence | yes | ✅ |
| 13a | Synthesis methods — eligibility | `SynthesisStage` | `synthesis_protocol` | presence | yes | ✅ |
| 13b | Synthesis methods — data preparation | `SynthesisStage` | `synthesis_methods` | presence | yes | ✅ |
| 13c | Synthesis methods — display | `SynthesisStage` | `synthesis_visualizations` | presence | yes | ✅ |
| 13d | Synthesis methods — methods | `SynthesisStage` | `synthesis_methods` | presence | yes | ✅ |
| 13e | Synthesis methods — heterogeneity | `SynthesisStage` | `heterogeneity_assessment` | presence | yes | ✅ |
| 13f | Synthesis methods — sensitivity | `SynthesisStage` | `sensitivity_analyses` | presence | yes | ✅ |
| 14 | Reporting bias assessment | `SynthesisStage` | `publication_bias_assessment` | presence | yes | ✅ |
| 15 | Certainty assessment | `SynthesisStage` | `evidence_grading` | presence | yes | ✅ |

## Results

| PRISMA item | Topic | RevAIse class | RevAIse slot | Constraint | Checkable | Status |
|---|---|---|---|---|---|---|
| 16a | Study selection — flow diagram | `FlowDiagram` | `records_identified` | presence | yes | ✅ |
| 16b | Study selection — excluded studies | `ScreeningStage` | `screening_rounds` | presence | yes | ✅ |
| 17 | Study characteristics | `Review` | `literature_records` | presence | yes | ✅ |
| 18 | Risk of bias in studies | `LiteratureRecord` | `risk_of_bias` | presence | yes | ✅ |
| 19 | Results of individual studies | `LiteratureRecord` | `study_results` | presence | yes | ✅ |
| 20a | Results of syntheses — contributing studies | `SynthesisStage` | `meta_analyses` | presence | yes | ✅ |
| 20b | Results of syntheses — statistical results | `SynthesisStage` | `meta_analyses` | presence | yes | ✅ |
| 20c | Results of syntheses — heterogeneity | `SynthesisStage` | `meta_analyses` | presence | yes | ✅ |
| 20d | Results of syntheses — sensitivity analyses | `SynthesisStage` | `sensitivity_analyses` | presence | yes | ✅ |
| 21 | Reporting biases | `SynthesisStage` | `publication_bias_assessment` | presence | yes | ✅ |
| 22 | Certainty of evidence | `SynthesisStage` | `evidence_grading` | presence | yes | ✅ |

## Discussion

| PRISMA item | Topic | RevAIse class | RevAIse slot | Constraint | Checkable | Status |
|---|---|---|---|---|---|---|
| 23a | Discussion — interpretation | `ReviewNarrative` | `discussion_interpretation` | presence | yes | ✅ |
| 23b | Discussion — evidence limitations | `ReviewNarrative` | `discussion_evidence_limitations` | presence | yes | ✅ |
| 23c | Discussion — process limitations | `ReviewNarrative` | `discussion_process_limitations` | presence | yes | ✅ |
| 23d | Discussion — implications | `ReviewNarrative` | `discussion_implications` | presence | yes | ✅ |

## Other information

| PRISMA item | Topic | RevAIse class | RevAIse slot | Constraint | Checkable | Status |
|---|---|---|---|---|---|---|
| 24a | Registration — number | `Protocol` | `registration_id` | presence | yes | ✅ |
| 24b | Registration — protocol URL | `Protocol` | `registration_url` | presence | yes | ✅ |
| 24c | Registration — amendments | `Protocol` | `amendments` | presence | yes | ✅ |
| 25 | Support / funding | `Review` | `funding_sources` | presence | yes | ✅ |
| 26 | Competing interests | `Review` | `conflicts_of_interest` | presence | yes | ✅ |
| 27 | Data availability | `Review` | `data_availability` | presence | yes | ✅ |

## Notes

Items 10a and 10b both map to `extraction_forms`: the extraction form defines all data items collected (outcomes and other variables). Items 20a–20c map to `meta_analyses` because each `MetaAnalysis` object contains contributing study characteristics, statistical results, and heterogeneity statistics. Items 13f and 20d both map to `sensitivity_analyses`; items 14 and 21 to `publication_bias_assessment`; items 15 and 22 to `evidence_grading` — the SHACL generator deduplicates these within each NodeShape.
