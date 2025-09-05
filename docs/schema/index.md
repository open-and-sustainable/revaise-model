# Schema Documentation

This section contains the complete documentation for the RevAIse Data Model schema, automatically generated from the LinkML source definitions.

## Schema Structure

The RevAIse schema is organized into three main categories:

### Main Schema
The [main schema](main/) defines the root `Review` class and imports all components. This is the entry point for understanding the complete data model.

### Core Objects
These are the fundamental building blocks of a systematic review:

- **[Author](objects/author/)** - Information about review authors and contributors
- **[Protocol](objects/protocol/)** - Review protocol and registration details
- **[Review](objects/review/)** - The main review container and metadata
- **[Literature Record](objects/literature_record/)** - Individual literature items and their metadata
- **[Stage Execution](objects/stage_execution/)** - Base class for all review stages
- **[Stage Output](objects/stage_output/)** - Outputs from stage executions
- **[Software Environment](objects/software_env/)** - Computational environment specifications
- **[Registration Template](objects/registration_template/)** - Templates for review registration
- **[Enumerations](objects/enums/)** - Controlled vocabularies and value sets

### Review Stages
These represent the sequential phases of a systematic review:

- **[Registration](stages/registration/)** - Protocol registration and pre-registration
- **[Search](stages/search/)** - Literature search strategy and execution
- **[Screening](stages/screening/)** - Title/abstract and full-text screening

## Schema Features

### Modular Design
The schema uses a modular architecture where:
- Each component is defined in its own file
- Components can be reused across different stages
- Extensions can be added without modifying core components

### LinkML Benefits
Built with LinkML (Linked Data Modeling Language), the schema provides:
- **Multiple serialization formats** - YAML, JSON, RDF, and more
- **Built-in validation** - Automatic generation of validation schemas
- **Semantic web compatibility** - JSON-LD contexts and RDF support
- **Documentation generation** - Auto-generated human-readable documentation
- **Type safety** - Strong typing with ranges and constraints

### AI Documentation Support
Special attention to documenting AI assistance:
- Model specifications and versions
- Prompts and parameters used
- Human oversight and modifications
- Performance metrics and confidence scores

### Provenance and Reproducibility
Comprehensive tracking of:
- Temporal information (dates and durations)
- Actor attribution (human and AI agents)
- Software environments and tool versions
- Decision rationale and modifications

## Using the Schema

### For Developers
1. Use the [JSON Schema](../api/revaise.schema.json) for validation in your applications
2. Refer to the [JSON-LD Context](../api/context.jsonld) for linked data applications
3. Import the LinkML YAML directly for schema extensions

### For Researchers
1. Review the object definitions to understand data requirements
2. Follow the stage documentation for process guidance
3. Use the enumerations for controlled vocabularies

### For Data Managers
1. Validate data against the JSON Schema
2. Ensure all required fields are populated
3. Document AI usage according to the schema specifications

## Schema Versioning

This documentation corresponds to the schema version you're currently viewing. The schema follows semantic versioning:

- **Major versions** - Breaking changes to the schema
- **Minor versions** - New features, backward compatible
- **Patch versions** - Bug fixes and documentation updates

Use the version selector at the bottom of the page to access documentation for different versions.

## Quick Navigation

| Component | Description | Primary Use |
|-----------|-------------|-------------|
| [Main Schema](main/) | Complete schema definition | Understanding the full model |
| [Review Object](objects/review/) | Root review container | Starting a review document |
| [Registration Stage](stages/registration/) | Registration/pre-registration | Protocol documentation |
| [Search Stage](stages/search/) | Search strategy and execution | Search documentation |
| [Screening Stage](stages/screening/) | Study selection process | Screening documentation |

## Schema Extensions

The RevAIse schema is designed to be extensible. You can:
- Add custom fields to existing classes
- Create new stage types for domain-specific needs
- Define additional enumerations for controlled vocabularies
- Extend AI documentation for new model types

For guidance on extending the schema, see the [GitHub repository](https://github.com/open-and-sustainable/revaise-model).