Instance: PatientImmunizationState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "patientImmunization"
* from = #revIncluded
* resource = "Immunization"
* view = "Immunization"
* joins[0].view = "PatientSummary"
* joins[0].from = #included
* joins[0].resource = "Patient"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "immunizationPatientRef"
