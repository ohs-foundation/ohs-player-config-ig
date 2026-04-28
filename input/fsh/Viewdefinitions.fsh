// ViewDefinition instances for the OHS Sample IG
Instance: PatientHeaderView
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://example.org/ViewDefinition/PatientHeaderView"
* name = "PatientHeaderState"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
* select.column[0].name = "patientId"
* select.column[0].path = "id"
* select.column[1].name = "familyName"
* select.column[1].path = "name.family.first()"

// Scenario B: IPS Medication Item
Instance: MedicationItemView
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://example.org/ViewDefinition/MedicationItemView"
* name = "MedicationItemState"
* status = #active
* resource = #MedicationStatement
* fhirVersion = #4.0.1
* select.column[0].name = "medName"
* select.column[0].path = "medication.as(CodeableConcept).text"
* select.column[1].name = "status"
* select.column[1].path = "status"

// Scenario C: Household Summary
Instance: HouseholdSummaryView
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://example.org/ViewDefinition/HouseholdSummaryView"
* name = "HouseholdSummaryState"
* status = #active
* resource = #Group
* fhirVersion = #4.0.1
* select.column[0].name = "householdName"
* select.column[0].path = "name"
* select.column[1].name = "memberCount"
* select.column[1].path = "quantity"

// Scenario C: Group Member
Instance: MemberItemView
InstanceOf: ViewDefinition
Usage: #definition
* url = "http://example.org/ViewDefinition/MemberItemView"
* name = "MemberItemState"
* status = #active
* resource = #Patient
* fhirVersion = #4.0.1
* select.column[0].name = "fullName"
* select.column[0].path = "name.select(family.first() + ' ' + given.first())"
* select.column[1].name = "memberId"
* select.column[1].path = "id"
