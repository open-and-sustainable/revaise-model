# Changelog

All notable changes to this project will be documented in this file.

## [prisma-2020-1.0.0] - 2026-06-30
### Added
- `checklists/prisma-2020.yaml`: full PRISMA 2020 checklist (Page MJ et al. BMJ 2021;372:n71) as structured data with a dual-layer architecture — plain text fields (`item`, `section`, `topic`, `text`) for human use and an optional `shacl:` block per item mapping each reporting requirement to a model slot and target class for machine validation.
- `scripts/gen_protocol_shacl.py`: generator that reads a checklist YAML and produces SHACL NodeShapes (one per target class), deduplicating property paths within each shape. Run with `python scripts/gen_protocol_shacl.py <checklist.yaml> <output.shacl.ttl>`.
- `protocols/prisma-2020/prisma-2020.shacl.ttl`: generated SHACL shapes covering all 27 PRISMA 2020 items mapped to 10 target classes: `Review`, `ReviewNarrative`, `Protocol`, `SearchStage`, `ScreeningStage`, `ExtractionStage`, `RiskOfBiasAssessmentStage`, `SynthesisStage`, `FlowDiagram`, `LiteratureRecord`.
- Conformance test fixtures (`conforming.ttl`, `non-conforming.ttl`) updated to use real model slots and correctly typed nested objects throughout.

## [prisma-2020-1.0.1] - 2026-06-30
### Changed
- Item 19 (results of individual studies) now maps to `LiteratureRecord.study_results` instead of the removed `results_summary` slot; `prisma-2020.shacl.ttl` regenerated accordingly.
- Conformance fixture `conforming.ttl` updated so the literature record carries a typed `QualityAssessment` (risk of bias) and a typed `StudyResult` (results) instead of free-text strings.
- `requires_model` raised to `>=0.7.1`, the data-model version that introduces `study_results` and the rich `risk_of_bias` range.

## [0.7.1] - 2026-06-30
### Changed
- Every object-valued slot in the model is now inlined (`inlined`/`inlined_as_list`), so a `Review` serializes as a single self-contained document with all sub-objects (literature records, stage protocols, quality control, tools, sessions, assessments, results, etc.) embedded in full rather than as bare identifier references.
- `LiteratureRecord.risk_of_bias` is now a rich `QualityAssessment` (per-domain judgements with signalling questions) instead of a free-text string.
- `RobAssessment` (risk-of-bias stage) now uses the rich `RiskOfBiasDomainAssessment` for `rob_domain_judgements` and the `RiskOfBiasJudgement` enum for `overall_judgement`, instead of free-text strings.

### Added
- `StudyResult` class and `LiteratureRecord.study_results` slot: per-outcome results with effect measure, effect estimate, confidence-interval bounds, p-value, and group/total sample sizes.

### Removed
- `LiteratureRecord.results_summary` free-text slot (replaced by `study_results`).
- `RobAssessment.assessed_record_id` record-to-record identifier cross-link.
- `Amendment.diff_uri` (local-file pointer) and `Amendment.affected_version_ids` (identifier cross-links).

## [0.7.0] - 2026-06-30
### Added
- `stage_category` type designator on `StageExecution`: each stage records its concrete class (e.g., `ReportingStage`), so polymorphic stages deserialize to typed RDF and a whole review can be materialized and validated with SHACL.
- `RiskOfBiasAssessmentStage` (new file `schema/model/stages/risk_of_bias_assessment.yaml`): stage for assessing methodological risk of bias in included studies, with `RobProtocol` (tool, rater configuration, disagreement resolution), `RobAssessment` (per-study judgements), `RobQualityControl`, and `RobStatistics` classes and all supporting slots.
- `ReviewNarrative` class on `Review` for grouping narrative prose sections of the review report: `rationale`, `discussion_interpretation`, `discussion_evidence_limitations`, `discussion_process_limitations`, `discussion_implications`.
- `sections` slot on `Review` (range: `ReviewNarrative`) and `data_availability` slot on `Review`.
- `risk_of_bias` and `results_summary` slots on `LiteratureRecord`.

