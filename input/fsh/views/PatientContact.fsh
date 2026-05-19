// ============================================================================
// PatientContact ViewDefinition
//
// Extracts one row per emergency contact on a Patient resource.
// forEachOrNull ensures a row is always emitted for every patient — even when
// no contacts are recorded — so downstream joins are never silently dropped.
// select[0] contributes the patient anchor columns.
// select[1] uses forEachOrNull to expand contacts (null row when list is empty).
// ============================================================================

Instance: PatientContact
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/PatientContact"
* name = "PatientContact"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
// -- Anchor columns --
* select[0].column[0].name = "patientId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- forEachOrNull: one row per contact, or one null row if no contacts --
* select[1].forEachOrNull = "contact"
* select[1].column[0].name = "contactGivenName"
* select[1].column[0].path = "name.given.first()"
* select[1].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[1].column[1].name = "contactFamilyName"
* select[1].column[1].path = "name.family"
* select[1].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[1].column[2].name = "contactPhone"
* select[1].column[2].path = "telecom.where(system = 'phone').value.first()"
* select[1].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[1].column[3].name = "contactRelationship"
* select[1].column[3].path = "relationship.coding.display.first()"
* select[1].column[3].type = "http://hl7.org/fhir/StructureDefinition/string"
