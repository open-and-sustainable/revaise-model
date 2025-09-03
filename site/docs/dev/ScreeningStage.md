

# Class: ScreeningStage 


_Screening of titles and abstracts._





URI: [revaise:ScreeningStage](https://open-and-sustainable.github.io/revaise-model/schema/ScreeningStage)





```mermaid
 classDiagram
    class ScreeningStage
    click ScreeningStage href "../ScreeningStage/"
      StageExecution <|-- ScreeningStage
        click StageExecution href "../StageExecution/"
      
      ScreeningStage : cost
        
      ScreeningStage : ended_at
        
      ScreeningStage : inputs
        
          
    
        
        
        ScreeningStage --> "*" StageOutput : inputs
        click StageOutput href "../StageOutput/"
    

        
      ScreeningStage : outputs
        
          
    
        
        
        ScreeningStage --> "*" StageOutput : outputs
        click StageOutput href "../StageOutput/"
    

        
      ScreeningStage : stage_description
        
      ScreeningStage : stage_label
        
      ScreeningStage : stage_type
        
          
    
        
        
        ScreeningStage --> "1" StageType : stage_type
        click StageType href "../StageType/"
    

        
      ScreeningStage : started_at
        
      
```





## Inheritance
* [StageExecution](StageExecution.md)
    * **ScreeningStage**



## Slots

| Name | Cardinality and Range | Description | Inheritance |
| ---  | --- | --- | --- |
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
| self | revaise:ScreeningStage |
| native | revaise:ScreeningStage |






## LinkML Source

<!-- TODO: investigate https://stackoverflow.com/questions/37606292/how-to-create-tabbed-code-blocks-in-mkdocs-or-sphinx -->

### Direct

<details>
```yaml
name: ScreeningStage
description: Screening of titles and abstracts.
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
is_a: StageExecution

```
</details>

### Induced

<details>
```yaml
name: ScreeningStage
description: Screening of titles and abstracts.
from_schema: https://open-and-sustainable.github.io/revaise-model/schema
is_a: StageExecution
attributes:
  stage_type:
    name: stage_type
    description: Type of stage being executed
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: stage_type
    owner: ScreeningStage
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
    owner: ScreeningStage
    domain_of:
    - StageExecution
    range: string
  stage_description:
    name: stage_description
    description: Description of what was done in this stage
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: stage_description
    owner: ScreeningStage
    domain_of:
    - StageExecution
    range: string
  started_at:
    name: started_at
    description: When this stage started
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: started_at
    owner: ScreeningStage
    domain_of:
    - StageExecution
    range: datetime
  ended_at:
    name: ended_at
    description: When this stage ended
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: ended_at
    owner: ScreeningStage
    domain_of:
    - StageExecution
    range: datetime
  inputs:
    name: inputs
    description: Input artifacts for this stage
    from_schema: https://open-and-sustainable.github.io/revaise-model/schema
    rank: 1000
    alias: inputs
    owner: ScreeningStage
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
    owner: ScreeningStage
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
    owner: ScreeningStage
    domain_of:
    - StageExecution
    range: float
    minimum_value: 0

```
</details>