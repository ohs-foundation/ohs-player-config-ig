# Example: PatientHeader config - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example: PatientHeader config**

## Example Binary: Example: PatientHeader config

This content is an example of the [View Configuration](StructureDefinition-ViewConfig.md) Logical Model and is not a FHIR Resource

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewConfig",
  "property": [
    {
      "name": "showMrn",
      "type": "boolean",
      "valueBoolean": true
    },
    {
      "name": "showBirthDate",
      "type": "boolean",
      "valueBoolean": true
    },
    {
      "name": "showStatus",
      "type": "boolean",
      "valueBoolean": true
    }
  ],
  "viewType": "PatientHeader"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
