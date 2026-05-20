# Search Scope CodeSystem - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Search Scope CodeSystem**

## CodeSystem: Search Scope CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/CodeSystem/search-scope-cs | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:SearchScopeCS |

 
Valid locations within a FHIR Search Result where resources are found. Used by ViewJoinMap to specify where to look for pivot and joined resources. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SearchScopeVS](ValueSet-search-scope-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "search-scope-cs",
  "url" : "http://ohs.dev/CodeSystem/search-scope-cs",
  "version" : "0.1.0",
  "name" : "SearchScopeCS",
  "title" : "Search Scope CodeSystem",
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
  "description" : "Valid locations within a FHIR Search Result where resources are found.\nUsed by ViewJoinMap to specify where to look for pivot and joined resources.",
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "root",
    "display" : "The primary resource returned by the search query"
  },
  {
    "code" : "included",
    "display" : "Resources returned via forward include (_include)"
  },
  {
    "code" : "revIncluded",
    "display" : "Resources returned via reverse include (_revinclude)"
  }]
}

```
