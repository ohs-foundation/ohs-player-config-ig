# Telecom Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Telecom Item Configuration**

## Logical Model: Telecom Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/TelecomItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:TelecomItemConfig |

 
Configuration for the TelecomItem component rendered inside the Contact Information section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/TelecomItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-TelecomItemConfig.csv), [Excel](StructureDefinition-TelecomItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TelecomItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/TelecomItemConfig",
  "version" : "0.1.0",
  "name" : "TelecomItemConfig",
  "title" : "Telecom Item Configuration",
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
  "description" : "Configuration for the TelecomItem component rendered inside the Contact Information section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/TelecomItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/ViewConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "TelecomItemConfig",
      "path" : "TelecomItemConfig",
      "short" : "Telecom Item Configuration",
      "definition" : "Configuration for the TelecomItem component rendered inside the Contact Information section."
    },
    {
      "id" : "TelecomItemConfig.showSystemLabel",
      "path" : "TelecomItemConfig.showSystemLabel",
      "short" : "Show the system label (Phone, Email) before the value",
      "definition" : "Show the system label (Phone, Email) before the value",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
