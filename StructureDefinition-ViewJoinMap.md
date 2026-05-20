# View Join Map - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **View Join Map**

## Logical Model: View Join Map 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/StructureDefinition/ViewJoinMap | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:ViewJoinMap |

 
A metadata guide that stitches atomic ViewDefinitions sourced from different SearchResult scopes into a single flat JSON row per pivot resource. 
The pivot resource drives the output row count (one row per pivot instance). Each join appends its ViewDefinition's columns to the same row. All column names across the pivot and all joins must be unique within this map. 

A `ViewJoinMap` describes how to assemble a flat state row by joining columns from multiple [ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition.html) projections, each sourced from a different scope of a FHIR `SearchResult`.

### Concepts

**Pivot** — the resource type that drives row count. One output row is produced per pivot resource instance. The pivot scope is one of `root` (the primary search result resource), `included` (forward-included resources), or `revIncluded` (reverse-included resources).

**Join** — a secondary ViewDefinition whose columns are appended to every pivot row.

* **Static join** (no `matchKey`): the join resource is the same for all pivot rows. Columns are evaluated once and shared across the output list.
* **Dynamic join** (with `matchKey`): each pivot row carries a foreign-key column that identifies which joined resource to merge. The extractor builds a lookup map keyed by joined resource ID before the pivot loop, so each unique joined resource is evaluated exactly once regardless of how many pivot rows reference it.

### The name field and code generation

The `name` field becomes the base name for the generated Kotlin `State` data class and `StateExtractor` object. The SUSHI `Instance:` name must match the generated class name exactly — by convention both use PascalCase with a `State` suffix (e.g. `PatientAllergyState`).

### Example — GroupMemberState

One row per household member (`Patient` from `included` via `"member"` search param), enriched with head-of-household identity from a `RelatedPerson` matched by `relatedPersonLink`:

```
Instance: GroupMemberState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "groupMember"
* from = #included
* resource = "Patient"
* view = "Member"
* searchParam = "member"
* joins[0].view = "RelatedPerson"
* joins[0].from = #revIncluded
* joins[0].resource = "RelatedPerson"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "relatedPersonLink"

```

Given a group with members `Patient/p1` and `Patient/p3`, and a `RelatedPerson/rp1` linked to `Patient/p1`, the extractor produces two rows: one for each member, with `RelatedPerson` columns populated only for the member that has a matching `relatedPersonLink` value.

### SearchScope reference

| | |
| :--- | :--- |
| `root` | The primary resource returned by the search query |
| `included` | Resources returned via forward include (`_include`) |
| `revIncluded` | Resources returned via reverse include (`_revinclude`) |

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/dev.ohs.ohs-player-config-ig|current/StructureDefinition/ViewJoinMap)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ViewJoinMap.csv), [Excel](StructureDefinition-ViewJoinMap.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ViewJoinMap",
  "url" : "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "version" : "0.1.0",
  "name" : "ViewJoinMap",
  "title" : "View Join Map",
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
  "description" : "A metadata guide that stitches atomic ViewDefinitions sourced from different\nSearchResult scopes into a single flat JSON row per pivot resource.\n\nThe pivot resource drives the output row count (one row per pivot instance).\nEach join appends its ViewDefinition's columns to the same row. All column\nnames across the pivot and all joins must be unique within this map.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ViewJoinMap",
      "path" : "ViewJoinMap",
      "short" : "View Join Map",
      "definition" : "A metadata guide that stitches atomic ViewDefinitions sourced from different\nSearchResult scopes into a single flat JSON row per pivot resource.\n\nThe pivot resource drives the output row count (one row per pivot instance).\nEach join appends its ViewDefinition's columns to the same row. All column\nnames across the pivot and all joins must be unique within this map."
    },
    {
      "id" : "ViewJoinMap.name",
      "path" : "ViewJoinMap.name",
      "short" : "Output key used in the assembled JSON (e.g. 'patientAllergy')",
      "definition" : "Output key used in the assembled JSON (e.g. 'patientAllergy')",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.from",
      "path" : "ViewJoinMap.from",
      "short" : "SearchScope containing the pivot (row-driving) resource",
      "definition" : "SearchScope containing the pivot (row-driving) resource",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://ohs.dev/ValueSet/search-scope-vs"
      }
    },
    {
      "id" : "ViewJoinMap.resource",
      "path" : "ViewJoinMap.resource",
      "short" : "FHIR resource type of the pivot (e.g. 'AllergyIntolerance')",
      "definition" : "FHIR resource type of the pivot (e.g. 'AllergyIntolerance')",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.view",
      "path" : "ViewJoinMap.view",
      "short" : "ID of the ViewDefinition applied to each pivot resource",
      "definition" : "ID of the ViewDefinition applied to each pivot resource",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.searchParam",
      "path" : "ViewJoinMap.searchParam",
      "short" : "Search param disambiguating same-type included/revIncluded pivot resources",
      "definition" : "Search param disambiguating same-type included/revIncluded pivot resources",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.joins",
      "path" : "ViewJoinMap.joins",
      "short" : "Additional ViewDefinitions whose columns are merged into each row",
      "definition" : "Additional ViewDefinitions whose columns are merged into each row",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ViewJoinMap.joins.view",
      "path" : "ViewJoinMap.joins.view",
      "short" : "ID of the ViewDefinition to apply to the joined resource",
      "definition" : "ID of the ViewDefinition to apply to the joined resource",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.joins.from",
      "path" : "ViewJoinMap.joins.from",
      "short" : "SearchScope containing the joined resource",
      "definition" : "SearchScope containing the joined resource",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://ohs.dev/ValueSet/search-scope-vs"
      }
    },
    {
      "id" : "ViewJoinMap.joins.resource",
      "path" : "ViewJoinMap.joins.resource",
      "short" : "FHIR resource type of the joined resource (e.g. 'Patient')",
      "definition" : "FHIR resource type of the joined resource (e.g. 'Patient')",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.joins.searchParam",
      "path" : "ViewJoinMap.joins.searchParam",
      "short" : "Search param disambiguating same-type revIncluded resources",
      "definition" : "Search param disambiguating same-type revIncluded resources",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ViewJoinMap.joins.matchKey",
      "path" : "ViewJoinMap.joins.matchKey",
      "short" : "Column name in pivot view used as FK to locate the joined resource by ID",
      "definition" : "Column name in pivot view used as FK to locate the joined resource by ID",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
