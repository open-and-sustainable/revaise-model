

# Slot: stage_label 


_Human-readable label_





URI: [revaise:stage_label](https://open-and-sustainable.github.io/revaise-model/schema/stage_label)
Alias: stage_label

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [ScreeningStage](ScreeningStage.md) | Screening of titles and abstracts |  no  |
| [SearchStage](SearchStage.md) | Executing literature search strategies |  no  |
| [StageExecution](StageExecution.md) | Base class for executing a specific stage of the review |  yes  |






## Properties

* Range: [String](String.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:stage_label |
| native | revaise:stage_label |




## LinkML Source

<details>
```yaml
name: stage_label
description: Human-readable label
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: stage_label
domain_of:
- StageExecution
range: string

```
</details>