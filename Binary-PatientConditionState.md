# PatientConditionState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PatientConditionState**

## Binary: PatientConditionState

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "joins": [
    {
      "view": "PatientSummary",
      "from": "included",
      "resource": "Patient",
      "searchParam": "patient",
      "matchKey": "conditionPatientRef"
    }
  ],
  "name": "patientCondition",
  "from": "revIncluded",
  "resource": "Condition",
  "view": "Condition"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
