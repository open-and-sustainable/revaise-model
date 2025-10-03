<div align="left">
  <img src="images/logo_full.png" alt="RevAIse Logo" width="400">
</div>

> # RevAIse Data Model

**An Open Science standard for transparent, reproducible AI-assisted systematic literature review workflows**

[![Validate Schema](https://github.com/open-and-sustainable/revaise-model/actions/workflows/validate.yml/badge.svg)](https://github.com/open-and-sustainable/revaise-model/actions/workflows/validate.yml)
[![Documentation](https://readthedocs.org/projects/revaise-model/badge/?version=latest)](https://revaise-model.readthedocs.io/en/latest/?badge=latest)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17054435.svg)](https://doi.org/10.5281/zenodo.17054435)

## Why RevAIse?

The integration of AI into systematic literature reviews promises to accelerate research synthesis, but it also introduces critical workflow challenges:

- **Reproducibility Crisis**: How can we ensure AI-assisted review workflows can be independently verified and replicated?
- **Transparency Gap**: What prompts, models, and decision criteria were actually used in the workflow?
- **Workflow Fragmentation**: Every team uses different review processes, making collaboration and replication difficult
- **Process Opacity**: Complex AI-assisted review workflows lack clear documentation of decision flows and dependencies
- **Trust Deficit**: Without standardized workflow documentation, how can readers assess the quality and reliability of AI-assisted reviews?

**RevAIse addresses these challenges by providing a comprehensive, open standard for documenting complete systematic review workflows.**

## What is RevAIse?

RevAIse is a structured data model that captures complete systematic review workflows:

- **Workflow Process Documentation** - From protocol registration through synthesis, capturing the complete review workflow with stage dependencies
- **AI-Assisted Process Steps** - Models, prompts, parameters, and automated decision points integrated within the review workflow
- **Search Process Workflows** - Query strategies, database execution sequences, and result processing flows
- **Review Process Workflows** - Screening criteria, extraction procedures, and human-AI collaboration patterns throughout the review
- **Workflow Reproducibility** - Complete process environments, data lineage, and step-by-step execution documentation

## Who Benefits?

### Researchers
- **Document review workflows** comprehensively for future reuse and methodological transparency
- **Share reproducible research workflows** with complete process documentation
- **Build on existing review workflows** with full transparency of methods and processes
- Enable **workflow replication** across different research teams and contexts

### Journal Editors & Peer Reviewers
- Assess the methodological rigor of AI-assisted review workflows and processes
- Verify compliance with reporting standards (PRISMA, etc.) through complete workflow documentation
- Ensure workflow reproducibility and transparency requirements are met

### Tool Developers
- **Understand standard review workflow patterns** to build compatible tools
- **Enable process interoperability** between different AI and review platforms
- Import/export review workflow data across platforms using standardized documentation
- Contribute to an open ecosystem of interoperable review tools

### Research Institutions
- Establish best practices for AI-assisted evidence synthesis workflows
- Ensure research outputs meet transparency and workflow documentation standards
- **Build institutional workflow knowledge** bases and process libraries

## Key Features

- **Open Standard** - Community-governed, CC0 licensed (public domain), and freely available
- **Process Agnostic** - Works with any AI model, review tool, or institutional workflow
- **Workflow Templates** - Reusable patterns for common review types and AI integration processes
- **Process Documentation** - Complete capture of review steps, decision points, and data flows
- **Workflow Provenance** - Full lineage from initial searches to final conclusions
- **FAIR Principles** - Findable, Accessible, Interoperable, and Reusable workflow documentation
- **Multiple Formats** - JSON, YAML, RDF, and more
- **Extensible** - Adapt workflow definitions to your specific domain and institutional needs
- **Version Controlled** - Track changes in your review methodology and workflow evolution

## Quick Start

### For Researchers
Start documenting your AI-assisted review workflows using the RevAIse schema:

1. **Browse the Schema**: [Documentation](https://revaise-model.readthedocs.io/)
2. **Download Templates**: [JSON Schema - Stable](https://revaise-model.readthedocs.io/en/stable/api/revaise.schema.json)
3. **Map Your Review Workflow**: Document your systematic review process using RevAIse workflow stages
4. **Validate Your Data**: Use standard JSON Schema validators

### For Developers
Integrate RevAIse into your systematic review tools:

```json
{
  "schema": "https://github.com/open-and-sustainable/revaise-model/blob/main/schema/revaise.yaml",
  "context": "https://github.com/open-and-sustainable/revaise-model/blob/main/schema/",
  "docs": "https://revaise-model.readthedocs.io/"
}
```

### For Methodologists
Use RevAIse to standardize systematic review workflows:

1. **Define Standard Processes** - Document institutional systematic review workflows
2. **Capture Process Dependencies** - Map relationships between review stages and decision points
3. **Enable Process Replication** - Create templates for reproducible review workflows
4. **Share Process Knowledge** - Publish standardized workflow definitions for community use

## Get Involved

RevAIse is a community effort. We welcome contributions from researchers, developers, librarians, methodologists, and anyone interested in improving the transparency and reproducibility of AI-assisted research workflows.

- **Read the Documentation**: [revaise-model.readthedocs.io](https://revaise-model.readthedocs.io/)
- **Join the Discussion**: [GitHub Discussions](https://github.com/open-and-sustainable/revaise-model/discussions)
- **Report Issues**: [GitHub Issues](https://github.com/open-and-sustainable/revaise-model/issues)
- **Contribute**: See our [Contributing Guide](CONTRIBUTING.md)

## Vision

We envision a future where:

- **Systematic review workflows** are fully documented, transparent, and reproducible
- **Process standardization** enables researchers to build on proven review methodologies
- **Workflow documentation** seamlessly coordinates human expertise with AI capabilities in systematic reviews
- **Process libraries** accelerate evidence synthesis across research domains
- AI is effectively integrated into systematic review workflows while maintaining methodological rigor
- Every AI-assisted systematic review workflow is fully transparent and reproducible
- Researchers can seamlessly build upon each other's systematic review processes
- AI tools enhance rather than obscure the systematic review process through clear workflow documentation
- The scientific community has complete confidence in AI-assisted evidence synthesis workflows

## License

This project is licensed under CC0 1.0 Universal (Public Domain) - see the [LICENSE](LICENSE) file for details.

## Citation

If you use RevAIse in your research, please cite:

```bibtex
@software{revaise2025,
  title = {RevAIse: A Data Model for AI-Assisted Systematic Literature Review Workflows},
  author = {Boero, Riccardo},
  year = {2025},
  url = {https://github.com/open-and-sustainable/revaise-model},
  doi = {10.5281/zenodo.17054435}
}
```

---

<p align="center">
  <strong>Building trust in AI-assisted research through transparent, reproducible workflows</strong>
</p>