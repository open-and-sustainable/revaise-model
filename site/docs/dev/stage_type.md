

# Slot: stage_type 


_Type of stage executed_





URI: [revaise:stage_type](https://open-and-sustainable.github.io/revaise-model/schema/stage_type)
Alias: stage_type

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
| self | revaise:stage_type |
| native | revaise:stage_type |




## LinkML Source

<details>
```yaml
name: stage_type
description: Type of stage executed
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: stage_type
domain_of:
- StageExecution
range: string

```
</details>