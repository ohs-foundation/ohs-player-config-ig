# PatientMedicationState - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PatientMedicationState**

## Binary: PatientMedicationState

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewJoinMap",
  "joins": [
    {
      "view": "PatientSummary",
      "from": "included",
      "resource": "Patient",
      "searchParam": "patient",
      "matchKey": "medPatientRef"
    }
  ],
  "name": "patientMedication",
  "from": "revIncluded",
  "resource": "MedicationRequest",
  "view": "Medication"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
