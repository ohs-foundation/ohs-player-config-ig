# Medication - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medication**

## Binary: Medication

```

{
  "resourceType": "https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition",
  "url": "http://ohs.dev/ViewDefinition/Medication",
  "fhirVersion": [
    "4.0.1"
  ],
  "select": [
    {
      "column": [
        {
          "name": "medicationId",
          "path": "id",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "medicationName",
          "path": "medication.coding.display.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "dosage",
          "path": "dosageInstruction.text.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "medStatus",
          "path": "status",
          "type": "http://hl7.org/fhir/StructureDefinition/code"
        },
        {
          "name": "medPatientRef",
          "path": "subject.reference.replace('Patient/', '')",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        }
      ]
    }
  ],
  "name": "Medication",
  "status": "active",
  "resource": "MedicationRequest"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
