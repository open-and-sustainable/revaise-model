<div align="left">
  <img src="assets/logo_full.png" alt="RevAIse Logo" style="width: 300px; max-width: 80%; height: auto;">
</div>

# RevAIse Data Model Documentation

**An open standard for describing, sharing, and reproducing AI-assisted systematic literature reviews**

---

Welcome to the official documentation for the RevAIse Data Model.

## Overview

RevAIse provides a comprehensive, standardized way to document every aspect of AI-assisted systematic reviews, ensuring:

- **Transparency** - Full documentation of AI usage, parameters, and decisions
- **Reproducibility** - Complete capture of methods, data, and computational environment
- **Interoperability** - Standard format for sharing and combining review data
- **Traceability** - Detailed provenance for all review stages and decisions

## Quick Start

### Access the Schema

The RevAIse schema is available in multiple formats:

- **LinkML YAML** - The source schema definition
- **JSON Schema** - For validation in applications
- **JSON-LD Context** - For linked data applications

### Current Version

!!! info "Version Information"
    You are viewing documentation for: **{{ config.extra.version }}**
    
    ReadTheDocs automatically maintains documentation for all tagged releases. Use the version selector at the bottom of the page to switch between versions.

## Key Components

### Core Objects

- **[Review](schema/objects/review/)** - The root container for systematic reviews
- **[Author](schema/objects/author/)** - Review authors and contributors
- **[Protocol](schema/objects/protocol/)** - Review protocol and registration details
- **[Literature Record](schema/objects/literature_record/)** - Individual literature items

### Review Stages

- **[Registration](schema/stages/registration/)** - Protocol registration and pre-registration
- **[Search](schema/stages/search/)** - Literature search execution and documentation
- **[Screening](schema/stages/screening/)** - Title/abstract and full-text screening

## Features

### Stage-Based Organization
Reviews are organized into discrete stages (registration, search, screening, etc.), each with:
- Execution metadata (timing, actors, tools)
- Input/output specifications
- AI usage documentation
- Quality control measures

### AI Documentation
Comprehensive capture of AI assistance including:
- Model specifications and versions
- Prompts and parameters
- Human oversight and modifications
- Performance metrics

### Provenance Tracking
Complete traceability with:
- Temporal information for all activities
- Actor attribution (human and AI)
- Tool and environment specifications
- Decision rationale

### Quality Assurance
Built-in support for:
- Review artifacts and checklists
- Inter-rater agreement metrics
- Conflict resolution documentation
- Amendment tracking

## Schema Formats

| Format | Description | Use Case |
|--------|-------------|----------|
| [LinkML YAML](schema/main/) | Source schema definition | Schema development and extension |
| [JSON Schema](api/revaise.schema.json) | JSON validation schema | Application validation |
| [JSON-LD Context](api/context.jsonld) | Linked data context | RDF and semantic web applications |

## Version Support

This documentation system maintains all versions:

- **Latest** - The most recent stable release
- **Dev** - Current development version from main branch
- **Tagged Releases** - All historical versions (e.g., v0.1.0, v0.2.0)

Use the version selector to access documentation for any version.

## Getting Started

1. **Explore the Schema** - Start with the [main schema documentation](schema/main/)
2. **Review Examples** - Check the schema for example instances
3. **Validate Your Data** - Use the JSON Schema for validation
4. **Contribute** - Visit our [GitHub repository](https://github.com/open-and-sustainable/revaise-model)

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
  title = {RevAIse: A Data Model for AI-Assisted Systematic Literature Reviews},
  author = {Boero, Riccardo},
  year = {2025},
  url = {https://github.com/open-and-sustainable/revaise-model},
  doi = {10.5281/zenodo.17054435}
}
```
