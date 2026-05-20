# Member Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Member Item Configuration**

## Logical Model: Member Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/MemberItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:MemberItemConfig |

 
Configuration for the MemberItem component rendered in the household member list. Controls which demographic fields are visible for each member row. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/MemberItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-MemberItemConfig.csv), [Excel](StructureDefinition-MemberItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MemberItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/MemberItemConfig",
  "version" : "0.1.0",
  "name" : "MemberItemConfig",
  "title" : "Member Item Configuration",
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
  "description" : "Configuration for the MemberItem component rendered in the household member list.\nControls which demographic fields are visible for each member row.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/MemberItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "MemberItemConfig",
      "path" : "MemberItemConfig",
      "short" : "Member Item Configuration",
      "definition" : "Configuration for the MemberItem component rendered in the household member list.\nControls which demographic fields are visible for each member row."
    },
    {
      "id" : "MemberItemConfig.showAge",
      "path" : "MemberItemConfig.showAge",
      "short" : "Show the member's calculated age",
      "definition" : "Show the member's calculated age",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "MemberItemConfig.showGender",
      "path" : "MemberItemConfig.showGender",
      "short" : "Show the member's gender",
      "definition" : "Show the member's gender",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "MemberItemConfig.showRelationship",
      "path" : "MemberItemConfig.showRelationship",
      "short" : "Show the member's relationship to the head",
      "definition" : "Show the member's relationship to the head",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
