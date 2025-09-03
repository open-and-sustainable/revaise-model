# Enum: StageType 




_Logical stages of a systematic review (typical flow)._



URI: [revaise:StageType](https://open-and-sustainable.github.io/revaise-model/schema/StageType)

## Permissible Values

| Value | Meaning | Description |
| --- | --- | --- |
| scoping | None | Initial scoping to refine the review question |
| registration | None | Registering the review protocol |
| search | None | Executing literature search strategies |
| deduplication | None | Removing duplicate records |
| screening_title_abstract | None | Screening titles and abstracts |
| screening_fulltext | None | Full-text screening of records |
| data_extraction | None | Extracting data from included studies |
| risk_of_bias | None | Assessing risk of bias |
| synthesis_meta_analysis | None | Performing quantitative synthesis |
| synthesis_narrative | None | Performing narrative synthesis |
| reporting_prisma | None | Preparing PRISMA report |
| reproducibility_pack | None | Compiling reproducibility package |




## Slots

| Name | Description |
| ---  | --- |
| [stage_type](stage_type.md) | Type of stage being executed |





## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema






## LinkML Source

<details>
```yaml
name: StageType
description: Logical stages of a systematic review (typical flow).
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
permissible_values:
  scoping:
    text: scoping
    description: Initial scoping to refine the review question.
  registration:
    text: registration
    description: Registering the review protocol.
  search:
    text: search
    description: Executing literature search strategies.
  deduplication:
    text: deduplication
    description: Removing duplicate records.
  screening_title_abstract:
    text: screening_title_abstract
    description: Screening titles and abstracts.
  screening_fulltext:
    text: screening_fulltext
    description: Full-text screening of records.
  data_extraction:
    text: data_extraction
    description: Extracting data from included studies.
  risk_of_bias:
    text: risk_of_bias
    description: Assessing risk of bias.
  synthesis_meta_analysis:
    text: synthesis_meta_analysis
    description: Performing quantitative synthesis.
  synthesis_narrative:
    text: synthesis_narrative
    description: Performing narrative synthesis.
  reporting_prisma:
    text: reporting_prisma
    description: Preparing PRISMA report.
  reproducibility_pack:
    text: reproducibility_pack
    description: Compiling reproducibility package.

```
</details>