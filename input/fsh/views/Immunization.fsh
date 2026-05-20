// ============================================================================
// Immunization ViewDefinition
//
// Extracts an immunization record from a FHIR R4 Immunization resource.
// occurrenceDate uses dateTime to support the FHIR dateTime partial-date range.
// ============================================================================

Instance: Immunization
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/Immunization"
* name = "Immunization"
* status = #active
* resource = #Immunization
* fhirVersion = #4.0.1
// -- Identity --
* select[0].column[0].name = "immunizationId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Vaccine --
* select[0].column[1].name = "vaccineName"
* select[0].column[1].path = "vaccineCode.coding.display.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Administration date --
* select[0].column[2].name = "occurrenceDate"
* select[0].column[2].path = "occurrence.ofType(dateTime)"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/dateTime"
// -- Status --
* select[0].column[3].name = "immunizationStatus"
* select[0].column[3].path = "status"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/code"
// -- Patient reference (FK for ViewJoinMap matchKey) --
* select[0].column[4].name = "immunizationPatientRef"
* select[0].column[4].path = "patient.reference.replace('Patient/', '')"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/string"
