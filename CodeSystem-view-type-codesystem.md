# UI Component Types (example) - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **UI Component Types (example)**

## CodeSystem: UI Component Types (example) 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/CodeSystem/view-type-codesystem | *Version*:0.1.0 |
| Draft as of 2026-06-09 | *Computable Name*:ViewTypeCS |

 
**Example** vocabulary of view types. Each code names a kind of UI component used to render a piece of FHIR-derived data; a ViewConfig binds to one of these codes to select its component. View types are implementer-defined — a player provides its own CodeSystem rather than reusing these codes. The mapping from a code to a concrete renderer is the player's own implementation detail. 

Each code in this system names a **view type** — a kind of UI component used to render a piece of FHIR-derived data. A [ViewConfig](StructureDefinition-ViewConfig.md) references one of these codes (via its `viewType` field) to declare which component it configures.

### How an OHS Player uses a view type

At runtime an OHS Player binds three things to produce a rendered view:

1. the**state**extracted from a SearchResult (see[ViewJoinMap](StructureDefinition-ViewJoinMap.md)and[ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition-ViewDefinition.html)),
1. the**view type**code, which selects the component, and
1. the**ViewConfig**for that view type, which tunes the component's appearance and behavior.

How an OHS Player maps a view-type code to a concrete renderer — a registry, a factory, a switch — is an implementation detail. This CodeSystem only fixes the shared vocabulary so configs and implementations agree on the same names. A different implementation can satisfy the same contract in its own way.

### Layout view types

Generic layout view types (e.g. vertical list, grid) that arrange a collection of items are typically owned by the OHS Player framework rather than declared here, since they are not data-specific.

 This Code system is referenced in the content logical definition of the following value sets: 

* [ViewTypeVS](ValueSet-view-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "view-type-codesystem",
  "url" : "http://ohs.dev/CodeSystem/view-type-codesystem",
  "version" : "0.1.0",
  "name" : "ViewTypeCS",
  "title" : "UI Component Types (example)",
  "status" : "draft",
  "date" : "2026-06-09T19:54:52+00:00",
  "publisher" : "OHS Foundation",
  "contact" : [{
    "name" : "OHS Foundation",
    "telecom" : [{
      "system" : "url",
      "value" : "http://ohs.dev/example-publisher"
    }]
  }],
  "description" : "**Example** vocabulary of view types. Each code names a kind of UI component used to render a piece of\nFHIR-derived data; a ViewConfig binds to one of these codes to select its component. View types are\nimplementer-defined — a player provides its own CodeSystem rather than reusing these codes. The mapping\nfrom a code to a concrete renderer is the player's own implementation detail.",
  "content" : "complete",
  "count" : 13,
  "concept" : [{
    "code" : "PatientCard",
    "display" : "Patient Summary List Card"
  },
  {
    "code" : "PatientHeader",
    "display" : "Patient Detail Header Section"
  },
  {
    "code" : "AllergyItem",
    "display" : "Allergy / Intolerance Row Item"
  },
  {
    "code" : "MedicationItem",
    "display" : "Medication Row Item"
  },
  {
    "code" : "ConditionItem",
    "display" : "Condition / Problem Row Item"
  },
  {
    "code" : "ImmunizationItem",
    "display" : "Immunization Row Item"
  },
  {
    "code" : "SectionCard",
    "display" : "Section Wrapper with Title and Count Badge"
  },
  {
    "code" : "GroupCard",
    "display" : "Household List Card"
  },
  {
    "code" : "GroupHeader",
    "display" : "Household Profile Header"
  },
  {
    "code" : "MemberItem",
    "display" : "Household Member Row"
  },
  {
    "code" : "ContactItem",
    "display" : "Emergency Contact Row"
  },
  {
    "code" : "TelecomItem",
    "display" : "Telecom Entry Row"
  },
  {
    "code" : "AllergyReactionItem",
    "display" : "Allergy Reaction Row"
  }]
}

```
