// ============================================================================
// View Type CodeSystem — EXAMPLE vocabulary.
//
// View types are a CodeSystem the IMPLEMENTER provides; this IG does not fix
// the codes. The codes below are an example so docs and examples resolve. A
// real player ships its own view-type CodeSystem (delivered as a Binary), and
// its ViewConfigs bind to those codes.
// ============================================================================

CodeSystem: ViewTypeCS
Id: view-type-codesystem
Title: "UI Component Types (example)"
Description: """
**Example** vocabulary of view types. Each code names a kind of UI component used to render a piece of
FHIR-derived data; a ViewConfig binds to one of these codes to select its component. View types are
implementer-defined — a player provides its own CodeSystem rather than reusing these codes. The mapping
from a code to a concrete renderer is the player's own implementation detail.
"""
* #PatientCard         "Patient Summary List Card"
* #PatientHeader       "Patient Detail Header Section"
* #AllergyItem         "Allergy / Intolerance Row Item"
* #MedicationItem      "Medication Row Item"
* #ConditionItem       "Condition / Problem Row Item"
* #ImmunizationItem    "Immunization Row Item"
* #SectionCard         "Section Wrapper with Title and Count Badge"
* #GroupCard           "Household List Card"
* #GroupHeader         "Household Profile Header"
* #MemberItem          "Household Member Row"
* #ContactItem         "Emergency Contact Row"
* #TelecomItem         "Telecom Entry Row"
* #AllergyReactionItem "Allergy Reaction Row"

ValueSet: ViewTypeVS
Id: view-type-vs
Title: "View Type ValueSet"
Description: "All view type codes a ViewConfig may bind to."
* codes from system ViewTypeCS
