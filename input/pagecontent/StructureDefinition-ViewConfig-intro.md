`ViewConfig` is the **contract for declaring a UI configuration** — not a concrete config. It lets an
implementer describe a config's fields generically, so the IG never has to enumerate one application's
configs.

### Shape

A ViewConfig has a `viewType` (the binding key to a component) and a list of `property` entries. Each
property declares one field: its `name`, its `type` (a FHIR primitive — `boolean`, `decimal`,
`integer`, `string`, …), and an optional default `value[x]`.

```fsh
Instance: PatientHeaderConfigExample
InstanceOf: ViewConfig
Usage: #definition
* viewType = #PatientHeader
* property[0].name = "showMrn"
* property[0].type = #boolean
* property[0].valueBoolean = true
* property[1].name = "elevation"
* property[1].type = #decimal
* property[1].valueDecimal = 2.0
```

The Binary is **self-describing**: the property `type`s give an OHS Player everything it needs to produce a
typed config, and the `value`s give the defaults.

### How it maps in the OHS Player view-render world

An OHS Player renders by binding three runtime inputs:

1. **State** — a flat row produced by a [ViewJoinMap](StructureDefinition-ViewJoinMap.html) and its
   [ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition-ViewDefinition.html)s.
2. **View type** — a code (from the implementer's view-type CodeSystem) that selects *which* component
   renders the state.
3. **ViewConfig** — the config for that `viewType`, which tunes the component. The OHS Player turns the
   `property[]` into a typed config and passes the values to the renderer.

So `viewType` is the join between a config and the component it configures: `state + viewType +
ViewConfig → rendered UI`. How an OHS Player turns these into actual UI — code generation, a renderer
registry, a runtime interpreter — is its own concern. The IG fixes only the shapes; any conformant
implementation meets the same objective.

### Runtime delivery

ViewConfigs are **runtime configuration**: authored against this model and delivered to an OHS Player at
runtime (database seed, runtime API, or a client repository). This IG ships only examples; an
implementer provides its own.
