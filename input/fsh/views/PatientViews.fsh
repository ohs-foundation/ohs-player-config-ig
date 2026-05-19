Instance: MemberView
InstanceOf: ViewDefinition
Usage: #definition
* name = "MemberView"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
* select[0].column[0].name = "memberName"
* select[0].column[0].path = "name.family.first()"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[1].name = "patientId"
* select[0].column[1].path = "id"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"