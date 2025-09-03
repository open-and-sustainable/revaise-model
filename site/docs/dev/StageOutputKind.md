# Enum: StageOutputKind 



URI: [revaise:StageOutputKind](https://open-and-sustainable.github.io/revaise-model/schema/StageOutputKind)

## Permissible Values

| Value | Meaning | Description |
| --- | --- | --- |
| search_query | None | Search query strings used in databases |
| search_log | None | Logs of search executions |
| records_raw | None | Raw record exports from databases |
| records_deduped | None | Records after deduplication |
| screening_decisions | None | Decisions from screening stages |
| inclusion_list | None | List of included studies |
| exclusion_list | None | List of excluded studies |
| fulltexts | None | Full-text documents retrieved |
| extraction_table | None | Structured data extraction table |
| rob_table | None | Risk of bias assessment table |
| meta_analysis_table | None | Table summarizing meta-analysis results |
| forest_plot | None | Forest plot graphic |
| prisma_flow | None | PRISMA flow diagram |
| code_archive | None | Archive of code used |
| environment_lock | None | Environment lockfiles or manifests |
| model_card | None | AI model card or documentation |
| other | None | Other stage output type |




## Slots

| Name | Description |
| ---  | --- |
| [kind](kind.md) |  |





## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema






## LinkML Source

<details>
```yaml
name: StageOutputKind
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
permissible_values:
  search_query:
    text: search_query
    description: Search query strings used in databases.
  search_log:
    text: search_log
    description: Logs of search executions.
  records_raw:
    text: records_raw
    description: Raw record exports from databases.
  records_deduped:
    text: records_deduped
    description: Records after deduplication.
  screening_decisions:
    text: screening_decisions
    description: Decisions from screening stages.
  inclusion_list:
    text: inclusion_list
    description: List of included studies.
  exclusion_list:
    text: exclusion_list
    description: List of excluded studies.
  fulltexts:
    text: fulltexts
    description: Full-text documents retrieved.
  extraction_table:
    text: extraction_table
    description: Structured data extraction table.
  rob_table:
    text: rob_table
    description: Risk of bias assessment table.
  meta_analysis_table:
    text: meta_analysis_table
    description: Table summarizing meta-analysis results.
  forest_plot:
    text: forest_plot
    description: Forest plot graphic.
  prisma_flow:
    text: prisma_flow
    description: PRISMA flow diagram.
  code_archive:
    text: code_archive
    description: Archive of code used.
  environment_lock:
    text: environment_lock
    description: Environment lockfiles or manifests.
  model_card:
    text: model_card
    description: AI model card or documentation.
  other:
    text: other
    description: Other stage output type.

```
</details>