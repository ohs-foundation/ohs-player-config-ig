# PatientAllergyState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PatientAllergyState**

## Binary: PatientAllergyState

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
  "name": "patientAllergy",
  "from": "revIncluded",
  "resource": "AllergyIntolerance",
  "view": "Allergy"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
