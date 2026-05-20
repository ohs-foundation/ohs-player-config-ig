Instance: Group
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/Group"
* name = "Group"
* status = #active
* resource = #Group
* fhirVersion = #4.0.1
* select[0].column[0].name = "groupId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[1].name = "groupName"
* select[0].column[1].path = "name"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[2].name = "memberCount"
* select[0].column[2].path = "member.count().toString()"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"
