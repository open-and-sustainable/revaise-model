

# Slot: kind 


_Kind or type of stage output_





URI: [revaise:kind](https://open-and-sustainable.github.io/revaise-model/schema/kind)
Alias: kind

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [StageOutput](StageOutput.md) | Output file or log produced by a review stage (results, logs, code, visualiza... |  yes  |
| [DatasetRef](DatasetRef.md) | External dataset reference |  yes  |






## Properties

* Range: [String](String.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:kind |
| native | revaise:kind |




## LinkML Source

<details>
```yaml
name: kind
description: Kind or type of stage output
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: kind
domain_of:
- StageOutput
- DatasetRef
range: string

```
</details>