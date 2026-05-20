// ============================================================================
// Medication ViewDefinition
//
// Extracts a medication summary from a FHIR R4 MedicationRequest resource.
// medPatientRef is prefixed to stay unique across IPS ViewJoinMaps.
// ============================================================================

Instance: Medication
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/Medication"
* name = "Medication"
* status = #active
* resource = #MedicationRequest
* fhirVersion = #4.0.1
// -- Identity --
* select[0].column[0].name = "medicationId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Medication --
* select[0].column[1].name = "medicationName"
* select[0].column[1].path = "medication.coding.display.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Dosage --
* select[0].column[2].name = "dosage"
* select[0].column[2].path = "dosageInstruction.text.first()"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Status --
* select[0].column[3].name = "medStatus"
* select[0].column[3].path = "status"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/code"
// -- Patient reference (FK for ViewJoinMap matchKey) --
* select[0].column[4].name = "medPatientRef"
* select[0].column[4].path = "subject.reference.replace('Patient/', '')"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/string"