### Changed
- Marked `Review.stages`, `Review.review_authors`, and `Review.funding_sources` as `inlined_as_list` so inlined object collections round-trip to RDF.
- Renamed all protocol-specific slot and class names in `stages/reporting.yaml` to generic equivalents: `PrismaFlowDiagram` → `FlowDiagram`, `prisma_flow_diagram` → `flow_diagram`, `prisma_studies_included` → `total_included`, `prisma_flow_id` → `flow_diagram_id`, `prisma_flow_standard` → `flow_standard`, `prisma_flow_output` → `flow_diagram_output`, `prisma_flow_notes` → `flow_diagram_notes`.
- Moved `Amendment` class, `AmendmentType` and `ApprovalStatus` enumerations, and all amendment slots from `stages/registration.yaml` to `objects/protocol.yaml`. Protocol amendments are not registration-stage-specific; they can arise at any point in the review. `stages/registration.yaml` now explicitly imports `objects/protocol`.
- Moved `FlowDiagram` class and its slot definitions from `stages/reporting.yaml` to `objects/review.yaml`, resolving an implicit cross-file dependency. `FlowDiagram` is a direct child of `Review`, not internal to the reporting stage. `stages/reporting.yaml` now explicitly imports `objects/review`.

## [0.6.1] - 2026-06-29
### Changed
- Publish the schema and all generated artifacts (LinkML YAML, JSON Schema, JSON-LD context, SHACL, OWL, RDF) with the documentation on Read the Docs, under versioned `…/en/<version>/api/` paths so every released version is citable.
- Read the Docs build now generates the full artifact set (previously only JSON Schema and JSON-LD context).
- Repointed artifact URLs in `README.md`, `docs/formats.md`, and `CONTRIBUTING.md` to Read the Docs.

### Removed
- GitHub Pages publishing (`.github/workflows/publish.yml`, `scripts/build.sh`) and the Pages-only `manifest.json`/`SHA256SUMS` release artifacts. Documentation and artifacts are served from Read the Docs.

## [0.6.0] - 2026-06-28
### Added
- Protocol conformance layer (`protocol_conformance.yaml`): `ProtocolReference` for declaring conformance to versioned external protocols (e.g., PRISMA 2020, ROBIS), and `ConformanceAssertion`/`ConformanceItemResult` for storing the result of conformance checks in the document.
- `conforms_to` and `conformance_assertions` slots on both `Review` and `LiteratureRecord`, supporting review-level and per-record protocol conformance.
- `ProtocolKind`, `ConformanceResult`, and `ConformanceItemStatus` enumerations.
- `stage_status` slot on `StageExecution` with a `StageStatus` enumeration (not started, in progress, complete, skipped, not applicable).
- Example `review_with_protocol_conformance.yaml` demonstrating declared protocols, stored conformance assertions, and stage status.

### Changed
- Moved the `ReviewType` enumeration to the shared `enums.yaml` so it can type protocol applicability.

## [0.5.0] - 2026-06-02
### Added
- Optional `ScopingStage` for exploratory planning, review question refinement, feasibility assessment, stakeholder input, and scoping decisions.
- Optional `ReportingStage` for reporting standards, reporting checklists, PRISMA flow information, report documents, publication records, reporting deviations, and reporting signoff.
- Expanded risk-of-bias support in `QualityAssessment`, including assessment purpose/unit, risk-of-bias domain judgements, signalling questions, bias direction, consensus status, and additional risk-of-bias tools.
- Examples for scoping, reporting, and detailed risk-of-bias assessment.

### Changed
- Added stage and output enum values for reporting and new reporting/scoping artifacts.

## [0.4.2] - 2026-06-02
### Added
- Versioned release artifacts for JSON Schema, JSON-LD context, SHACL, OWL, RDF, LinkML YAML, manifests, and checksums.
- Explicit `Review` tree root declaration for generated validation artifacts.
- CI checks for generated schema artifacts and example validation.

### Changed
- Generate JSON Schema with `Review` as the top-level class.
- Treat generated artifacts as release outputs under immutable versioned paths plus `latest`.

## [0.4.1] - 2025-10-03
### Changed
- Enhanced documentation and narrative on review workflow representation

## [0.4.0] - 2025-09-11

