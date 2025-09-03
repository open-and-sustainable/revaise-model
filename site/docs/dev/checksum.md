

# Slot: checksum 


_Checksum of the output file_





URI: [revaise:checksum](https://open-and-sustainable.github.io/revaise-model/schema/checksum)
Alias: checksum

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [StageOutput](StageOutput.md) | Output file or log produced by a review stage (results, logs, code, visualiza... |  no  |
| [StageOutputRef](StageOutputRef.md) | Reference to a stage output in this or another RevAIse bundle |  no  |






## Properties

* Range: [String](String.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:checksum |
| native | revaise:checksum |




## LinkML Source

<details>
```yaml
name: checksum
description: Checksum of the output file
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: checksum
domain_of:
- StageOutput
- StageOutputRef
range: string

```
</details>