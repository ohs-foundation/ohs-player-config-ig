Instance: AllergyReactionState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "allergyReaction"
* from = #revIncluded
* resource = "AllergyIntolerance"
* view = "AllergyReaction"
* joins[0].view = "PatientSummary"
* joins[0].from = #included
* joins[0].resource = "Patient"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "allergyPatientRef"
