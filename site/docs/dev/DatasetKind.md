# Enum: DatasetKind 



URI: [revaise:DatasetKind](https://open-and-sustainable.github.io/revaise-model/schema/DatasetKind)

## Permissible Values

| Value | Meaning | Description |
| --- | --- | --- |
| bibliographic_db | None | Online bibliographic database |
| local_index | None | Local index built from sources |
| fulltext_corpus | None | Corpus of full-text documents |
| annotation_set | None | Set of human or machine annotations |
| gold_labels | None | Gold standard labels for evaluation |
| calibration_set | None | Dataset used for calibration |
| other | None | Other dataset kind |




## Slots

| Name | Description |
| ---  | --- |
| [kind](kind.md) |  |





## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema






## LinkML Source

<details>
```yaml
name: DatasetKind
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
permissible_values:
  bibliographic_db:
    text: bibliographic_db
    description: Online bibliographic database.
  local_index:
    text: local_index
    description: Local index built from sources.
  fulltext_corpus:
    text: fulltext_corpus
    description: Corpus of full-text documents.
  annotation_set:
    text: annotation_set
    description: Set of human or machine annotations.
  gold_labels:
    text: gold_labels
    description: Gold standard labels for evaluation.
  calibration_set:
    text: calibration_set
    description: Dataset used for calibration.
  other:
    text: other
    description: Other dataset kind.

```
</details>