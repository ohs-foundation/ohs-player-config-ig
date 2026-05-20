Instance: PatientMedicationState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "patientMedication"
* from = #revIncluded
* resource = "MedicationRequest"
* view = "Medication"
* joins[0].view = "PatientSummary"
* joins[0].from = #included
* joins[0].resource = "Patient"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "medPatientRef"
