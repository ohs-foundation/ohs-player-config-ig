// --- The Allowed Search Scopes ---

CodeSystem: SearchScopeCS
Id: search-scope-cs
Title: "Search Scope CodeSystem"
Description: "Valid areas within a FHIR Search Result (Bundle) where resources are located."
* #root "The primary resource of the search"
* #included "Resources returned via forward links (_include)"
* #revIncluded "Resources returned via backward links (_revinclude)"

ValueSet: SearchScopeVS
Id: search-scope-vs
Title: "Search Scope ValueSet"
* codes from system SearchScopeCS

// --- The Join Map Logical Model ---

Logical: ViewJoinMap
Id: ViewJoinMap
Title: "View Join Map"
Description: "A metadata guide to stitch atomic ViewDefinitions from different SearchScopes into a flat JSON row."
* name 1..1 string "The key in the final JSON output (e.g., 'members')"
* from 1..1 code "The SearchScope to use for the pivot/base resource"
* from from SearchScopeVS (required)
* resource 1..1 string "The FHIR resource type to iterate (e.g., 'Immunization')"
* view 1..1 string "The ID of the ViewDefinition for the pivot resource"

* joins 0..* Element "Other views to join into this row"
  * view 1..1 string "The ID of the ViewDefinition to join"
  * from 1..1 code "The SearchScope containing the joined resource"
  * from from SearchScopeVS (required)
  * matchKey 0..1 string "The column name in the PIVOT view used to find the joined resource"