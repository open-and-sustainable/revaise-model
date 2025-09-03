<p style="background-color:white; display:inline-block;" align="center">
  <img src="images/logo_full.png" alt="RevAIse logo" width="200" />
</p>

# RevAIse — Review AI Standard for Exchange

RevAIse is an open standard for describing, sharing, and reproducing systematic reviews, organized by stages.

## Documentation

Full documentation is available at the [RevAIse GitHub Pages site](https://open-and-sustainable.github.io/revaise-model/).
It includes a reference for the data model and guidance on using the schema in your projects.

## Schema Structure

The schema follows a hierarchical structure with `Review` as the root object:

### Top-level Schema
- [`schema/revaise.yaml`](schema/revaise.yaml) - Entry point defining `Review` as the required root object

### Core Components
- [`schema/model/core.yaml`](schema/model/core.yaml) - Core definitions imported by all schemas:
  - **Author** - Shared author representation for reviews and publications
  - **Review** - Root container for all review data
  - **Protocol** - Review protocol and registration
  - **LiteratureRecord** - Publications tracked across stages
  - **StageExecution** - Base class for review stages
  - **Artifact** - Files and outputs from stages
  - **SoftwareEnv** - Environment for reproducibility

### Objects
[`schema/model/objects/`](schema/model/objects/) contains the building blocks:
- [`review.yaml`](schema/model/objects/review.yaml) - The main Review object with metadata
- [`author.yaml`](schema/model/objects/author.yaml) - Author and affiliation information
- [`literature_record.yaml`](schema/model/objects/literature_record.yaml) - Literature records and collections
- [`protocol.yaml`](schema/model/objects/protocol.yaml) - Protocol registration details
- [`stage_execution.yaml`](schema/model/objects/stage_execution.yaml) - Base stage execution
- [`artifact.yaml`](schema/model/objects/artifact.yaml) - Artifact definitions
- [`software_env.yaml`](schema/model/objects/software_env.yaml) - Software environment
- [`enums.yaml`](schema/model/objects/enums.yaml) - Enumerations (StageType, ArtifactKind, etc.)
- [`slots.yaml`](schema/model/objects/slots.yaml) - Common slot definitions

### Stages
[`schema/model/stages/`](schema/model/stages/) contains stage-specific schemas:
- [`search.yaml`](schema/model/stages/search.yaml) - Literature search stage with databases and queries
- [`screening.yaml`](schema/model/stages/screening.yaml) - Title/abstract and full-text screening
- [`data_extraction.yaml`](schema/model/stages/data_extraction.yaml) - Data extraction from included studies

### Validation Profiles
[`schema/model/profiles/`](schema/model/profiles/) provides validation profiles:
- [`review_full.yaml`](schema/model/profiles/review_full.yaml) - Complete review with all requirements
- [`review_min.yaml`](schema/model/profiles/review_min.yaml) - Minimal review requirements
- [`search_comprehensive.yaml`](schema/model/profiles/search_comprehensive.yaml) - Comprehensive search documentation
- [`search_min.yaml`](schema/model/profiles/search_min.yaml) - Minimal search requirements

## Data Model Overview

Every RevAIse document must have a `Review` object at its root, containing:

```yaml
Review:
  review_id: "SR-2024-001"
  title: "Your systematic review title"
  review_type: "SYSTEMATIC_REVIEW"
  authors:
    - name: "Author Name"
      orcid: "0000-0000-0000-0000"
  review_status: "IN_PROGRESS"
  protocol:
    registry: "PROSPERO"
    registration_id: "CRD42024123456"
  stages:
    - stage_type: "search"
      # Stage-specific data
  literature_records:
    # Shared literature records
```

## Examples

Example data instances can be found in the [`examples/`](examples/) directory.

## Building Documentation

To build the documentation site:

```bash
bash scripts/build.sh
```

This generates JSON schemas, JSON-LD contexts, and HTML documentation for each profile.

## License

This project is released under the [Creative Commons Zero v1.0 Universal](LICENSE) license.
**Author:** Riccardo Boero – [ribo@nilu.no](mailto:ribo@nilu.no)