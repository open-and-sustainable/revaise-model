

# Slot: database_name 



URI: [revaise:database_name](https://open-and-sustainable.github.io/revaise-model/schema/database_name)
Alias: database_name

<!-- no inheritance hierarchy -->





## Applicable Classes

| Name | Description | Modifies Slot |
| --- | --- | --- |
| [SearchQuery](SearchQuery.md) | Search query executed against a database |  yes  |
| [Database](Database.md) | Information about a database used for searching |  yes  |






## Properties

* Range: [String](String.md)




## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:database_name |
| native | revaise:database_name |




## LinkML Source

<details>
```yaml
name: database_name
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
rank: 1000
alias: database_name
domain_of:
- Database
- SearchQuery
range: string

```
</details>