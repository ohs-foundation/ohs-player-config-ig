// ============================================================================
// View Type CodeSystem
// Formal codes identifying UI component factories in the KMP ViewRegistry.
// Each code corresponds to a registered ComponentRenderer in the application.
// ============================================================================

CodeSystem: ViewTypeCS
Id: view-type-codesystem
Title: "UI Component Types"
Description: """
Formal codes for identifying UI component factories in the KMP ViewRegistry.
Each code maps to a registered ComponentRenderer that knows how to render
a specific FHIR-derived view state on screen.
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
