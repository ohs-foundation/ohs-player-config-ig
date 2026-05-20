# Contact Item Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Contact Item Configuration**

## Logical Model: Contact Item Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/ContactItemConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:ContactItemConfig |

 
Configuration for the ContactItem component rendered inside the Contacts section. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/ContactItemConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ContactItemConfig.csv), [Excel](StructureDefinition-ContactItemConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ContactItemConfig",
  "url" : "http://ohs.dev/StructureDefinition/ContactItemConfig",
  "version" : "0.1.0",
  "name" : "ContactItemConfig",
  "title" : "Contact Item Configuration",
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
  "description" : "Configuration for the ContactItem component rendered inside the Contacts section.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/ContactItemConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/ViewConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ContactItemConfig",
      "path" : "ContactItemConfig",
      "short" : "Contact Item Configuration",
      "definition" : "Configuration for the ContactItem component rendered inside the Contacts section."
    },
    {
      "id" : "ContactItemConfig.showRelationship",
      "path" : "ContactItemConfig.showRelationship",
      "short" : "Show the relationship label chip",
      "definition" : "Show the relationship label chip",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "ContactItemConfig.showPhone",
      "path" : "ContactItemConfig.showPhone",
      "short" : "Show the contact phone number",
      "definition" : "Show the contact phone number",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
