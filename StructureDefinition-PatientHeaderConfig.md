# Patient Header Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient Header Configuration**

## Logical Model: Patient Header Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/PatientHeaderConfig | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:PatientHeaderConfig |

 
Configuration for the PatientHeader component shown at the top of the patient IPS summary screen. Controls which demographic fields appear in the header. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/PatientHeaderConfig)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-PatientHeaderConfig.csv), [Excel](StructureDefinition-PatientHeaderConfig.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PatientHeaderConfig",
  "url" : "http://ohs.dev/StructureDefinition/PatientHeaderConfig",
  "version" : "0.1.0",
  "name" : "PatientHeaderConfig",
  "title" : "Patient Header Configuration",
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
  "description" : "Configuration for the PatientHeader component shown at the top of the patient\nIPS summary screen. Controls which demographic fields appear in the header.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/PatientHeaderConfig",
  "baseDefinition" : "http://ohs.dev/StructureDefinition/CardConfig",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "PatientHeaderConfig",
      "path" : "PatientHeaderConfig",
      "short" : "Patient Header Configuration",
      "definition" : "Configuration for the PatientHeader component shown at the top of the patient\nIPS summary screen. Controls which demographic fields appear in the header."
    },
    {
      "id" : "PatientHeaderConfig.showMrn",
      "path" : "PatientHeaderConfig.showMrn",
      "short" : "Show the patient's MRN identifier",
      "definition" : "Show the patient's MRN identifier",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "PatientHeaderConfig.showBirthDate",
      "path" : "PatientHeaderConfig.showBirthDate",
      "short" : "Show the patient's date of birth",
      "definition" : "Show the patient's date of birth",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "PatientHeaderConfig.showGender",
      "path" : "PatientHeaderConfig.showGender",
      "short" : "Show the patient's gender",
      "definition" : "Show the patient's gender",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "PatientHeaderConfig.showStatus",
      "path" : "PatientHeaderConfig.showStatus",
      "short" : "Show the active / inactive status chip",
      "definition" : "Show the active / inactive status chip",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
