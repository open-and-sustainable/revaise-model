

# Slot: review_authors 



URI: [revaise:review_authors](https://open-and-sustainable.github.io/revaise-model/schema/review_authors)
Alias: review_authors

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [Review](Review.md) | Root container for a systematic review |  yes  |






## Properties

* Range: [Author](Author.md)

* Multivalued: True




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:review_authors |
| native | revaise:review_authors |




## LinkML Source

<details>
```yaml
name: review_authors
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: review_authors
domain_of:
- Review
range: Author
multivalued: true

```
</details>