# Member - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Member**

## Binary: Member

```

{
  "resourceType": "https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition",
  "url": "http://ohs.dev/ViewDefinition/Member",
  "fhirVersion": [
    "4.0.1"
  ],
  "select": [
    {
      "column": [
        {
          "name": "memberId",
          "path": "id",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "memberGivenName",
          "path": "name.given.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "memberFamilyName",
          "path": "name.family.first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        },
        {
          "name": "memberGender",
          "path": "gender",
          "type": "http://hl7.org/fhir/StructureDefinition/code"
        },
        {
          "name": "memberBirthDate",
          "path": "birthDate",
          "type": "http://hl7.org/fhir/StructureDefinition/date"
        },
        {
          "name": "relatedPersonLink",
          "path": "link.where(type = 'seealso').other.reference.replace('RelatedPerson/', '').first()",
          "type": "http://hl7.org/fhir/StructureDefinition/string"
        }
      ]
    }
  ],
  "name": "Member",
  "status": "active",
  "resource": "Patient"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
