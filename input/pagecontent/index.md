# OHS Player Configuration IG

This Implementation Guide defines the FHIR artifacts the **OHS Player** uses to render clinical data in its UI. It separates three concerns so that the same underlying data can be styled and composed differently per deployment:

1. **View Definitions** - declarative, SQL-on-FHIR–style projections that turn FHIR resources (`Patient`, `MedicationStatement`, `Group`, …) into the flat state objects a UI component consumes.
2. **View Configurations** - styling parameters (padding, elevation, corner radius, font size, …) that control how a component is drawn, independent of its data.
3. **Dashboard State Manifests** - compositions that bind a set of view states together to form a screen (e.g. an IPS dashboard or a household dashboard).

A registry CodeSystem (`view-type-codesystem`) enumerates the UI component factories the player knows how to instantiate.

## Artifacts

### Logical models

| Model | Purpose |
| --- | --- |
| [ViewDefinition](StructureDefinition-ViewDefinition.html) | Shape of a SQL-on-FHIR view: `resource`, `select.column[*]` |
| [ViewConfig](StructureDefinition-ViewConfig.html) | Abstract styling base (padding) |
| [CardConfig](StructureDefinition-CardConfig.html) | Card styling - elevation, corner radius |
| [TextConfig](StructureDefinition-TextConfig.html) | Text styling - size, weight |
| [HouseholdDashboardState](StructureDefinition-HouseholdDashboardState.html) | Manifest binding a household summary to its members |
| [IpsDashboardState](StructureDefinition-IpsDashboardState.html) | Manifest binding a patient header to medications |

### Example view definitions

| View | Source resource | What it projects |
| --- | --- | --- |
| [PatientHeaderView](Binary-PatientHeaderView.html) | `Patient` | `patientId`, `familyName` |
| [MedicationItemView](Binary-MedicationItemView.html) | `MedicationStatement` | `medName`, `status` |
| [HouseholdSummaryView](Binary-HouseholdSummaryView.html) | `Group` | `householdName`, `memberCount` |
| [MemberItemView](Binary-MemberItemView.html) | `Patient` | `fullName`, `memberId` |

### Code system

* [UI Component Types](CodeSystem-view-type-codesystem.html) - codes the player uses to look up component factories at runtime.