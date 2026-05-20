Instance: Member
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://ohs.dev/ViewDefinition/Member"
* name = "Member"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
* select[0].column[0].name = "memberId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[1].name = "memberGivenName"
* select[0].column[1].path = "name.given.first()"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[2].name = "memberFamilyName"
* select[0].column[2].path = "name.family.first()"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[3].name = "memberGender"
* select[0].column[3].path = "gender"
* select[0].column[3].type = "http://hl7.org/fhir/StructureDefinition/code"
* select[0].column[4].name = "memberBirthDate"
* select[0].column[4].path = "birthDate"
* select[0].column[4].type = "http://hl7.org/fhir/StructureDefinition/date"
* select[0].column[5].name = "relatedPersonLink"
* select[0].column[5].path = "link.where(type = 'seealso').other.reference.replace('RelatedPerson/', '').first()"
* select[0].column[5].type = "http://hl7.org/fhir/StructureDefinition/string"