### Added
- Complete implementation of synthesis stage with comprehensive functionality:
  - Support for multiple synthesis approaches (narrative, quantitative, mixed)
  - Meta-analysis capabilities with various effect measures and models
  - Subgroup and sensitivity analyses
  - Publication bias assessment tools (funnel plots, Egger's test, trim-and-fill)
  - Evidence grading systems (GRADE, Oxford CEBM, AHRQ, SIGN, NICE)
  - Heterogeneity statistics (I², tau², Q statistic)
  - Narrative synthesis with thematic analysis
  - AI-assisted synthesis capabilities
  - Comprehensive quality control and transparency measures
- Shared base components for consistent stage architecture:
  - SearchProtocol, SearchQualityControl, SearchStatistics classes extending shared base classes
  - RegistrationProtocol, RegistrationQualityControl, RegistrationStatistics classes extending shared base classes
  - All stages now inherit from StageProtocol, StageQualityControl, and StageStatistics base classes
  - Consistent naming patterns and field structures across all stages

### Changed
- Enhanced search stage with protocol, quality control, and statistics components
- Enhanced registration stage with protocol, quality control, and statistics components
- Reorganized documentation to properly distinguish Review Core Objects from Shared Infrastructure Objects

## [0.3.0] - 2025-09-11

### Added
- Complete implementation of extraction stage with comprehensive functionality:
  - Data extraction forms with customizable sections and fields
  - Extraction protocol management with configurable reviewer requirements
  - Support for pilot testing and calibration exercises
  - AI-assisted extraction capabilities with human validation workflows
  - Multiple extractor support with independent extraction options
  - Disagreement resolution methods (consensus, third reviewer, majority vote)
  - Extraction quality control with double extraction rates and agreement metrics
  - Study characteristics and quality assessment integration
  - Comprehensive extraction statistics and workload tracking
  - Support for various extraction orders (random, alphabetical, chronological, by relevance/quality)
  - Blinding levels for extraction (none, single, double, triple blind)
- Complete review example demonstrating AI-assisted extraction workflow
- Shared DateRange class for flexible date range representation

### Changed
- Renamed conflicting slot names across schemas to ensure uniqueness:
  - Standardized naming conventions for stage-specific slots
  - Prefixed context-specific slots to avoid namespace collisions
  - Made AIPerformanceMetrics extend PerformanceMetrics to reduce duplication

### Fixed
- Resolved all slot naming conflicts between extraction, screening, and core objects
- Fixed documentation build errors caused by duplicate slot definitions
- Ensured all classes, enums, and slots have proper descriptions for complete documentation

## [0.2.0] - 2025-09-08

### Added
- Complete implementation of screening stage with comprehensive functionality:
  - Deduplication process with external tool support
  - Multiple screening round types (title/abstract, full-text, systematic review check)
  - PICOS-based screening criteria with support for excluding systematic reviews
  - External tool integration for all screening steps
  - AI assistance capabilities with configurable human oversight levels
  - Conflict resolution mechanisms with multiple strategies
  - Reviewer management and role tracking
  - Comprehensive statistics and performance metrics
  - Inter-rater agreement tracking (Cohen's kappa, Fleiss' kappa)
- Added comprehensive review examples:
  - Complete review example with registration stage focus
  - Complete review example with search stage focus
  - Complete review example with screening stage focus

### Fixed
- MkDocs configuration to remove unnecessary emoji extension
- ReadTheDocs version display using environment variables
- Filled in description field for each field in the schema


## [0.1.0] - 2025-09-05

### Added
- Added the registration phase to the schema

### Changed
- Updated the documentation generation to include the registration stage

### Fixed
- Resolved slot naming conflicts
- Fixed all the LinkML compatibility issues (default → ifabsent)


## [0.0.2] - 2025-09-04

### Added
- Implementation of comprehensive documentation system
- Hierarchical object structure for better organization
- Implementation of search phase functionality
- Review artifacts system for quality assurance

### Changed
- Enhanced repository structure to support hierarchical components

### Fixed
- Initial setup issues identified in v0.0.1

## [0.0.1] - 2025-08-21

### Added
- Initial sketch of standard definition
- Basic repository organization structure
- Foundation software stack implementation
- Core project setup and configuration files
- Initial README documentation

### Notes
- First public release establishing the project foundation
