<div align="left">
  <img src="images/logo_full.png" alt="RevAIse Logo" width="400">
</div>

> # Review AI Standard for Exchange

**An Open Science standard for transparent, reproducible AI-assisted systematic literature review workflows**

RevAIse offers two complementary layers: a **LinkML data model** for structured documentation of AI-assisted systematic review workflows, and **declarative protocol conformance shapes** (SHACL) that map external reporting guidelines (e.g. PRISMA 2020) directly against the model for automated validation. Both are openly licensed, independently versioned, and published as citable artifacts.

[![Validate Schema](https://github.com/open-and-sustainable/revaise-model/actions/workflows/validate.yml/badge.svg)](https://github.com/open-and-sustainable/revaise-model/actions/workflows/validate.yml)
[![Documentation](https://readthedocs.org/projects/revaise-model/badge/?version=latest)](https://revaise-model.readthedocs.io/latest/?badge=latest)
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

RevAIse is a structured data model and protocol conformance framework for transparent, reproducible AI-assisted systematic literature review workflows:

- **Workflow Process Documentation** - From optional scoping and protocol registration through synthesis and reporting, capturing the complete review workflow with stage dependencies
- **AI-Assisted Process Steps** - Models, prompts, parameters, and automated decision points integrated within the review workflow
- **Search Process Workflows** - Query strategies, database execution sequences, and result processing flows
- **Review Process Workflows** - Screening criteria, extraction procedures, and human-AI collaboration patterns throughout the review
- **Workflow Reproducibility** - Complete process environments, data lineage, and step-by-step execution documentation
- **Protocol Conformance** - Machine-checkable SHACL mappings of reporting guidelines (e.g. PRISMA 2020) directly against the data model, enabling automated validation of review documents

Current stage coverage includes optional scoping, registration, search, screening with deduplication, extraction, risk-of-bias assessment, synthesis, and optional reporting.

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

## Published Artifacts

### Data model

Schema documentation and all generated artifacts (LinkML YAML, JSON Schema, JSON-LD context, SHACL, OWL, RDF) are published on [Read the Docs](https://revaise-model.readthedocs.io/). `stable` tracks the latest release; pin a specific version (e.g. `/0.7.0/api/...`) for reproducible work.

### Protocol artifacts

Protocol documentation and SHACL conformance shapes are published on [GitHub Pages](https://open-and-sustainable.github.io/revaise-model/). Each protocol release is tagged on the `gh-pages` branch (e.g. `gh-pages/prisma-2020-1.0.0`), providing an immutable versioned snapshot.

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
