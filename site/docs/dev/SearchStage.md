

# Class: SearchStage 


_Executing literature search strategies._





URI: [revaise:SearchStage](https://open-and-sustainable.github.io/revaise-model/schema/SearchStage)





```mermaid
 classDiagram
    class SearchStage
    click SearchStage href "../SearchStage/"
      StageExecution <|-- SearchStage
        click StageExecution href "../StageExecution/"
      
      SearchStage : cost
        
      SearchStage : databases
        
          
    
        
        
        SearchStage --> "*" Database : databases
        click Database href "../Database/"
    

        
      SearchStage : ended_at
        
      SearchStage : inputs
        
          
    
        
        
        SearchStage --> "*" StageOutput : inputs
        click StageOutput href "../StageOutput/"
    

        
      SearchStage : outputs
        
          
    
        
        
        SearchStage --> "*" StageOutput : outputs
        click StageOutput href "../StageOutput/"
    

        
      SearchStage : result_collections
        
          
    
        
        
        SearchStage --> "*" LiteratureRecordCollection : result_collections
        click LiteratureRecordCollection href "../LiteratureRecordCollection/"
    

        
      SearchStage : search_queries
        
          
    
        
        
        SearchStage --> "*" SearchQuery : search_queries
        click SearchQuery href "../SearchQuery/"
    

        
      SearchStage : stage_description
        
      SearchStage : stage_label
        
      SearchStage : stage_type
        
          
    
        
        
        SearchStage --> "1" StageType : stage_type
        click StageType href "../StageType/"
    

        
      SearchStage : started_at
        
      
```





## Inheritance
* [StageExecution](StageExecution.md)
    * **SearchStage**



## Slots

| Name | Cardinality and Range | Description | Inheritance |
| ---  | --- | --- | --- |
| [databases](databases.md) | * <br/> [Database](Database.md) | Databases used for literature search | direct |
| [search_queries](search_queries.md) | * <br/> [SearchQuery](SearchQuery.md) | Search queries executed | direct |
| [result_collections](result_collections.md) | * <br/> [LiteratureRecordCollection](LiteratureRecordCollection.md) | Collections of literature records resulting from searches | direct |
| [stage_type](stage_type.md) | 1 <br/> [StageType](StageType.md) | Type of stage being executed | [StageExecution](StageExecution.md) |
| [stage_label](stage_label.md) | 0..1 <br/> [String](String.md) | Human-readable label for this stage execution | [StageExecution](StageExecution.md) |
| [stage_description](stage_description.md) | 0..1 <br/> [String](String.md) | Description of what was done in this stage | [StageExecution](StageExecution.md) |
| [started_at](started_at.md) | 0..1 <br/> [Datetime](Datetime.md) | When this stage started | [StageExecution](StageExecution.md) |
| [ended_at](ended_at.md) | 0..1 <br/> [Datetime](Datetime.md) | When this stage ended | [StageExecution](StageExecution.md) |
| [inputs](inputs.md) | * <br/> [StageOutput](StageOutput.md) | Input artifacts for this stage | [StageExecution](StageExecution.md) |
| [outputs](outputs.md) | * <br/> [StageOutput](StageOutput.md) | Output artifacts produced by this stage | [StageExecution](StageExecution.md) |
| [cost](cost.md) | 0..1 <br/> [Float](Float.md) | Estimated cost of this stage | [StageExecution](StageExecution.md) |










## Identifier and Mapping Information






### Schema Source


* from schema: https://open-and-sustainable.github.io/revaise-model/schema




## Mappings

| Mapping Type | Mapped Value |
| ---  | ---  |
| self | revaise:SearchStage |
| native | revaise:SearchStage |






## LinkML Source

<!-- TODO: investigate https://stackoverflow.com/questions/37606292/how-to-create-tabbed-code-blocks-in-mkdocs-or-sphinx -->

### Direct

<details>
```yaml
name: SearchStage
description: Executing literature search strategies.
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
is_a: StageExecution
slots:
- databases
- search_queries
- result_collections
slot_usage:
  databases:
    name: databases
    description: Databases used for literature search
    range: Database
    multivalued: true
  search_queries:
    name: search_queries
    description: Search queries executed
    range: SearchQuery
    multivalued: true
  result_collections:
    name: result_collections
    description: Collections of literature records resulting from searches
    range: LiteratureRecordCollection
    multivalued: true

```
</details>

### Induced

<details>
```yaml
name: SearchStage
description: Executing literature search strategies.
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
is_a: StageExecution
slot_usage:
  databases:
    name: databases
    description: Databases used for literature search
    range: Database
    multivalued: true
  search_queries:
    name: search_queries
    description: Search queries executed
    range: SearchQuery
    multivalued: true
  result_collections:
    name: result_collections
    description: Collections of literature records resulting from searches
    range: LiteratureRecordCollection
    multivalued: true
attributes:
  databases:
    name: databases
    description: Databases used for literature search
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: databases
    owner: SearchStage
    domain_of:
    - SearchStage
    range: Database
    multivalued: true
  search_queries:
    name: search_queries
    description: Search queries executed
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: search_queries
    owner: SearchStage
    domain_of:
    - SearchStage
    range: SearchQuery
    multivalued: true
  result_collections:
    name: result_collections
    description: Collections of literature records resulting from searches
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: result_collections
    owner: SearchStage
    domain_of:
    - SearchStage
    range: LiteratureRecordCollection
    multivalued: true
  stage_type:
    name: stage_type
    description: Type of stage being executed
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: stage_type
    owner: SearchStage
    domain_of:
    - StageExecution
    range: StageType
    required: true
  stage_label:
    name: stage_label
    description: Human-readable label for this stage execution
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: stage_label
    owner: SearchStage
    domain_of:
    - StageExecution
    range: string
  stage_description:
    name: stage_description
    description: Description of what was done in this stage
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: stage_description
    owner: SearchStage
    domain_of:
    - StageExecution
    range: string
  started_at:
    name: started_at
    description: When this stage started
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: started_at
    owner: SearchStage
    domain_of:
    - StageExecution
    range: datetime
  ended_at:
    name: ended_at
    description: When this stage ended
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: ended_at
    owner: SearchStage
    domain_of:
    - StageExecution
    range: datetime
  inputs:
    name: inputs
    description: Input artifacts for this stage
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: inputs
    owner: SearchStage
    domain_of:
    - StageExecution
    range: StageOutput
    multivalued: true
  outputs:
    name: outputs
    description: Output artifacts produced by this stage
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: outputs
    owner: SearchStage
    domain_of:
    - StageExecution
    range: StageOutput
    multivalued: true
  cost:
    name: cost
    description: Estimated cost of this stage
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: cost
    owner: SearchStage
    domain_of:
    - StageExecution
    range: float
    minimum_value: 0

```
</details>