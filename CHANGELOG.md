# Changelog

All notable changes to this project will be documented in this file.

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
