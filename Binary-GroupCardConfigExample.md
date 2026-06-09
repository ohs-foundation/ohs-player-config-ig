# Example: GroupCard config - OHS Player Configuration IG v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example: GroupCard config**

## Example Binary: Example: GroupCard config

This content is an example of the [View Configuration](StructureDefinition-ViewConfig.md) Logical Model and is not a FHIR Resource

```

{
  "resourceType": "http://ohs.dev/StructureDefinition/ViewConfig",
  "property": [
    {
      "name": "showMemberCount",
      "type": "boolean",
      "valueBoolean": true
    },
    {
      "name": "elevation",
      "type": "decimal",
      "valueDecimal": 2
    },
    {
      "name": "padding",
      "type": "decimal",
      "valueDecimal": 16
    }
  ],
  "viewType": "GroupCard"
}

```



## Resource Binary Content

application/fhir+json:

```
{snip}
```
