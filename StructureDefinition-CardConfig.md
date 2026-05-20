# Card Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Card Configuration**

## Logical Model: Card Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/CardConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:CardConfig |

 
Base configuration for Card-based UI components. Inherits padding from ViewConfig. 

**Usages:**

* Derived from this Logical Model: [Allergy Item Configuration](StructureDefinition-AllergyItemConfig.md), [Condition Item Configuration](StructureDefinition-ConditionItemConfig.md), [Group Card Configuration](StructureDefinition-GroupCardConfig.md), [Group Header Configuration](StructureDefinition-GroupHeaderConfig.md)... Show 6 more, [Immunization Item Configuration](StructureDefinition-ImmunizationItemConfig.md), [Medication Item Configuration](StructureDefinition-MedicationItemConfig.md), [Member Item Configuration](StructureDefinition-MemberItemConfig.md), [Patient Card Configuration](StructureDefinition-PatientCardConfig.md), [Patient Header Configuration](StructureDefinition-PatientHeaderConfig.md) and [Section Card Configuration](StructureDefinition-SectionCardConfig.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/CardConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-CardConfig.csv), [Excel](StructureDefinition-CardConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "CardConfig",
  "url" : "http://ohs.dev/StructureDefinition/CardConfig",
  "version" : "0.1.0",
  "name" : "CardConfig",
  "title" : "Card Configuration",
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
  "description" : "Base configuration for Card-based UI components.\nInherits padding from ViewConfig.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/CardConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/ViewConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "CardConfig",
      "path" : "CardConfig",
      "short" : "Card Configuration",
      "definition" : "Base configuration for Card-based UI components.\nInherits padding from ViewConfig."
    },
    {
      "id" : "CardConfig.elevation",
      "path" : "CardConfig.elevation",
      "short" : "Shadow elevation depth in DP",
      "definition" : "Shadow elevation depth in DP",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "CardConfig.cornerRadius",
      "path" : "CardConfig.cornerRadius",
      "short" : "Corner rounding radius in DP",
      "definition" : "Corner rounding radius in DP",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    }]
  }
}

```
