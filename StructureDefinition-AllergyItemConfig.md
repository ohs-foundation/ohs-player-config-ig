# Allergy Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Allergy Item Configuration**

## Logical Model: Allergy Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/AllergyItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:AllergyItemConfig |

 
Configuration for the AllergyItem component rendered inside the Allergies section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/AllergyItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-AllergyItemConfig.csv), [Excel](StructureDefinition-AllergyItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "AllergyItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/AllergyItemConfig",
  "version" : "0.1.0",
  "name" : "AllergyItemConfig",
  "title" : "Allergy Item Configuration",
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
  "description" : "Configuration for the AllergyItem component rendered inside the Allergies section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/AllergyItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "AllergyItemConfig",
      "path" : "AllergyItemConfig",
      "short" : "Allergy Item Configuration",
      "definition" : "Configuration for the AllergyItem component rendered inside the Allergies section."
    },
    {
      "id" : "AllergyItemConfig.showCriticality",
      "path" : "AllergyItemConfig.showCriticality",
      "short" : "Show the criticality badge (color-coded: high / moderate / low)",
      "definition" : "Show the criticality badge (color-coded: high / moderate / low)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "AllergyItemConfig.showStatus",
      "path" : "AllergyItemConfig.showStatus",
      "short" : "Show the clinical status of the allergy",
      "definition" : "Show the clinical status of the allergy",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
