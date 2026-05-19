// ============================================================================
// Condition ViewDefinition
//
// Extracts a condition / problem summary from a FHIR R4 Condition resource.
// onsetDate is typed as dateTime to support FhirDateTime partial dates.
// ============================================================================

Instance: Condition
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/Condition"
* name = "Condition"
* status = #active
* resource = #Condition
* fhirVersion = #4.0.1
// -- Identity --
* select[0].column[0].name = "conditionId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Condition --
* select[0].column[1].name = "conditionCode"
* select[0].column[1].path = "code.coding.display.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Onset (supports partial dates e.g. year-only via FhirDateTime) --
* select[0].column[2].name = "onsetDate"
* select[0].column[2].path = "onset.ofType(dateTime)"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/dateTime"
// -- Status --
* select[0].column[3].name = "conditionStatus"
* select[0].column[3].path = "clinicalStatus.coding.code.first()"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Patient reference (FK for ViewJoinMap matchKey) --
* select[0].column[4].name = "conditionPatientRef"
* select[0].column[4].path = "subject.reference.replace('Patient/', '')"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/string"
