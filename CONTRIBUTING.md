# Contributing to RevAIse

Thank you for your interest in contributing to the RevAIse data model! This document provides guidelines for contributing to the core schema, creating extensions, and forking for domain-specific needs.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Workflow Contributions](#workflow-contributions)
- [Development Process](#development-process)
- [Schema Evolution](#schema-evolution)
- [Creating Extensions](#creating-extensions)
- [Forking & Domain Adaptations](#forking--domain-adaptations)
- [Community Standards](#community-standards)

## Code of Conduct

We are committed to providing a welcoming and inclusive environment. All participants are expected to:

- Be respectful and considerate in all interactions
- Welcome diverse perspectives and experiences
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

## How to Contribute

### Reporting Issues

- Check existing issues before creating a new one
- Use clear, descriptive titles
- Include relevant details (version, examples, expected vs actual behavior)
- Label issues appropriately (bug, enhancement, question, documentation)

### Suggesting Enhancements

1. Open a [Discussion](https://github.com/open-and-sustainable/revaise-model/discussions) first for major changes
2. Clearly describe the use case and benefits
3. Provide examples of how the enhancement would work
4. Consider backward compatibility implications

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature-name`)
3. Make your changes following our conventions
4. Add or update tests if applicable
5. Update documentation
6. Commit with clear, descriptive messages
7. Push to your fork and submit a pull request
8. Link any relevant issues

## Systematic Review Workflow Contributions

RevAIse is designed to support systematic review workflows and process documentation. We welcome contributions that enhance workflow documentation capabilities:

### Review Process Documentation

Contributing new patterns for documenting:

- **Review Stage Templates**: Standardized documentation for common review stages
- **AI-Assisted Review Processes**: Templates for documenting AI integration in systematic reviews
- **Quality Assurance Workflows**: Documentation patterns for different quality control approaches
- **Multi-Reviewer Workflows**: Patterns for collaborative review processes with conflict resolution

### Workflow Templates and Examples

We encourage contributions of:

1. **Complete Review Examples**: End-to-end systematic review workflow documentation using RevAIse
2. **Stage Templates**: Reusable documentation patterns for common review stages
3. **Methodology Guides**: Documentation of proven systematic review methodologies
4. **Best Practice Examples**: Real-world examples of transparent, reproducible review workflows

### Workflow Documentation Guidelines

When contributing workflow-related features:

1. **Document Dependencies**: Clearly specify stage prerequisites and information flows between review stages
2. **Enable Reproducibility**: Include complete methodology and decision documentation
3. **Support Transparency**: Provide metadata for review process tracking and quality assessment
4. **Consider Scalability**: Design documentation patterns for both small and large-scale systematic reviews
5. **Maintain Standards**: Ensure compatibility with systematic review reporting standards (PRISMA, etc.)

### Schema Contributions for Review Workflows

For workflow-related schema changes:

- **Stage Definitions**: New workflow stages for domain-specific systematic review processes
- **Process Metadata**: Enhanced tracking of review methodology and decision-making
- **AI Integration Documentation**: Improved patterns for documenting AI assistance within reviews
- **Quality Control**: New mechanisms for workflow validation and methodological quality assurance

### Testing Workflow Contributions

Systematic review workflow contributions should include:

- Example workflow documentation using the contributed features
- Test data demonstrating complete review process documentation
- Validation against systematic review methodology standards
- Examples from different domains showing adaptability

## Development Process

### Setting Up Your Environment

```bash
# Clone your fork
git clone https://github.com/your-username/revaise-model.git
cd revaise-model

# Install LinkML tools
pip install linkml linkml-runtime

# Validate the schema
linkml-validate schema/revaise.yaml

# Generate documentation
gen-doc schema/revaise.yaml -d docs/
```

### Schema Modification Guidelines

When modifying the core schema:

1. **Maintain Backward Compatibility**: Breaking changes require major version bumps
2. **Follow LinkML Best Practices**: Use appropriate types, ranges, and constraints
3. **Document Everything**: Add descriptions to all classes and slots
4. **Include Examples**: Provide example data for new features
5. **Test Thoroughly**: Ensure existing examples still validate

### Version Management

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Incompatible schema changes
- **MINOR**: Backward-compatible additions
- **PATCH**: Backward-compatible fixes

## Schema Evolution

### Proposal Process

For significant schema changes:

1. **RFC (Request for Comments)**
   - Create an issue with the `RFC` label
   - Include motivation, detailed design, examples
   - Allow 2 weeks for community feedback

2. **Prototype**
   - Implement in a branch
   - Provide example documents
   - Test with real-world use cases

3. **Review & Approval**
   - Core maintainers review
   - Community testing period
   - Formal approval and merge

### Deprecation Policy

- Features are deprecated for at least one minor version before removal
- Deprecation notices include migration guides
- Major version bumps for removals

## Creating Extensions

Extensions allow domain-specific additions without modifying the core schema.

### Extension Structure

```yaml
# extensions/your-domain/schema.yaml
id: https://example.org/your-domain/extension
name: your_domain_extension
description: "Domain-specific extensions for [your domain]"

prefixes:
  your_domain: https://example.org/your-domain/
  revaise: https://open-and-sustainable.github.io/revaise-model/schema/

imports:
  - ../../schema/revaise.yaml

classes:
  YourDomainReview:
    is_a: Review  # Extend the base Review class
    slots:
      - your_custom_slot
    
slots:
  your_custom_slot:
    description: "Domain-specific data"
    range: string
```

### Registering Extensions

Add your extension to `extensions/registry.json`:

```json
{
  "extensions": [
    {
      "id": "your-domain",
      "name": "Your Domain Extension",
      "description": "Extensions for [specific use case]",
      "schema_url": "https://example.org/your-domain/schema.yaml",
      "documentation": "https://example.org/your-domain/docs",
      "maintainer": "Your Organization",
      "version": "1.0.0"
    }
  ]
}
```

### Extension Best Practices

1. **Namespace Properly**: Use unique prefixes to avoid conflicts
2. **Document Use Cases**: Clearly explain when to use your extension
3. **Provide Examples**: Include sample documents using your extension
4. **Maintain Compatibility**: Test against core schema updates
5. **Consider Upstreaming**: Widely useful features should be proposed for core

## Forking & Domain Adaptations

### When to Fork

Consider forking when:

- You need incompatible changes for your domain
- You require a different governance model
- You're creating a specialized variant (e.g., clinical trials, software reviews)

### Fork Guidelines

1. **Maintain Attribution**: Keep original copyright and add your modifications
2. **Change Namespaces**: Use your own URIs to avoid confusion
3. **Document Divergence**: Clearly explain differences from upstream
4. **Consider Compatibility**: Design for potential future convergence

### Staying Synchronized

```bash
# Add upstream remote
git remote add upstream https://github.com/open-and-sustainable/revaise-model.git

# Fetch upstream changes
git fetch upstream

# Merge or rebase as appropriate
git merge upstream/main
```

### Contributing Back

We encourage forks to contribute improvements back:

- General improvements benefit everyone
- Domain insights can improve the core model
- Extensions can be shared without merging into core

## Community Standards

### Communication Channels

- **GitHub Discussions**: Design discussions, Q&A
- **Issues**: Bug reports, feature requests
- **Pull Requests**: Code contributions
- **Mailing List**: [If applicable]

### Decision Making

1. **Consensus Building**: Seek agreement through discussion
2. **Maintainer Review**: Core maintainers have final approval
3. **Community Input**: Major decisions require community comment period
4. **Transparency**: All decisions are documented publicly

### Recognition

Contributors are recognized through:

- Git commit history
- CONTRIBUTORS.md file
- Release notes acknowledgments
- Community highlights

## Getting Help

- Read the [Documentation](https://open-and-sustainable.github.io/revaise-model/)
- Check [GitHub Discussions](https://github.com/open-and-sustainable/revaise-model/discussions)
- Review existing [Issues](https://github.com/open-and-sustainable/revaise-model/issues)
- Ask questions with the `question` label

## License

By contributing, you agree that your contributions will be licensed under the same CC0 1.0 Universal license as the project.

## Thank You!

Your contributions make RevAIse better for everyone. Whether you're fixing typos, adding features, creating extensions, or forking for new domains, you're helping build a more transparent and reproducible future for AI-assisted research.

---

*This contributing guide is a living document. Suggestions for improvements are always welcome!*