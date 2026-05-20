# Allergy Reaction Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Allergy Reaction Item Configuration**

## Logical Model: Allergy Reaction Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/AllergyReactionItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:AllergyReactionItemConfig |

 
Configuration for the AllergyReactionItem component rendered inside the Allergy Reactions section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/AllergyReactionItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-AllergyReactionItemConfig.csv), [Excel](StructureDefinition-AllergyReactionItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "AllergyReactionItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/AllergyReactionItemConfig",
  "version" : "0.1.0",
  "name" : "AllergyReactionItemConfig",
  "title" : "Allergy Reaction Item Configuration",
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
  "description" : "Configuration for the AllergyReactionItem component rendered inside the Allergy Reactions section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/AllergyReactionItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/ViewConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "AllergyReactionItemConfig",
      "path" : "AllergyReactionItemConfig",
      "short" : "Allergy Reaction Item Configuration",
      "definition" : "Configuration for the AllergyReactionItem component rendered inside the Allergy Reactions section."
    },
    {
      "id" : "AllergyReactionItemConfig.showSeverity",
      "path" : "AllergyReactionItemConfig.showSeverity",
      "short" : "Show the reaction severity label",
      "definition" : "Show the reaction severity label",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "AllergyReactionItemConfig.showManifestation",
      "path" : "AllergyReactionItemConfig.showManifestation",
      "short" : "Show the reaction manifestation text",
      "definition" : "Show the reaction manifestation text",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
