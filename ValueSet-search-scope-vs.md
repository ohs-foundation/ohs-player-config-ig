# Search Scope ValueSet - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Search Scope ValueSet**

## ValueSet: Search Scope ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://ohs.dev/ValueSet/search-scope-vs | *Version*:0.1.0 |
| Draft as of 2026-05-20 | *Computable Name*:SearchScopeVS |

 
All valid search scope codes. 

 **References** 

* [View Join Map](StructureDefinition-ViewJoinMap.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "search-scope-vs",
  "url" : "http://ohs.dev/ValueSet/search-scope-vs",
  "version" : "0.1.0",
  "name" : "SearchScopeVS",
  "title" : "Search Scope ValueSet",
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
  "description" : "All valid search scope codes.",
  "compose" : {
    "include" : [{
      "system" : "http://ohs.dev/CodeSystem/search-scope-cs"
    }]
  }
}

```
