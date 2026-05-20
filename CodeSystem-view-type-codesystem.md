# UI Component Types - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **UI Component Types**

## CodeSystem: UI Component Types 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/CodeSystem/view-type-codesystem | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:ViewTypeCS |

 
Formal codes for identifying UI component factories in the KMP ViewRegistry. Each code maps to a registered ComponentRenderer that knows how to render a specific FHIR-derived view state on screen. 

Each code in this system identifies a UI component factory registered in the KMP `ViewRegistry`. When the OHS Player framework encounters a view configuration that references a given code, it looks up the corresponding `ComponentRenderer` and delegates rendering to it.

### Code generation

The `:ig-codegen` plugin emits these codes as `val` properties on a generated `ViewTypeCS` Kotlin object (package `dev.ohs.player.generated.viewtype`). Each property holds a `ViewType` instance wrapping the code string:

```
object ViewTypeCS {
  val PatientCard      = ViewType("PatientCard")
  val PatientHeader    = ViewType("PatientHeader")
  val AllergyItem      = ViewType("AllergyItem")
  val MedicationItem   = ViewType("MedicationItem")
  val ConditionItem    = ViewType("ConditionItem")
  val ImmunizationItem = ViewType("ImmunizationItem")
  val SectionCard      = ViewType("SectionCard")
  val GroupCard        = ViewType("GroupCard")
  val GroupHeader      = ViewType("GroupHeader")
  val MemberItem       = ViewType("MemberItem")
}

```

### Usage in the app

Application code references `ViewTypeCS` constants rather than raw strings, giving a compile-time guarantee that the code exists in the IG:

```
// AppViewRegistry.kt
registry.register(ViewTypeCS.PatientCard, PatientCardRenderer)
registry.register(ViewTypeCS.AllergyItem, AllergyItemRenderer)

```

### Layout types

Layout component types (`VerticalList`, `HorizontalList`, `Grid`) are owned by the OHS Player library framework and are **not** declared in this CodeSystem. They are constants on their respective `*Renderer` companion objects in the library.

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "view-type-codesystem",
  "url" : "http://ohs.dev/CodeSystem/view-type-codesystem",
  "version" : "0.1.0",
  "name" : "ViewTypeCS",
  "title" : "UI Component Types",
  "status" : "draft",
  "date" : "2026-05-20T08:14:58+00:00",
  "publisher" : "OHS Foundation",
  "contact" : [{
    "name" : "OHS Foundation",
    "telecom" : [{
      "system" : "url",
      "value" : "http://ohs.dev/example-publisher"
    }]
  }],
  "description" : "Formal codes for identifying UI component factories in the KMP ViewRegistry.\nEach code maps to a registered ComponentRenderer that knows how to render\na specific FHIR-derived view state on screen.",
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
