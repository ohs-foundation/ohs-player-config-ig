# Group - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Group**

## Binary: Group

```

{
  "resourceType": "https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition",
  "url": "http://ohs.dev/ViewDefinition/Group",
  "fhirVersion": [
    "4.0.1"
  ],
  "select": [
    {
      "column": [
        {
          "name": "groupId",
          "path": "id",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "groupName",
          "path": "name",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "memberCount",
          "path": "member.count().toString()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        }
      ]
    }
  ],
  "name": "Group",
  "status": "active",
  "resource": "Group"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
