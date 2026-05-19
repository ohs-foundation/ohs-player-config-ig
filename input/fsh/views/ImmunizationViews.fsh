Instance: VaccineView
InstanceOf: ViewDefinition
Usage: #definition
* name = "VaccineView"
* status = #active
* resource = #Immunization
* fhirVersion = #4.0.1
* select[0].column[0].name = "vaccineName"
* select[0].column[0].path = "vaccineCode.text"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[1].name = "vaccineDate"
* select[0].column[1].path = "occurrence.as(dateTime)"
* select[0].column[1].type = "http://hl7.org/fhir/StructureDefinition/dateTime"
* select[0].column[2].name = "targetId"
* select[0].column[2].path = "patient.reference.replace('Patient/', '')"
* select[0].column[2].type = "http://hl7.org/fhir/StructureDefinition/string"