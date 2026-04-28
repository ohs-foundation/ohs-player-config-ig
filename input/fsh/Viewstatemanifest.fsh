// Household Dashboard State Logical Model
Logical: HouseholdDashboardState
Id: HouseholdDashboardState
Title: "Household Dashboard State"
* summary 0..1 canonical "HouseholdSummaryState"
* members 0..* canonical "MemberItemState"

// IPS Dashboard State Logical Model
Logical: IpsDashboardState
Id: IpsDashboardState
Title: "IPS Dashboard State"
* header 0..1 canonical "PatientHeaderState"
* medications 0..* canonical "MedicationItemState"
