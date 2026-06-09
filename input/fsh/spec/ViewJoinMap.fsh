// ============================================================================
// ViewJoinMap Logical Model
//
// Describes how to stitch multiple ViewDefinitions — each applied to a
// different FHIR resource from a SearchResult — into a single flat JSON row.
// The ViewAssembler in the library reads this map at runtime to assemble
// List<JsonObject> rows from a SearchResult.
//
// Column names across all participating ViewDefinitions MUST be unique
// within a single ViewJoinMap to ensure clean flat-merge output.
// ============================================================================

Logical: ViewJoinMap
Id: ViewJoinMap
Title: "View Join Map"
Description: """
A metadata guide that stitches atomic ViewDefinitions sourced from different
SearchResult scopes into a single flat JSON row per pivot resource.

The pivot resource drives the output row count (one row per pivot instance).
Each join appends its ViewDefinition's columns to the same row. All column
names across the pivot and all joins must be unique within this map.
"""
* name 1..1 string "Output key used in the assembled JSON (e.g. 'patientAllergy')"
* from 1..1 code "SearchScope containing the pivot (row-driving) resource"
* from from SearchScopeVS (required)
* resource 1..1 string "FHIR resource type of the pivot (e.g. 'AllergyIntolerance')"
* view 1..1 string "ID of the ViewDefinition applied to each pivot resource"
* searchParam 0..1 string "Search param disambiguating same-type included/revIncluded pivot resources"

* joins 0..* BackboneElement "Additional ViewDefinitions whose columns are merged into each row"
  * view 1..1 string "ID of the ViewDefinition to apply to the joined resource"
  * from 1..1 code "SearchScope containing the joined resource"
  * from from SearchScopeVS (required)
  * resource 1..1 string "FHIR resource type of the joined resource (e.g. 'Patient')"
  * searchParam 0..1 string "Search param disambiguating same-type revIncluded resources"
  * matchKey 0..1 string "Column name in pivot view used as FK to locate the joined resource by ID"
