# Medication Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medication Item Configuration**

## Logical Model: Medication Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/MedicationItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:MedicationItemConfig |

 
Configuration for the MedicationItem component rendered inside the Medications section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/MedicationItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-MedicationItemConfig.csv), [Excel](StructureDefinition-MedicationItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MedicationItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/MedicationItemConfig",
  "version" : "0.1.0",
  "name" : "MedicationItemConfig",
  "title" : "Medication Item Configuration",
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
  "description" : "Configuration for the MedicationItem component rendered inside the Medications section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/MedicationItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "MedicationItemConfig",
      "path" : "MedicationItemConfig",
      "short" : "Medication Item Configuration",
      "definition" : "Configuration for the MedicationItem component rendered inside the Medications section."
    },
    {
      "id" : "MedicationItemConfig.showStatus",
      "path" : "MedicationItemConfig.showStatus",
      "short" : "Show the medication status chip",
      "definition" : "Show the medication status chip",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "MedicationItemConfig.showDosage",
      "path" : "MedicationItemConfig.showDosage",
      "short" : "Show the dosage instruction text",
      "definition" : "Show the dosage instruction text",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "MedicationItemConfig.compact",
      "path" : "MedicationItemConfig.compact",
      "short" : "Use a single-line compact display mode",
      "definition" : "Use a single-line compact display mode",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
