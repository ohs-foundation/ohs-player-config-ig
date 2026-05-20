// ============================================================================
// Patient ViewDefinition
//
// Extracts a flat patient summary projection from a FHIR R4 Patient resource.
// Column names are prefixed to stay unique across all IPS ViewJoinMaps.
// ============================================================================

Instance: PatientSummary
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/PatientSummary"
* name = "PatientSummary"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
// -- Identity --
* select[0].column[0].name = "patientId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Name --
* select[0].column[1].name = "familyName"
* select[0].column[1].path = "name.family.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[2].name = "givenName"
* select[0].column[2].path = "name.given.first()"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Demographics --
* select[0].column[3].name = "gender"
* select[0].column[3].path = "gender"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/code"
* select[0].column[4].name = "birthDate"
* select[0].column[4].path = "birthDate"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/date"
* select[0].column[5].name = "active"
* select[0].column[5].path = "active"
* select[0].column[5].type = "http://hl7.org/fhir/StructureDefinition/boolean"
// -- Identifiers --
* select[0].column[6].name = "mrn"
* select[0].column[6].path = "identifier.where(type.coding.code = 'MR').value.first()"
* select[0].column[6].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Contact --
* select[0].column[7].name = "phone"
* select[0].column[7].path = "telecom.where(system = 'phone').value.first()"
* select[0].column[7].type = "http://hl7.org/fhir/StructureDefinition/string"
