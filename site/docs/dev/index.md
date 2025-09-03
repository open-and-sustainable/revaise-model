# revaise

RevAIse — open standard for describing, sharing, and reproducing AI-supported systematic reviews, organized by stages.

URI: https://open-and-sustainable.github.io/revaise-model/schema

Name: revaise



## Classes

| Class | Description |
| --- | --- |
| [Affiliation](Affiliation.md) | Institutional affiliation |
| [Author](Author.md) | Author of a review or publication |
| [Database](Database.md) | Information about a database used for searching |
| [DatasetRef](DatasetRef.md) | External dataset reference |
| [FundingSource](FundingSource.md) | Source of funding for the review |
| [LiteratureRecord](LiteratureRecord.md) | A literature record representing a publication that persists across review st... |
| [LiteratureRecordCollection](LiteratureRecordCollection.md) | A collection of literature records |
| [Protocol](Protocol.md) | Scoping and registration details of the review |
| [Review](Review.md) | Root container for a systematic review |
| [SearchQuery](SearchQuery.md) | Search query executed against a database |
| [SoftwareEnv](SoftwareEnv.md) | Software environment configuration |
| [StageExecution](StageExecution.md) | Base class for executing a specific stage of the review |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ScreeningStage](ScreeningStage.md) | Screening of titles and abstracts |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SearchStage](SearchStage.md) | Executing literature search strategies |
| [StageOutput](StageOutput.md) | Output file or log produced by a review stage (results, logs, code, visualiza... |
| [StageOutputRef](StageOutputRef.md) | Reference to a stage output in this or another RevAIse bundle |



## Slots

| Slot | Description |
| --- | --- |
| [abstract](abstract.md) |  |
| [access_date](access_date.md) |  |
| [address](address.md) |  |
| [affiliations](affiliations.md) |  |
| [authors](authors.md) |  |
| [checksum](checksum.md) | Checksum of the output file |
| [city](city.md) |  |
| [collection_created_at](collection_created_at.md) |  |
| [collection_description](collection_description.md) |  |
| [collection_id](collection_id.md) |  |
| [collection_name](collection_name.md) |  |
| [completion_date](completion_date.md) |  |
| [conflicts_of_interest](conflicts_of_interest.md) |  |
| [containers](containers.md) | Container images used |
| [corresponding_author](corresponding_author.md) |  |
| [cost](cost.md) | Estimated cost |
| [country](country.md) |  |
| [created_at](created_at.md) |  |
| [database_name](database_name.md) |  |
| [database_notes](database_notes.md) |  |
| [database_url](database_url.md) |  |
| [database_version](database_version.md) |  |
| [databases](databases.md) |  |
| [dataset_name](dataset_name.md) | Name of the dataset |
| [department](department.md) |  |
| [doi](doi.md) |  |
| [eligibility_criteria](eligibility_criteria.md) | Inclusion and exclusion criteria |
| [email](email.md) |  |
| [ended_at](ended_at.md) | End time |
| [ethical_approval](ethical_approval.md) |  |
| [family_name](family_name.md) |  |
| [format](format.md) | File format or MIME type |
| [full_text_url](full_text_url.md) |  |
| [funder_id](funder_id.md) |  |
| [funder_name](funder_name.md) |  |
| [funding_sources](funding_sources.md) |  |
| [given_name](given_name.md) |  |
| [grant_number](grant_number.md) |  |
| [inputs](inputs.md) | Input artifacts |
| [institution_name](institution_name.md) |  |
| [issue](issue.md) |  |
| [journal](journal.md) |  |
| [keywords](keywords.md) |  |
| [kind](kind.md) | Kind or type of stage output |
| [last_updated](last_updated.md) |  |
| [license](license.md) | License governing the dataset |
| [literature_records](literature_records.md) |  |
| [lockfiles](lockfiles.md) | Environment lockfiles |
| [name](name.md) |  |
| [notes](notes.md) | Additional notes |
| [orcid](orcid.md) |  |
| [os](os.md) | Operating system description |
| [output_created_at](output_created_at.md) | Creation timestamp |
| [output_label](output_label.md) | Human-readable label |
| [outputs](outputs.md) | Output artifacts |
| [pages](pages.md) |  |
| [picos](picos.md) | Population, Intervention, Comparison, Outcomes, Study design details |
| [pmid](pmid.md) |  |
| [protocol](protocol.md) |  |
| [protocol_start_date](protocol_start_date.md) | Protocol registration date |
| [publication_language](publication_language.md) |  |
| [publication_type](publication_type.md) |  |
| [publication_year](publication_year.md) |  |
| [python_version](python_version.md) | Python version |
| [query_date](query_date.md) |  |
| [query_filters](query_filters.md) |  |
| [query_id](query_id.md) |  |
| [query_notes](query_notes.md) |  |
| [query_string](query_string.md) |  |
| [r_version](r_version.md) | R version |
| [record_count](record_count.md) |  |
| [record_created_at](record_created_at.md) |  |
| [record_id](record_id.md) |  |
| [record_updated_at](record_updated_at.md) |  |
| [records](records.md) |  |
| [registration_id](registration_id.md) | Identifier assigned by the registry |
| [registration_url](registration_url.md) | URL to the registry entry |
| [registry](registry.md) | Registry where the protocol is recorded |
| [research_question](research_question.md) | Primary research question |
| [resource_uri](resource_uri.md) | URI locating the resource |
| [result_collection_id](result_collection_id.md) |  |
| [result_collections](result_collections.md) |  |
| [results_count](results_count.md) |  |
| [review_abstract](review_abstract.md) |  |
| [review_authors](review_authors.md) |  |
| [review_country](review_country.md) |  |
| [review_id](review_id.md) |  |
| [review_keywords](review_keywords.md) |  |
| [review_language](review_language.md) |  |
| [review_status](review_status.md) |  |
| [review_title](review_title.md) |  |
| [review_type](review_type.md) |  |
| [ror_id](ror_id.md) |  |
| [search_queries](search_queries.md) |  |
| [snapshot_hash](snapshot_hash.md) | Checksum of the dataset snapshot |
| [software_env](software_env.md) |  |
| [stage_description](stage_description.md) | Detailed description |
| [stage_label](stage_label.md) | Human-readable label |
| [stage_outputs](stage_outputs.md) |  |
| [stage_type](stage_type.md) | Type of stage executed |
| [stages](stages.md) |  |
| [start_date](start_date.md) |  |
| [started_at](started_at.md) | Start time |
| [title](title.md) |  |
| [updated_at](updated_at.md) |  |
| [version](version.md) |  |
| [volume](volume.md) |  |


## Enumerations

| Enumeration | Description |
| --- | --- |
| [DatasetKind](DatasetKind.md) |  |
| [ReviewStatus](ReviewStatus.md) | Status of the review |
| [ReviewType](ReviewType.md) | Types of reviews |
| [StageOutputKind](StageOutputKind.md) |  |
| [StageType](StageType.md) | Logical stages of a systematic review (typical flow) |


## Types

| Type | Description |
| --- | --- |
| [Boolean](Boolean.md) | A binary (true or false) value |
| [Curie](Curie.md) | a compact URI |
| [Date](Date.md) | a date (year, month and day) in an idealized calendar |
| [DateOrDatetime](DateOrDatetime.md) | Either a date or a datetime |
| [Datetime](Datetime.md) | The combination of a date and time |
| [Decimal](Decimal.md) | A real number with arbitrary precision that conforms to the xsd:decimal speci... |
| [Double](Double.md) | A real number that conforms to the xsd:double specification |
| [Float](Float.md) | A real number that conforms to the xsd:float specification |
| [Integer](Integer.md) | An integer |
| [Jsonpath](Jsonpath.md) | A string encoding a JSON Path |
| [Jsonpointer](Jsonpointer.md) | A string encoding a JSON Pointer |
| [Ncname](Ncname.md) | Prefix part of CURIE |
| [Nodeidentifier](Nodeidentifier.md) | A URI, CURIE or BNODE that represents a node in a model |
| [Objectidentifier](Objectidentifier.md) | A URI or CURIE that represents an object in the model |
| [Sparqlpath](Sparqlpath.md) | A string encoding a SPARQL Property Path |
| [String](String.md) | A character string |
| [Time](Time.md) | A time object represents a (local) time of day, independent of any particular... |
| [Uri](Uri.md) | a complete URI |
| [Uriorcurie](Uriorcurie.md) | a URI or a CURIE |


## Subsets

| Subset | Description |
| --- | --- |
