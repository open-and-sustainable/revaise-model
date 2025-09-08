# Changelog

All notable changes to this project will be documented in this file.

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
