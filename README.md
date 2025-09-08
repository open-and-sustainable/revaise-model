# RevAIse Data Model

> An Open Science standard for transparent, reproducible AI-assisted systematic literature reviews

[![Validate Schema](https://github.com/open-and-sustainable/revaise-model/actions/workflows/validate.yml/badge.svg)](https://github.com/open-and-sustainable/revaise-model/actions/workflows/validate.yml)
[![Documentation](https://readthedocs.org/projects/revaise-model/badge/?version=latest)](https://revaise-model.readthedocs.io/en/latest/?badge=latest)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17054435.svg)](https://doi.org/10.5281/zenodo.17054435)

## Why RevAIse?

The integration of AI into systematic literature reviews promises to accelerate research synthesis, but it also introduces critical challenges:

- **Reproducibility Crisis**: How can we ensure AI-assisted reviews can be independently verified and replicated?
- **Transparency Gap**: What prompts, models, and decision criteria were actually used?
- **Method Fragmentation**: Every team uses different tools, formats, and workflows, making collaboration difficult
- **Trust Deficit**: Without standardized documentation, how can readers assess the quality and reliability of AI-assisted reviews?

**RevAIse addresses these challenges by providing a comprehensive, open standard for documenting every aspect of AI-assisted systematic reviews.**

## What is RevAIse?

RevAIse is a structured data model that captures:

- **Complete Review Metadata** - From protocol registration to final synthesis
- **AI Usage Documentation** - Models, prompts, parameters, and decisions
- **Search Strategies** - Queries, databases, and result collections
- **Screening & Extraction** - Criteria, decisions, and human-in-the-loop processes
- **Full Reproducibility** - Software environments, data versions, and computational steps

## Who Benefits?

### Researchers
- Document your AI-assisted review process comprehensively
- Share reproducible research artifacts with the community
- Build on existing reviews with full transparency

### Journal Editors & Peer Reviewers
- Assess the methodological rigor of AI-assisted reviews
- Verify compliance with reporting standards (PRISMA, etc.)
- Ensure reproducibility requirements are met

### Tool Developers
- Build interoperable tools that speak a common language
- Import/export review data across platforms
- Contribute to an open ecosystem

### Research Institutions
- Establish best practices for AI-assisted evidence synthesis
- Ensure research outputs meet transparency standards
- Build institutional knowledge bases

## Key Features

- **Open Standard** - Community-governed, CC0 licensed (public domain), and freely available
- **Technology Agnostic** - Works with any AI model or review tool
- **FAIR Principles** - Findable, Accessible, Interoperable, and Reusable data
- **Multiple Formats** - JSON, YAML, RDF, and more
- **Extensible** - Adapt to your specific domain needs
- **Version Controlled** - Track changes in your review methodology

## Quick Start

### For Researchers
Start documenting your AI-assisted review using the RevAIse schema:

1. **Browse the Schema**: [Documentation](https://revaise-model.readthedocs.io/)
2. **Download Templates**: [JSON Schema - Stable](https://revaise-model.readthedocs.io/en/stable/api/revaise.schema.json)
3. **Validate Your Data**: Use standard JSON Schema validators

### For Developers
Integrate RevAIse into your tools:

```json
{
  "schema": "https://github.com/open-and-sustainable/revaise-model/blob/main/schema/revaise.yaml",
  "context": "https://github.com/open-and-sustainable/revaise-model/blob/main/schema/",
  "docs": "https://revaise-model.readthedocs.io/"
}
```

## Get Involved

RevAIse is a community effort. We welcome contributions from researchers, developers, librarians, and anyone interested in improving the transparency and reproducibility of AI-assisted research.

- **Read the Documentation**: [revaise-model.readthedocs.io](https://revaise-model.readthedocs.io/)
- **Join the Discussion**: [GitHub Discussions](https://github.com/open-and-sustainable/revaise-model/discussions)
- **Report Issues**: [GitHub Issues](https://github.com/open-and-sustainable/revaise-model/issues)
- **Contribute**: See our [Contributing Guide](CONTRIBUTING.md)

## Vision

We envision a future where:

- AI is the only viable way to keep pace with the vast and ever-growing body of scientific publications, beyond what human readers and reviewers alone can process
- Every AI-assisted systematic review is fully transparent and reproducible
- Researchers can seamlessly build upon each other's work
- AI tools enhance rather than obscure the review process
- The scientific community has complete confidence in AI-assisted evidence synthesis

## License

This project is licensed under CC0 1.0 Universal (Public Domain) - see the [LICENSE](LICENSE) file for details.

## Citation

If you use RevAIse in your research, please cite:

```bibtex
@software{revaise2025,
  title = {RevAIse: A Data Model for AI-Assisted Systematic Literature Reviews},
  author = {Boero, Riccardo},
  year = {2025},
  url = {https://github.com/open-and-sustainable/revaise-model},
  doi = {10.5281/zenodo.17054435}
}
```

---

<p align="center">
  <strong>Building trust in AI-assisted research through radical transparency</strong>
</p>
