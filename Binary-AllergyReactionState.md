# AllergyReactionState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AllergyReactionState**

## Example Binary: AllergyReactionState

This content is an example of the [View Join Map](StructureDefinition-ViewJoinMap.md) Logical Model and is not a FHIR Resource

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "joins": [
    {
      "view": "PatientSummary",
      "from": "included",
      "resource": "Patient",
      "searchParam": "patient",
      "matchKey": "allergyPatientRef"
    }
  ],
  "name": "allergyReaction",
  "from": "revIncluded",
  "resource": "AllergyIntolerance",
  "view": "AllergyReaction"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
