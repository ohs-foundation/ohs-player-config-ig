# PatientImmunizationState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PatientImmunizationState**

## Binary: PatientImmunizationState

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "joins": [
    {
      "view": "PatientSummary",
      "from": "included",
      "resource": "Patient",
      "searchParam": "patient",
      "matchKey": "immunizationPatientRef"
    }
  ],
  "name": "patientImmunization",
  "from": "revIncluded",
  "resource": "Immunization",
  "view": "Immunization"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
