

# Slot: ended_at 


_End time_





URI: [revaise:ended_at](https://open-and-sustainable.github.io/revaise-model/schema/ended_at)
Alias: ended_at

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [ScreeningStage](ScreeningStage.md) | Screening of titles and abstracts |  no  |
| [SearchStage](SearchStage.md) | Executing literature search strategies |  no  |
| [StageExecution](StageExecution.md) | Base class for executing a specific stage of the review |  yes  |






## Properties

* Range: [Datetime](Datetime.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:ended_at |
| native | revaise:ended_at |




## LinkML Source

<details>
```yaml
name: ended_at
description: End time
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: ended_at
domain_of:
- StageExecution
range: datetime

```
</details>