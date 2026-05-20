# Patient Card Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient Card Configuration**

## Logical Model: Patient Card Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/PatientCardConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:PatientCardConfig |

 
Configuration for the PatientCard component rendered in the patient list screen. Controls which demographic fields are visible on the card. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/PatientCardConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-PatientCardConfig.csv), [Excel](StructureDefinition-PatientCardConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PatientCardConfig",
  "url" : "http://ohs.dev/StructureDefinition/PatientCardConfig",
  "version" : "0.1.0",
  "name" : "PatientCardConfig",
  "title" : "Patient Card Configuration",
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
  "description" : "Configuration for the PatientCard component rendered in the patient list screen.\nControls which demographic fields are visible on the card.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/PatientCardConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "PatientCardConfig",
      "path" : "PatientCardConfig",
      "short" : "Patient Card Configuration",
      "definition" : "Configuration for the PatientCard component rendered in the patient list screen.\nControls which demographic fields are visible on the card."
    },
    {
      "id" : "PatientCardConfig.showStatusChip",
      "path" : "PatientCardConfig.showStatusChip",
      "short" : "Show the active / inactive status chip",
      "definition" : "Show the active / inactive status chip",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "PatientCardConfig.showAge",
      "path" : "PatientCardConfig.showAge",
      "short" : "Show the patient's calculated age",
      "definition" : "Show the patient's calculated age",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "PatientCardConfig.showGender",
      "path" : "PatientCardConfig.showGender",
      "short" : "Show the patient's gender",
      "definition" : "Show the patient's gender",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
