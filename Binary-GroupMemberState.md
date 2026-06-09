# GroupMemberState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GroupMemberState**

## Example Binary: GroupMemberState

This content is an example of the [View Join Map](StructureDefinition-ViewJoinMap.md) Logical Model and is not a FHIR Resource

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "joins": [
    {
      "view": "RelatedPerson",
      "from": "revIncluded",
      "resource": "RelatedPerson",
      "searchParam": "patient",
      "matchKey": "relatedPersonLink"
    }
  ],
  "name": "groupMember",
  "from": "included",
  "resource": "Patient",
  "view": "Member",
  "searchParam": "member"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
