Instance: HouseholdView
InstanceOf: ViewDefinition
Usage: #definition
* name = "HouseholdView"
* status = #active
* resource = #Group
* fhirVersion = #4.0.1
* select[0].column[0].name = "householdName"
* select[0].column[0].path = "name"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"