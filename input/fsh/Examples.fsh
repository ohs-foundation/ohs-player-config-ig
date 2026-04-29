// Example instances for every logical model defined by this IG.
// Definitions live in their respective FSH files; this file holds illustrative
// data only. All instances use Usage: #example so the publisher renders them
// on each StructureDefinition's Examples tab.

// ─────────── ViewConfig (abstract base) ───────────
Instance: ExampleViewConfigMinimal
InstanceOf: ViewConfig
Usage: #example
Title: "Minimal View Config"
Description: "Smallest valid ViewConfig — just default padding."
* padding = 8

// ─────────── CardConfig ───────────
Instance: ExampleCardDefault
InstanceOf: CardConfig
Usage: #example
Title: "Default Card"
Description: "Flat card with standard padding and minimal corner rounding."
* padding = 12
* elevation = 0
* cornerRadius = 4

Instance: ExampleCardElevated
InstanceOf: CardConfig
Usage: #example
Title: "Elevated Card"
Description: "Raised card with prominent shadow and rounded corners."
* padding = 16
* elevation = 6
* cornerRadius = 12

// ─────────── TextConfig ───────────
Instance: ExampleTextHeading
InstanceOf: TextConfig
Usage: #example
Title: "Heading Text"
Description: "Bold, large text used for screen and section headings."
* padding = 8
* textSize = 22
* fontWeight = "Bold"

Instance: ExampleTextBody
InstanceOf: TextConfig
Usage: #example
Title: "Body Text"
Description: "Standard-weight text used for paragraph and list content."
* padding = 4
* textSize = 14
* fontWeight = "Normal"

// ─────────── ViewDefinition (illustrative example) ───────────
Instance: ExampleVitalSignsView
InstanceOf: ViewDefinition
Usage: #example
Title: "Example Vital Signs View Definition"
Description: "Illustrates the shape of a ViewDefinition — projects Observation into a flat row of code/value/unit."
* url = "http://ohs.dev/ViewDefinition/ExampleVitalSignsView"
* name = "ExampleVitalSignsState"
* status = #active
* resource = #Observation
* fhirVersion = #4.0.1
* select.column[0].name = "code"
* select.column[0].path = "code.coding.first().display"
* select.column[1].name = "value"
* select.column[1].path = "value.as(Quantity).value"
* select.column[2].name = "unit"
* select.column[2].path = "value.as(Quantity).unit"

// ─────────── HouseholdDashboardState ───────────
Instance: ExampleHouseholdDashboardState
InstanceOf: HouseholdDashboardState
Usage: #example
Title: "Example Household Dashboard"
Description: "A populated household dashboard referencing the canonical household-summary and member-item view definitions."
* summary = "http://ohs.dev/ViewDefinition/HouseholdSummaryView"
* members[0] = "http://ohs.dev/ViewDefinition/MemberItemView"

// ─────────── IpsDashboardState ───────────
Instance: ExampleIpsDashboardState
InstanceOf: IpsDashboardState
Usage: #example
Title: "Example IPS Dashboard"
Description: "A populated IPS dashboard referencing the patient header and medication item view definitions."
* header = "http://ohs.dev/ViewDefinition/PatientHeaderView"
* medications[0] = "http://ohs.dev/ViewDefinition/MedicationItemView"
