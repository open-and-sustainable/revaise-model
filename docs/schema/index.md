# Schema Documentation

This section contains the complete documentation for the RevAIse Data Model schema, automatically generated from the LinkML source definitions.

## Schema Structure

The RevAIse schema is organized to support complete systematic review workflow documentation with three main categories:

### Main Schema
The [main schema](main/) defines the root `Review` class and imports all workflow components. This is the entry point for understanding the complete data model and systematic review workflow structure.

### Review Core Objects
These are the fundamental objects that characterize a systematic review workflow:

- **[Review](objects/review/)** - The main review container and workflow metadata
- **[Author](objects/author/)** - Information about review authors and workflow contributors
- **[Protocol](objects/protocol/)** - Review protocol and workflow methodology specifications
- **[Literature Record](objects/literature_record/)** - Individual literature items flowing through the review workflow

### Shared Infrastructure Objects
These objects are imported in review_core.yaml for sharing across workflow stages:

- **[Registration Template](objects/registration_template/)** - Templates for review registration and workflow planning
- **[Stage Execution](objects/stage_execution/)** - Base class for all workflow stages with execution metadata
- **[Stage Output](objects/stage_output/)** - Outputs from workflow stage executions
- **[Software Environment](objects/software_env/)** - Research environment specifications for workflow reproducibility
- **[External Tool](objects/external_tool/)** - Tools and software used in systematic review workflows
- **[Enumerations](objects/enums/)** - Controlled vocabularies and value sets for workflow documentation

### Additional Objects
These objects provide additional functionality for systematic review workflow documentation:

- **[Stage Protocol](objects/stage_protocol/)** - Base protocol class for all workflow stages
- **[Stage Quality Control](objects/stage_quality_control/)** - Base quality control for all workflow stages
- **[Stage Statistics](objects/stage_statistics/)** - Base statistics and metrics for workflow stages
- **[AI Assistance](objects/ai_assistance/)** - AI model configurations and workflow assistance documentation
- **[Conflict Resolution](objects/conflict_resolution/)** - Conflict resolution tracking and workflow methods
- **[Field Definition](objects/field_definition/)** - Data extraction field definitions and workflow forms
- **[Participant](objects/participant/)** - Review participants and their workflow roles
- **[Quality Assessment](objects/quality_assessment/)** - Quality assessment tools and workflow metrics
- **[Quality Metrics](objects/quality_metrics/)** - Performance and agreement metrics for workflow optimization
- **[Work Session](objects/work_session/)** - Work session tracking and workflow metrics

### Review Workflow Stages
These represent the sequential phases of a systematic review workflow with proper dependency documentation:

- **[Registration](stages/registration/)** - Protocol registration and workflow pre-specification
- **[Search](stages/search/)** - Literature search strategy execution and documentation
- **[Screening](stages/screening/)** - Title/abstract and full-text screening workflows
- **[Extraction](stages/extraction/)** - Data extraction processes from included studies
- **[Synthesis](stages/synthesis/)** - Data synthesis workflows and analysis procedures

## Schema Features

### Workflow-Oriented Design
The schema uses a systematic review workflow architecture where:
- Each stage defines clear inputs, outputs, and dependencies within the review process
- Workflow components document the complete systematic review methodology
- Execution metadata enables workflow tracking and quality assessment
- Extensions support domain-specific systematic review patterns

### LinkML Benefits
Built with LinkML (Linked Data Modeling Language), the schema provides:
- **Multiple serialization formats** - YAML, JSON, RDF, and more for systematic review workflow integration
- **Built-in validation** - Automatic generation of validation schemas for workflow documentation
- **Semantic web compatibility** - JSON-LD contexts and RDF support for workflow provenance
- **Documentation generation** - Auto-generated human-readable workflow documentation
- **Type safety** - Strong typing with ranges and constraints for workflow reliability

### AI Workflow Documentation
Special attention to documenting AI assistance within systematic review workflows:
- Model specifications and versions used in each review stage
- Prompts and parameters for AI-assisted systematic review steps
- Human oversight points and intervention patterns in review workflows
- Performance metrics and confidence scores for workflow quality assessment

### Workflow Provenance and Reproducibility
Comprehensive tracking of systematic review processes:
- Temporal information for all workflow activities (dates, durations, dependencies)
- Attribution of decisions (human reviewers and AI systems) at each workflow step
- Software environments and tool versions for complete workflow reproducibility
- Decision rationale and methodological justifications throughout the review workflow
- Data lineage and transformations throughout the systematic review process

## Systematic Review Workflow Patterns

