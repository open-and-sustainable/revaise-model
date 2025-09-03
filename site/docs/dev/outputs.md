

# Slot: outputs 


_Output artifacts_





URI: [revaise:outputs](https://open-and-sustainable.github.io/revaise-model/schema/outputs)
Alias: outputs

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
| self | revaise:outputs |
| native | revaise:outputs |




## LinkML Source

<details>
```yaml
name: outputs
description: Output artifacts
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: outputs
domain_of:
- StageExecution
range: StageOutput

```
</details>