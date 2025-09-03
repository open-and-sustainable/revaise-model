

# Slot: stage_description 


_Detailed description_





URI: [revaise:stage_description](https://open-and-sustainable.github.io/revaise-model/schema/stage_description)
Alias: stage_description

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
| self | revaise:stage_description |
| native | revaise:stage_description |




## LinkML Source

<details>
```yaml
name: stage_description
description: Detailed description
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: stage_description
domain_of:
- StageExecution
range: string

```
</details>