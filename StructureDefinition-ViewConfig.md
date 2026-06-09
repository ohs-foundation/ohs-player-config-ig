# View Configuration - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **View Configuration**

## Logical Model: View Configuration 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/ViewConfig | *Version*:0.1.0 |
| Draft as of 2026-06-09 | *Computable Name*:ViewConfig |

 
A self-describing UI configuration bound to a view type. 
`ViewConfig` is the contract for declaring a config — it does **not** fix any particular config's fields. An implementer provides a config as a `ViewConfig` Binary that lists its own `property` entries; each property gives a field `name`, its `type`, and a default `value`. A player generates a typed config class from the property list and binds the values to the renderer selected by `viewType`. 

`ViewConfig` is the **contract for declaring a UI configuration** — not a concrete config. It lets an implementer describe a config's fields generically, so the IG never has to enumerate one application's configs.

### Shape

A ViewConfig has a `viewType` (the binding key to a component) and a list of `property` entries. Each property declares one field: its `name`, its `type` (a FHIR primitive — `boolean`, `decimal`, `integer`, `string`, …), and an optional default `value[x]`.

```
Instance: PatientHeaderConfigExample
InstanceOf: ViewConfig
Usage: #definition
* viewType = #PatientHeader
* property[0].name = "showMrn"
* property[0].type = #boolean
* property[0].valueBoolean = true
* property[1].name = "elevation"
* property[1].type = #decimal
* property[1].valueDecimal = 2.0

```

The Binary is **self-describing**: the property `type`s give an OHS Player everything it needs to produce a typed config, and the `value`s give the defaults.

### How it maps in the OHS Player view-render world

An OHS Player renders by binding three runtime inputs:

1. **State**— a flat row produced by a[ViewJoinMap](StructureDefinition-ViewJoinMap.md)and its[ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition-ViewDefinition.html)s.
1. **View type**— a code (from the implementer's view-type CodeSystem) that selects**which**component renders the state.
1. **ViewConfig**— the config for that`viewType`, which tunes the component. The OHS Player turns the`property[]`into a typed config and passes the values to the renderer.

So `viewType` is the join between a config and the component it configures: `state + viewType + ViewConfig → rendered UI`. How an OHS Player turns these into actual UI — code generation, a renderer registry, a runtime interpreter — is its own concern. The IG fixes only the shapes; any conformant implementation meets the same objective.

### Runtime delivery

ViewConfigs are **runtime configuration**: authored against this model and delivered to an OHS Player at runtime (database seed, runtime API, or a client repository). This IG ships only examples; an implementer provides its own.

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/dev.ohs.ohs-player-config-ig|current/StructureDefinition/StructureDefinition-ViewConfig.json)

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
  "title" : "View Configuration",
  "status" : "draft",
  "date" : "2026-06-09T19:54:52+00:00",
  "publisher" : "OHS Foundation",
  "contact" : [{
    "name" : "OHS Foundation",
    "telecom" : [{
      "system" : "url",
      "value" : "http://ohs.dev/example-publisher"
    }]
  }],
  "description" : "A self-describing UI configuration bound to a view type.\n\n`ViewConfig` is the contract for declaring a config — it does **not** fix any particular config's\nfields. An implementer provides a config as a `ViewConfig` Binary that lists its own `property`\nentries; each property gives a field `name`, its `type`, and a default `value`. A player generates a\ntyped config class from the property list and binds the values to the renderer selected by `viewType`.",
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
      "short" : "View Configuration",
      "definition" : "A self-describing UI configuration bound to a view type.\n\n`ViewConfig` is the contract for declaring a config — it does **not** fix any particular config's\nfields. An implementer provides a config as a `ViewConfig` Binary that lists its own `property`\nentries; each property gives a field `name`, its `type`, and a default `value`. A player generates a\ntyped config class from the property list and binds the values to the renderer selected by `viewType`."
    },
    {
      "id" : "ViewConfig.viewType",
      "path" : "ViewConfig.viewType",
      "short" : "View type this config parameterizes — the binding key to a component.",
      "definition" : "View type this config parameterizes — the binding key to a component.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ViewConfig.property",
      "path" : "ViewConfig.property",
      "short" : "One configuration field.",
      "definition" : "One configuration field.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ViewConfig.property.name",
      "path" : "ViewConfig.property.name",
      "short" : "Field name (becomes a property on the generated config).",
      "definition" : "Field name (becomes a property on the generated config).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewConfig.property.type",
      "path" : "ViewConfig.property.type",
      "short" : "FHIR primitive type of the field, e.g. boolean | decimal | integer | string.",
      "definition" : "FHIR primitive type of the field, e.g. boolean | decimal | integer | string.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ViewConfig.property.value[x]",
      "path" : "ViewConfig.property.value[x]",
      "short" : "Default value for the field.",
      "definition" : "Default value for the field.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      },
      {
        "code" : "integer"
      },
      {
        "code" : "decimal"
      },
      {
        "code" : "string"
      }]
    }]
  }
}

```
