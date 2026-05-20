Instance: PatientConditionState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "patientCondition"
* from = #revIncluded
* resource = "Condition"
* view = "Condition"
* joins[0].view = "PatientSummary"
* joins[0].from = #included
* joins[0].resource = "Patient"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "conditionPatientRef"
