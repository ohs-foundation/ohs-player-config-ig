# Base UI Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Base UI Configuration**

## Logical Model: Base UI Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/ViewConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:ViewConfig |

 
Abstract base for all UI component styling configurations. Subclasses inherit its padding field via the ig-codegen parent-chain flattening. 

**Usages:**

* Derived from this Logical Model: [Allergy Reaction Item Configuration](StructureDefinition-AllergyReactionItemConfig.md), [Card Configuration](StructureDefinition-CardConfig.md), [Contact Item Configuration](StructureDefinition-ContactItemConfig.md) and [Telecom Item Configuration](StructureDefinition-TelecomItemConfig.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/ViewConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ViewConfig.csv), [Excel](StructureDefinition-ViewConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ViewConfig",
  "url" : "http://ohs.dev/StructureDefinition/ViewConfig",
  "version" : "0.1.0",
  "name" : "ViewConfig",
  "title" : "Base UI Configuration",
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
  "description" : "Abstract base for all UI component styling configurations.\nSubclasses inherit its padding field via the ig-codegen parent-chain flattening.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/ViewConfig",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ViewConfig",
      "path" : "ViewConfig",
      "short" : "Base UI Configuration",
      "definition" : "Abstract base for all UI component styling configurations.\nSubclasses inherit its padding field via the ig-codegen parent-chain flattening."
    },
    {
      "id" : "ViewConfig.padding",
      "path" : "ViewConfig.padding",
      "short" : "Content padding in density-independent pixels (DP)",
      "definition" : "Content padding in density-independent pixels (DP)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    }]
  }
}

```
