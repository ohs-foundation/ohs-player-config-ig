// ============================================================================
// AllergyReaction ViewDefinition
//
// Extracts one row per reaction entry on an AllergyIntolerance resource.
// The top-level where clause restricts to active allergies only.
// select[0] contributes anchor columns from the root resource.
// select[1] uses forEach to expand each reaction into its own output row.
// allergyPatientRef is used as the matchKey in AllergyReactionState.
// ============================================================================

Instance: AllergyReaction
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/AllergyReaction"
* name = "AllergyReaction"
* status = #active
* resource = #AllergyIntolerance
* fhirVersion = #4.0.1
// -- Filter: active allergies only --
* where[0].path = "clinicalStatus.coding.where(system = 'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical').code = 'active'"
// -- Anchor columns (evaluated once per AllergyIntolerance) --
* select[0].column[0].name = "allergyId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[1].name = "substance"
* select[0].column[1].path = "code.coding.display.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[2].name = "criticality"
* select[0].column[2].path = "criticality"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/code"
* select[0].column[3].name = "allergyPatientRef"
* select[0].column[3].path = "patient.reference.replace('Patient/', '')"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- forEach: one row per reaction entry --
* select[1].forEach = "reaction"
* select[1].column[0].name = "severity"
* select[1].column[0].path = "severity"
* select[1].column[0].type = "http://hl7.org/fhir/StructureDefinition/code"
* select[1].column[1].name = "manifestation"
* select[1].column[1].path = "manifestation.coding.display.first()"
* select[1].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
