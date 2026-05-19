Instance: RelatedPerson
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/RelatedPerson"
* name = "RelatedPerson"
* status = #active
* resource = #RelatedPerson
* fhirVersion = #4.0.1
* select[0].column[0].name = "relatedPersonId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[1].name = "headGivenName"
* select[0].column[1].path = "name.given.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[2].name = "headFamilyName"
* select[0].column[2].path = "name.family.first()"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[3].name = "relationshipCode"
* select[0].column[3].path = "relationship.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode').code.first()"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/code"
* select[0].column[4].name = "relatedToPatientRef"
* select[0].column[4].path = "patient.reference.replace('Patient/', '')"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/string"
