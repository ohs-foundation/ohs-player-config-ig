// ============================================================================
// PatientTelecom ViewDefinition
//
// Extracts one row per telecom system (phone, email) for a Patient using
// unionAll. Each inner block targets one system and contributes the same
// column schema, producing one output row per telecom system that has a value.
// select[0] holds the anchor patient column.
// select[1] uses unionAll to union phone and email into separate rows.
// ============================================================================

Instance: PatientTelecom
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/PatientTelecom"
* name = "PatientTelecom"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
// -- Anchor columns --
* select[0].column[0].name = "patientId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- unionAll: phone block --
* select[1].unionAll[0].column[0].name = "telecomSystem"
* select[1].unionAll[0].column[0].path = "telecom.where(system = 'phone').system.first()"
* select[1].unionAll[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[1].unionAll[0].column[1].name = "telecomValue"
* select[1].unionAll[0].column[1].path = "telecom.where(system = 'phone').value.first()"
* select[1].unionAll[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
// -- unionAll: email block --
* select[1].unionAll[1].column[0].name = "telecomSystem"
* select[1].unionAll[1].column[0].path = "telecom.where(system = 'email').system.first()"
* select[1].unionAll[1].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[1].unionAll[1].column[1].name = "telecomValue"
* select[1].unionAll[1].column[1].path = "telecom.where(system = 'email').value.first()"
* select[1].unionAll[1].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
