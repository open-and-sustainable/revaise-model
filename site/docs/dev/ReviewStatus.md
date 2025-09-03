# Enum: ReviewStatus 




_Status of the review_



URI: [revaise:ReviewStatus](https://open-and-sustainable.github.io/revaise-model/schema/ReviewStatus)

## Permissible Values

| Value | Meaning | Description |
| --- | --- | --- |
| PROTOCOL | None | Protocol stage |
| IN_PROGRESS | None | Review in progress |
| COMPLETED | None | Review completed |
| PUBLISHED | None | Review published |
| UPDATED | None | Review updated |
| WITHDRAWN | None | Review withdrawn |




## Slots

| Name | Description |
| ---  | --- |
| [review_status](review_status.md) |  |
| [review_status](review_status.md) | Current status of the review |





## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema






## LinkML Source

<details>
```yaml
name: ReviewStatus
description: Status of the review
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
permissible_values:
  PROTOCOL:
    text: PROTOCOL
    description: Protocol stage
  IN_PROGRESS:
    text: IN_PROGRESS
    description: Review in progress
  COMPLETED:
    text: COMPLETED
    description: Review completed
  PUBLISHED:
    text: PUBLISHED
    description: Review published
  UPDATED:
    text: UPDATED
    description: Review updated
  WITHDRAWN:
    text: WITHDRAWN
    description: Review withdrawn

```
</details>