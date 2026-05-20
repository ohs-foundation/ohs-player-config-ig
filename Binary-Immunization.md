# Immunization - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Immunization**

## Binary: Immunization

```

{
  "resourceType": "https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition",
  "url": "http://ohs.dev/ViewDefinition/Immunization",
  "fhirVersion": [
    "4.0.1"
  ],
  "select": [
    {
      "column": [
        {
          "name": "immunizationId",
          "path": "id",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "vaccineName",
          "path": "vaccineCode.coding.display.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "occurrenceDate",
          "path": "occurrence.ofType(dateTime)",
          "type": "http://hl7.org/fhir/StructureDefinition/dateTime"
        },
        {
          "name": "immunizationStatus",
          "path": "status",
          "type": "http://hl7.org/fhir/StructureDefinition/code"
        },
        {
          "name": "immunizationPatientRef",
          "path": "patient.reference.replace('Patient/', '')",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        }
      ]
    }
  ],
  "name": "Immunization",
  "status": "active",
  "resource": "Immunization"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
