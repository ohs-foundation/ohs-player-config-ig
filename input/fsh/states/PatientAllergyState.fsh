Instance: PatientAllergyState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "patientAllergy"
* from = #revIncluded
* resource = "AllergyIntolerance"
* view = "Allergy"
* joins[0].view = "PatientSummary"
* joins[0].from = #included
* joins[0].resource = "Patient"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "allergyPatientRef"
