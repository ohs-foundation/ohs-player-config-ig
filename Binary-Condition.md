# Condition - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Condition**

## Binary: Condition

```

{
  "resourceType": "https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition",
  "url": "http://ohs.dev/ViewDefinition/Condition",
  "fhirVersion": [
    "4.0.1"
  ],
  "select": [
    {
      "column": [
        {
          "name": "conditionId",
          "path": "id",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "conditionCode",
          "path": "code.coding.display.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "onsetDate",
          "path": "onset.ofType(dateTime)",
          "type": "http://hl7.org/fhir/StructureDefinition/dateTime"
        },
        {
          "name": "conditionStatus",
          "path": "clinicalStatus.coding.code.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "conditionPatientRef",
          "path": "subject.reference.replace('Patient/', '')",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        }
      ]
    }
  ],
  "name": "Condition",
  "status": "active",
  "resource": "Condition"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
