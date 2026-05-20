# Group Header Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Group Header Configuration**

## Logical Model: Group Header Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/GroupHeaderConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:GroupHeaderConfig |

 
Configuration for the GroupHeader component shown at the top of the household profile screen. Controls which household and head-of-household fields are visible. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/GroupHeaderConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GroupHeaderConfig.csv), [Excel](StructureDefinition-GroupHeaderConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GroupHeaderConfig",
  "url" : "http://ohs.dev/StructureDefinition/GroupHeaderConfig",
  "version" : "0.1.0",
  "name" : "GroupHeaderConfig",
  "title" : "Group Header Configuration",
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
  "description" : "Configuration for the GroupHeader component shown at the top of the household\nprofile screen. Controls which household and head-of-household fields are visible.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/GroupHeaderConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "GroupHeaderConfig",
      "path" : "GroupHeaderConfig",
      "short" : "Group Header Configuration",
      "definition" : "Configuration for the GroupHeader component shown at the top of the household\nprofile screen. Controls which household and head-of-household fields are visible."
    },
    {
      "id" : "GroupHeaderConfig.showMemberCount",
      "path" : "GroupHeaderConfig.showMemberCount",
      "short" : "Show the total number of household members",
      "definition" : "Show the total number of household members",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "GroupHeaderConfig.showHeadName",
      "path" : "GroupHeaderConfig.showHeadName",
      "short" : "Show the head-of-household name",
      "definition" : "Show the head-of-household name",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
