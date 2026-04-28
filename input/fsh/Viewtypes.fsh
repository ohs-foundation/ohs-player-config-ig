CodeSystem: ViewTypeCS
Id: view-type-codesystem
Title: "UI Component Types"
Description: "Formal codes for identifying UI component factories in the KMP Registry."
* #PatientHeader "Simple Patient Header"
* #MedicationItem "Individual Medication Item"
* #HouseholdSummary "Household/Group Summary Card"
* #MemberItem "Patient Member in a Group"
* #HouseholdDashboard "Comprehensive Household Dashboard"
* #IpsDashboard "Comprehensive IPS Dashboard"

// ViewDefinition Logical Model
Logical: ViewDefinition
Id: ViewDefinition
Title: "View Definition"
Description: "Defines a view for FHIR resources in UI components."
* url 1..1 uri "Canonical URL for the view definition"
* name 1..1 string "Name of the view state"
* status 1..1 code "Status of the view definition"
* resource 1..1 code "FHIR resource type"
* fhirVersion 1..1 code "FHIR version"
* select 0..* BackboneElement "Selection configuration"
  * column 0..* BackboneElement "Column definitions"
    * name 1..1 string "Column name"
    * path 1..1 string "FHIRPath expression for the column"