# Artifacts Summary - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [View Configuration](StructureDefinition-ViewConfig.md) | A self-describing UI configuration bound to a view type.`ViewConfig` is the contract for declaring a config — it does **not** fix any particular config's fields. An implementer provides a config as a `ViewConfig` Binary that lists its own `property` entries; each property gives a field `name`, its `type`, and a default `value`. A player generates a typed config class from the property list and binds the values to the renderer selected by `viewType`. |
| [View Join Map](StructureDefinition-ViewJoinMap.md) | A metadata guide that stitches atomic ViewDefinitions sourced from different SearchResult scopes into a single flat JSON row per pivot resource.The pivot resource drives the output row count (one row per pivot instance). Each join appends its ViewDefinition's columns to the same row. All column names across the pivot and all joins must be unique within this map. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Search Scope ValueSet](ValueSet-search-scope-vs.md) | All valid search scope codes. |
| [View Type ValueSet](ValueSet-view-type-vs.md) | All view type codes a ViewConfig may bind to. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Search Scope CodeSystem](CodeSystem-search-scope-cs.md) | Valid locations within a FHIR Search Result where resources are found. Used by ViewJoinMap to specify where to look for pivot and joined resources. |
| [UI Component Types (example)](CodeSystem-view-type-codesystem.md) | **Example** vocabulary of view types. Each code names a kind of UI component used to render a piece of FHIR-derived data; a ViewConfig binds to one of these codes to select its component. View types are implementer-defined — a player provides its own CodeSystem rather than reusing these codes. The mapping from a code to a concrete renderer is the player's own implementation detail. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Allergy](Binary-Allergy.md) |  |
| [AllergyReaction](Binary-AllergyReaction.md) |  |
| [AllergyReactionState](Binary-AllergyReactionState.md) |  |
| [Example: GroupCard config](Binary-GroupCardConfigExample.md) | Example runtime ViewConfig for a GroupCard component. |
| [Example: PatientHeader config](Binary-PatientHeaderConfigExample.md) | Example runtime ViewConfig for a PatientHeader component. |
| [GroupMemberState](Binary-GroupMemberState.md) |  |
| [Member](Binary-Member.md) |  |
| [PatientAllergyState](Binary-PatientAllergyState.md) |  |
| [PatientContact](Binary-PatientContact.md) |  |
| [PatientContactState](Binary-PatientContactState.md) |  |
| [PatientSummary](Binary-PatientSummary.md) |  |
| [PatientSummaryState](Binary-PatientSummaryState.md) |  |
| [PatientTelecom](Binary-PatientTelecom.md) |  |
| [PatientTelecomState](Binary-PatientTelecomState.md) |  |
| [RelatedPerson](Binary-RelatedPerson.md) |  |

