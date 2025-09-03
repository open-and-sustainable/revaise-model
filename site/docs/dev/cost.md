

# Slot: cost 


_Estimated cost_





URI: [revaise:cost](https://open-and-sustainable.github.io/revaise-model/schema/cost)
Alias: cost

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [ScreeningStage](ScreeningStage.md) | Screening of titles and abstracts |  no  |
| [SearchStage](SearchStage.md) | Executing literature search strategies |  no  |
| [StageExecution](StageExecution.md) | Base class for executing a specific stage of the review |  yes  |






## Properties

* Range: [Float](Float.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:cost |
| native | revaise:cost |




## LinkML Source

<details>
```yaml
name: cost
description: Estimated cost
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: cost
domain_of:
- StageExecution
range: float

```
</details>