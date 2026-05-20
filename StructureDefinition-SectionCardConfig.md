# Section Card Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Section Card Configuration**

## Logical Model: Section Card Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/SectionCardConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:SectionCardConfig |

 
Configuration for the SectionCard wrapper component that groups related items under a titled card with an optional item count badge. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/SectionCardConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SectionCardConfig.csv), [Excel](StructureDefinition-SectionCardConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SectionCardConfig",
  "url" : "http://ohs.dev/StructureDefinition/SectionCardConfig",
  "version" : "0.1.0",
  "name" : "SectionCardConfig",
  "title" : "Section Card Configuration",
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
  "description" : "Configuration for the SectionCard wrapper component that groups related items\nunder a titled card with an optional item count badge.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/SectionCardConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SectionCardConfig",
      "path" : "SectionCardConfig",
      "short" : "Section Card Configuration",
      "definition" : "Configuration for the SectionCard wrapper component that groups related items\nunder a titled card with an optional item count badge."
    },
    {
      "id" : "SectionCardConfig.showItemCount",
      "path" : "SectionCardConfig.showItemCount",
      "short" : "Show the item count badge next to the section title",
      "definition" : "Show the item count badge next to the section title",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "SectionCardConfig.collapsible",
      "path" : "SectionCardConfig.collapsible",
      "short" : "Allow the section to be collapsed / expanded by the user",
      "definition" : "Allow the section to be collapsed / expanded by the user",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
