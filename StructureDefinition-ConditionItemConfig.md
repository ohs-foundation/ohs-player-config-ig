# Condition Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Condition Item Configuration**

## Logical Model: Condition Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/ConditionItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:ConditionItemConfig |

 
Configuration for the ConditionItem component rendered inside the Conditions section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/ConditionItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ConditionItemConfig.csv), [Excel](StructureDefinition-ConditionItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ConditionItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/ConditionItemConfig",
  "version" : "0.1.0",
  "name" : "ConditionItemConfig",
  "title" : "Condition Item Configuration",
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
  "description" : "Configuration for the ConditionItem component rendered inside the Conditions section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/ConditionItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ConditionItemConfig",
      "path" : "ConditionItemConfig",
      "short" : "Condition Item Configuration",
      "definition" : "Configuration for the ConditionItem component rendered inside the Conditions section."
    },
    {
      "id" : "ConditionItemConfig.showOnsetDate",
      "path" : "ConditionItemConfig.showOnsetDate",
      "short" : "Show the condition onset date",
      "definition" : "Show the condition onset date",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "ConditionItemConfig.showStatus",
      "path" : "ConditionItemConfig.showStatus",
      "short" : "Show the clinical status chip",
      "definition" : "Show the clinical status chip",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
