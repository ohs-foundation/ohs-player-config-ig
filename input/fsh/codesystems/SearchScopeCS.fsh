CodeSystem: SearchScopeCS
Id: search-scope-cs
Title: "Search Scope CodeSystem"
Description: """
Valid locations within a FHIR Search Result where resources are found.
Used by ViewJoinMap to specify where to look for pivot and joined resources.
"""
* #root         "The primary resource returned by the search query"
* #included     "Resources returned via forward include (_include)"
* #revIncluded  "Resources returned via reverse include (_revinclude)"

ValueSet: SearchScopeVS
Id: search-scope-vs
Title: "Search Scope ValueSet"
Description: "All valid search scope codes."
* codes from system SearchScopeCS
