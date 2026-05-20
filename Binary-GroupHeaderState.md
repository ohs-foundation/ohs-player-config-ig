# GroupHeaderState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GroupHeaderState**

## Binary: GroupHeaderState

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "joins": [
    {
      "view": "RelatedPerson",
      "from": "revIncluded",
      "resource": "RelatedPerson",
      "searchParam": "patient"
    }
  ],
  "name": "groupHeader",
  "from": "root",
  "resource": "Group",
  "view": "Group"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
