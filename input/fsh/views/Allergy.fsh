// ============================================================================
// Allergy / Intolerance ViewDefinition
//
// Extracts an allergy summary from a FHIR R4 AllergyIntolerance resource.
// allergyPatientRef is used as the matchKey in PatientAllergyMap to join
// back to PatientSummaryView.
// ============================================================================

Instance: Allergy
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/Allergy"
* name = "Allergy"
* status = #active
* resource = #AllergyIntolerance
* fhirVersion = #4.0.1
// -- Identity --
* select[0].column[0].name = "allergyId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Substance --
* select[0].column[1].name = "substance"
* select[0].column[1].path = "code.coding.display.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Severity & Status --
* select[0].column[2].name = "criticality"
* select[0].column[2].path = "criticality"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/code"
* select[0].column[3].name = "allergyStatus"
* select[0].column[3].path = "clinicalStatus.coding.code.first()"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- Patient reference (FK for ViewJoinMap matchKey) --
* select[0].column[4].name = "allergyPatientRef"
* select[0].column[4].path = "patient.reference.replace('Patient/', '')"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/string"
