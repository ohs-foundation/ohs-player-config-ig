# Artifacts Summary - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [Allergy Item Configuration](StructureDefinition-AllergyItemConfig.md) | Configuration for the AllergyItem component rendered inside the Allergies section. |
| [Allergy Reaction Item Configuration](StructureDefinition-AllergyReactionItemConfig.md) | Configuration for the AllergyReactionItem component rendered inside the Allergy Reactions section. |
| [Base UI Configuration](StructureDefinition-ViewConfig.md) | Abstract base for all UI component styling configurations. Subclasses inherit its padding field via the ig-codegen parent-chain flattening. |
| [Card Configuration](StructureDefinition-CardConfig.md) | Base configuration for Card-based UI components. Inherits padding from ViewConfig. |
| [Condition Item Configuration](StructureDefinition-ConditionItemConfig.md) | Configuration for the ConditionItem component rendered inside the Conditions section. |
| [Contact Item Configuration](StructureDefinition-ContactItemConfig.md) | Configuration for the ContactItem component rendered inside the Contacts section. |
| [Group Card Configuration](StructureDefinition-GroupCardConfig.md) | Configuration for the GroupCard component rendered in the household list screen. Controls which household fields are visible on the card. |
| [Group Header Configuration](StructureDefinition-GroupHeaderConfig.md) | Configuration for the GroupHeader component shown at the top of the household profile screen. Controls which household and head-of-household fields are visible. |
| [Immunization Item Configuration](StructureDefinition-ImmunizationItemConfig.md) | Configuration for the ImmunizationItem component rendered inside the Immunizations section. |
| [Medication Item Configuration](StructureDefinition-MedicationItemConfig.md) | Configuration for the MedicationItem component rendered inside the Medications section. |
| [Member Item Configuration](StructureDefinition-MemberItemConfig.md) | Configuration for the MemberItem component rendered in the household member list. Controls which demographic fields are visible for each member row. |
| [Patient Card Configuration](StructureDefinition-PatientCardConfig.md) | Configuration for the PatientCard component rendered in the patient list screen. Controls which demographic fields are visible on the card. |
| [Patient Header Configuration](StructureDefinition-PatientHeaderConfig.md) | Configuration for the PatientHeader component shown at the top of the patient IPS summary screen. Controls which demographic fields appear in the header. |
| [Section Card Configuration](StructureDefinition-SectionCardConfig.md) | Configuration for the SectionCard wrapper component that groups related items under a titled card with an optional item count badge. |
| [Telecom Item Configuration](StructureDefinition-TelecomItemConfig.md) | Configuration for the TelecomItem component rendered inside the Contact Information section. |
| [View Join Map](StructureDefinition-ViewJoinMap.md) | A metadata guide that stitches atomic ViewDefinitions sourced from different SearchResult scopes into a single flat JSON row per pivot resource.The pivot resource drives the output row count (one row per pivot instance). Each join appends its ViewDefinition's columns to the same row. All column names across the pivot and all joins must be unique within this map. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Search Scope ValueSet](ValueSet-search-scope-vs.md) | All valid search scope codes. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Search Scope CodeSystem](CodeSystem-search-scope-cs.md) | Valid locations within a FHIR Search Result where resources are found. Used by ViewJoinMap to specify where to look for pivot and joined resources. |
| [UI Component Types](CodeSystem-view-type-codesystem.md) | Formal codes for identifying UI component factories in the KMP ViewRegistry. Each code maps to a registered ComponentRenderer that knows how to render a specific FHIR-derived view state on screen. |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [Allergy](Binary-Allergy.md) |
| [AllergyReaction](Binary-AllergyReaction.md) |
| [AllergyReactionState](Binary-AllergyReactionState.md) |
| [Condition](Binary-Condition.md) |
| [Group](Binary-Group.md) |
| [GroupHeaderState](Binary-GroupHeaderState.md) |
| [GroupListState](Binary-GroupListState.md) |
| [GroupMemberState](Binary-GroupMemberState.md) |
| [Immunization](Binary-Immunization.md) |
| [Medication](Binary-Medication.md) |
| [Member](Binary-Member.md) |
| [PatientAllergyState](Binary-PatientAllergyState.md) |
| [PatientConditionState](Binary-PatientConditionState.md) |
| [PatientContact](Binary-PatientContact.md) |
| [PatientContactState](Binary-PatientContactState.md) |
| [PatientImmunizationState](Binary-PatientImmunizationState.md) |
| [PatientMedicationState](Binary-PatientMedicationState.md) |
| [PatientSummary](Binary-PatientSummary.md) |
| [PatientSummaryState](Binary-PatientSummaryState.md) |
| [PatientTelecom](Binary-PatientTelecom.md) |
| [PatientTelecomState](Binary-PatientTelecomState.md) |
| [RelatedPerson](Binary-RelatedPerson.md) |

