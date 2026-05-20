# Immunization Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Immunization Item Configuration**

## Logical Model: Immunization Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/ImmunizationItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:ImmunizationItemConfig |

 
Configuration for the ImmunizationItem component rendered inside the Immunizations section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/ImmunizationItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ImmunizationItemConfig.csv), [Excel](StructureDefinition-ImmunizationItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ImmunizationItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/ImmunizationItemConfig",
  "version" : "0.1.0",
  "name" : "ImmunizationItemConfig",
  "title" : "Immunization Item Configuration",
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
  "description" : "Configuration for the ImmunizationItem component rendered inside the Immunizations section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/ImmunizationItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ImmunizationItemConfig",
      "path" : "ImmunizationItemConfig",
      "short" : "Immunization Item Configuration",
      "definition" : "Configuration for the ImmunizationItem component rendered inside the Immunizations section."
    },
    {
      "id" : "ImmunizationItemConfig.showDate",
      "path" : "ImmunizationItemConfig.showDate",
      "short" : "Show the administration date",
      "definition" : "Show the administration date",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "ImmunizationItemConfig.showStatus",
      "path" : "ImmunizationItemConfig.showStatus",
      "short" : "Show the immunization status chip",
      "definition" : "Show the immunization status chip",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
