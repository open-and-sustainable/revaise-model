<div align="left">
  <img src="assets/logo_full.png" alt="RevAIse Logo" style="width: 300px; max-width: 80%; height: auto;">
</div>

# RevAIse Data Model Documentation

**An open standard for describing, sharing, and reproducing AI-assisted systematic literature review workflows**

---

Welcome to the official documentation for the RevAIse Data Model.

## Overview

RevAIse provides a comprehensive, standardized way to document complete AI-assisted systematic review workflows, ensuring:

- **Transparency** - Full documentation of AI usage, parameters, and workflow decisions throughout the review process
- **Reproducibility** - Complete capture of workflow methods, review stages, and research environments
- **Interoperability** - Standard format for sharing and comparing systematic review processes
- **Traceability** - Detailed provenance for all workflow stages and methodological decisions

## Quick Start

### Access the Schema

The RevAIse schema is available in multiple formats:

- **LinkML YAML** - The source schema definition
- **JSON Schema** - For validation in applications
- **JSON-LD Context** - For linked data applications

### Current Version

!!! info "Version Information"
    You are viewing documentation for: **{{ version | default("latest") }}**
    
    {% if version_description %}
    *{{ version_description }}*
    {% endif %}
    
    ReadTheDocs automatically maintains documentation for all tagged releases. Use the version selector at the bottom of the page to switch between versions.

## Key Components

### Review Core Objects

These are the fundamental objects that characterize a systematic review workflow:

- **[Review](schema/objects/review/)** - The root container for systematic reviews and their workflow documentation
- **[Author](schema/objects/author/)** - Review authors and workflow contributors
- **[Protocol](schema/objects/protocol/)** - Review protocol and workflow methodology specifications
- **[Literature Record](schema/objects/literature_record/)** - Individual literature items flowing through the review workflow

### Shared Infrastructure Objects

These objects are imported in review_core.yaml for sharing across workflow stages:

- **[Registration Template](schema/objects/registration_template/)** - Templates for review registration and workflow planning
- **[Stage Execution](schema/objects/stage_execution/)** - Base class for all workflow stages with execution metadata
- **[Stage Output](schema/objects/stage_output/)** - Outputs from workflow stage executions
- **[Software Environment](schema/objects/software_env/)** - Research environment specifications for workflow reproducibility
- **[External Tool](schema/objects/external_tool/)** - Tools and software used in systematic review workflows
- **[Enumerations](schema/objects/enums/)** - Controlled vocabularies and value sets for workflow documentation

### Review Workflow Stages

These represent the sequential phases of a systematic review workflow:

- **[Registration](schema/stages/registration/)** - Protocol registration and workflow pre-specification
- **[Search](schema/stages/search/)** - Literature search strategy execution and documentation
- **[Screening](schema/stages/screening/)** - Title/abstract and full-text screening workflows
- **[Extraction](schema/stages/extraction/)** - Data extraction processes from included studies
- **[Synthesis](schema/stages/synthesis/)** - Data synthesis workflows and analysis procedures

## Features

### Workflow-Based Organization
Systematic reviews are structured as documented workflows with discrete stages, each capturing:
- Execution metadata (timing, participants, methodologies)
- Input/output specifications and data flow between stages
- AI usage documentation and human-AI collaboration patterns
- Quality control measures and validation procedures

### AI Workflow Documentation
Comprehensive capture of AI assistance within systematic review workflows including:
- Model specifications and versions used in each stage
- Prompts and parameters for AI-assisted review steps
- Human oversight points and intervention patterns
- Performance metrics and quality assessment data

### Workflow Provenance Tracking
Complete traceability of systematic review processes with:
- Temporal information for all workflow activities
- Attribution of decisions (human reviewers and AI systems)
- Tool and environment specifications for reproducibility
- Decision rationale and methodological justifications

### Quality Assurance Workflows
Built-in support for systematic review quality processes:
- Review checklists and quality assessment tools integrated into workflows
- Inter-rater agreement metrics and conflict resolution procedures
- Quality control checkpoints and validation workflows
- Amendment tracking and workflow versioning

## Schema Formats

| Format | Description | Use Case |
|--------|-------------|----------|
| [LinkML YAML](schema/main/) | Source schema definition | Schema development and workflow template creation |
| [JSON Schema](api/revaise.schema.json) | JSON validation schema | Application validation and data checking |
| [JSON-LD Context](api/context.jsonld) | Linked data context | Semantic web applications and metadata |

## Version Support

This documentation system maintains all versions:

- **Latest** - The most recent stable release
- **Dev** - Current development version from main branch
- **Tagged Releases** - All historical versions (e.g., v0.1.0, v0.2.0)

Use the version selector to access documentation for any version.

## Getting Started

1. **Explore the Schema** - Start with the [main schema documentation](schema/main/)
2. **Review Workflow Examples** - Check the schema for example systematic review instances
3. **Map Your Review Workflow** - Document your systematic review process using RevAIse stages
4. **Validate Your Data** - Use the JSON Schema for workflow validation
5. **Contribute** - Visit our [GitHub repository](https://github.com/open-and-sustainable/revaise-model)

## Use Cases

### Research Teams
- Document and share complete systematic review workflows and methodologies
- Enable workflow replication and adaptation across different research contexts
- Build institutional libraries of proven systematic review processes

### Journal Publishers
- Require standardized workflow documentation for AI-assisted systematic reviews
- Enable compliance checking with systematic review reporting guidelines (PRISMA, etc.)
- Support reproducibility initiatives through transparent workflow documentation

### Tool Developers
- Understand standard systematic review workflow patterns to build compatible tools
- Enable data exchange between different systematic review platforms
- Support standardized documentation of AI assistance in review tools

### Research Methodologists
- Develop and refine systematic review workflow standards and best practices
- Compare and analyze different systematic review methodological approaches
- Create training materials and templates for systematic review workflows

## Links

- [GitHub Repository](https://github.com/open-and-sustainable/revaise-model)
- [Issue Tracker](https://github.com/open-and-sustainable/revaise-model/issues)
- [Releases](https://github.com/open-and-sustainable/revaise-model/releases)

## License

The RevAIse Data Model is released under the [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/) license, making it freely available for any use.

## Citation

If you use RevAIse in your work, please cite:

```bibtex
@software{revaise_model,
  title = {RevAIse: A Data Model for AI-Assisted Systematic Literature Review Workflows},
  author = {Boero, Riccardo},
  year = {2025},
  url = {https://github.com/open-and-sustainable/revaise-model},
  doi = {10.5281/zenodo.17054435}
}
```