### Human-AI Collaboration Workflows
Support for hybrid systematic review patterns:
- AI-assisted processing stages with human validation checkpoints
- Human reviewer decision points with AI assistance and suggestions
- Quality control gates that require manual review and approval
- Conflict resolution workflows between human reviewers with AI mediation

### Multi-Reviewer Workflows
Design for collaborative systematic reviews:
- Parallel review processes with multiple independent reviewers
- Inter-rater agreement tracking and conflict resolution procedures
- Quality assessment workflows with reviewer calibration
- Consensus building processes and decision documentation

### Living Review Workflows
Support for continuously updating systematic reviews:
- Incremental update workflows that process only new literature
- Version control for systematic review methodology evolution
- Change tracking and amendment documentation
- Temporal workflow analysis and improvement

## Using the Schema

### For Systematic Review Methodologists
1. Use the [JSON Schema](../api/revaise.schema.json) for systematic review workflow validation
2. Leverage stage definitions to document complete review methodologies
3. Implement quality control using execution metadata and tracking fields
4. Design reproducible review processes using the modular stage architecture

### For Developers
1. Implement systematic review tool interfaces using the stage execution model
2. Refer to the [JSON-LD Context](../api/context.jsonld) for workflow provenance tracking
3. Import the LinkML YAML directly for schema extensions specific to systematic reviews
4. Build review documentation tools using the standardized stage definitions

### For Researchers
1. Document complete systematic review workflows using the stage-based model
2. Enable review replication through comprehensive metadata capture
3. Share reproducible review methodologies with full process documentation
4. Build on existing review workflow patterns through template libraries

### For Data Managers
1. Validate systematic review workflow data against the JSON Schema at each stage
2. Ensure complete review process provenance documentation
3. Document AI usage according to systematic review transparency requirements
4. Manage review workflow versioning and methodological change tracking

## Schema Versioning and Workflow Compatibility

This documentation corresponds to the schema version you're currently viewing. The schema follows semantic versioning with systematic review workflow compatibility guarantees:

- **Major versions** - Breaking changes to workflow interfaces and stage definitions
- **Minor versions** - New workflow features and stage types for systematic reviews, backward compatible
- **Patch versions** - Bug fixes and workflow documentation updates

Systematic review tools can rely on minor version compatibility for consistent documentation.

## Quick Navigation for Workflow Development

| Component | Description | Primary Workflow Use |
|-----------|-------------|---------------------|
| [Main Schema](main/) | Complete workflow schema definition | Understanding the full systematic review workflow model |
| [Review Object](objects/review/) | Root workflow container | Starting a systematic review workflow document |
| [Stage Execution](objects/stage_execution/) | Base workflow stage class | Implementing systematic review stage documentation |
| [Registration Stage](stages/registration/) | Workflow registration/pre-specification | Protocol and methodology documentation |
| [Search Stage](stages/search/) | Search strategy and execution workflows | Search methodology documentation and replication |
| [Screening Stage](stages/screening/) | Study selection workflows | Screening process documentation with AI assistance |
| [Extraction Stage](stages/extraction/) | Data extraction processes | Extraction methodology and AI-assisted workflows |
| [Synthesis Stage](stages/synthesis/) | Data synthesis workflows | Analysis procedures and evidence synthesis documentation |

## Workflow Schema Extensions

The RevAIse schema is designed to be extensible for systematic review workflows. You can:
- Add custom workflow stages for domain-specific systematic review processes
- Define new AI assistance patterns for emerging systematic review automation
- Create specialized quality control workflows for different types of evidence synthesis
- Extend workflow documentation metadata for institutional systematic review requirements
- Define custom workflow templates for standardized institutional review processes

### Common Extension Patterns
- **Domain-specific stages** - Add specialized workflow stages for clinical reviews, environmental assessments, etc.
- **AI assistance patterns** - Define new patterns for AI integration in systematic review workflows
- **Quality assurance workflows** - Create specialized QA procedures for different evidence types
- **Institutional adaptations** - Build workflow extensions for specific institutional requirements and standards

For guidance on extending the systematic review workflow schema, see the [GitHub repository](https://github.com/open-and-sustainable/revaise-model) and our workflow documentation examples.

## Community and Support

The RevAIse workflow schema is supported by an active community of:
- **Systematic review methodologists** defining best practices for AI-assisted review workflows
- **Tool developers** creating interoperable systematic review platforms
- **Research librarians** implementing standardized search and screening workflows
- **Institutional adopters** implementing transparent and reproducible review processes

Join our community to share systematic review workflow patterns, discuss AI integration strategies, and contribute to the evolution of transparent, reproducible evidence synthesis.