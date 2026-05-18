Instance: HouseholdVaccinationMap
InstanceOf: ViewJoinMap
Usage: #definition
* name = "members" // This becomes the JSON key in your UI state
* from = #revIncluded
* resource = "Immunization"
* view = "VaccineView"

// Join the Patient to the Vaccine
* joins[0].view = "MemberView"
* joins[0].from = #included
* joins[0].matchKey = "targetId" // Match VaccineView.targetId -> MemberView.patientId

// Join the Group to every row for context
* joins[1].view = "HouseholdView"
* joins[1].from = #root