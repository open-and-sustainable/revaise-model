

# Slot: started_at 


_Start time_





URI: [revaise:started_at](https://open-and-sustainable.github.io/revaise-model/schema/started_at)
Alias: started_at

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
| self | revaise:started_at |
| native | revaise:started_at |




## LinkML Source

<details>
```yaml
name: started_at
description: Start time
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: started_at
domain_of:
- StageExecution
range: datetime

```
</details>