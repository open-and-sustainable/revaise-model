

# Slot: resource_uri 


_URI locating the resource_





URI: [revaise:resource_uri](https://open-and-sustainable.github.io/revaise-model/schema/resource_uri)
Alias: resource_uri

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [StageOutput](StageOutput.md) | Output file or log produced by a review stage (results, logs, code, visualiza... |  no  |
| [DatasetRef](DatasetRef.md) | External dataset reference |  no  |
| [StageOutputRef](StageOutputRef.md) | Reference to a stage output in this or another RevAIse bundle |  no  |






## Properties

* Range: [Uri](Uri.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:resource_uri |
| native | revaise:resource_uri |




## LinkML Source

<details>
```yaml
name: resource_uri
description: URI locating the resource
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: resource_uri
domain_of:
- StageOutput
- StageOutputRef
- DatasetRef
range: uri

```
</details>