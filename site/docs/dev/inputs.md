

# Slot: inputs 


_Input artifacts_





URI: [revaise:inputs](https://open-and-sustainable.github.io/revaise-model/schema/inputs)
Alias: inputs

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [ScreeningStage](ScreeningStage.md) | Screening of titles and abstracts |  no  |
| [SearchStage](SearchStage.md) | Executing literature search strategies |  no  |
| [StageExecution](StageExecution.md) | Base class for executing a specific stage of the review |  yes  |






## Properties

* Range: [StageOutput](StageOutput.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:inputs |
| native | revaise:inputs |




## LinkML Source

<details>
```yaml
name: inputs
description: Input artifacts
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: inputs
domain_of:
- StageExecution
range: StageOutput

```
</details>