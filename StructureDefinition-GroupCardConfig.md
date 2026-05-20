# Group Card Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Group Card Configuration**

## Logical Model: Group Card Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/GroupCardConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:GroupCardConfig |

 
Configuration for the GroupCard component rendered in the household list screen. Controls which household fields are visible on the card. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/GroupCardConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GroupCardConfig.csv), [Excel](StructureDefinition-GroupCardConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GroupCardConfig",
  "url" : "http://ohs.dev/StructureDefinition/GroupCardConfig",
  "version" : "0.1.0",
  "name" : "GroupCardConfig",
  "title" : "Group Card Configuration",
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
  "description" : "Configuration for the GroupCard component rendered in the household list screen.\nControls which household fields are visible on the card.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/GroupCardConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "GroupCardConfig",
      "path" : "GroupCardConfig",
      "short" : "Group Card Configuration",
      "definition" : "Configuration for the GroupCard component rendered in the household list screen.\nControls which household fields are visible on the card."
    },
    {
      "id" : "GroupCardConfig.showMemberCount",
      "path" : "GroupCardConfig.showMemberCount",
      "short" : "Show the number of household members",
      "definition" : "Show the number of household members",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "GroupCardConfig.showLocation",
      "path" : "GroupCardConfig.showLocation",
      "short" : "Show the household location",
      "definition" : "Show the household location",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
