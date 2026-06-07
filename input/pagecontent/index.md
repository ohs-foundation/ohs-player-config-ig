# OHS Player Configuration Implementation Guide

This Implementation Guide defines a declarative contract for driving a FHIR user interface from
configuration rather than code. It is the blueprint consumed by the **OHS (Open Health Stack) Player** —
an application, built on [Open Health Stack](https://developers.google.com/open-health-stack), that
renders FHIR data on Android and other platforms.

An author describes *what* to show — which resources to project into rows, how to combine them, which
component renders each row, and how that component is configured — and a conforming OHS Player turns that
description into a screen. Nothing in this guide is specific to one application's code; any
implementation that honors these artifacts satisfies the contract.

> A ready-to-use **OHS Player reference application** demonstrates this guide end to end and is offered
> as a GitHub template you can fork to get started. The snippets below are drawn from it.

---

## Two layers: blueprint and runtime

- **Blueprint (this guide)** — the *definitional* artifacts: the `ViewJoinMap` and `ViewConfig` logical
  models, and the `SearchScope` vocabulary. These define the shapes an author writes against and change
  rarely.
- **Runtime configuration** — *instances* of those models, delivered to an OHS Player at runtime (bundled,
  database-seeded, or fetched from a server). These are an implementation's own content. This guide
  ships only **examples** of them.

A runtime artifact identifies its kind through its top-level `resourceType` (the canonical URL of the
blueprint it instantiates), so an OHS Player can distinguish a ViewDefinition from a ViewJoinMap from a
ViewConfig without inspection.

---

## Artifacts

### ViewDefinition — borrowed from SQL-on-FHIR

A [ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition-ViewDefinition.html) projects a single
FHIR resource type into flat rows using [FHIRPath](http://hl7.org/fhirpath/) column expressions. This
guide is a **consumer** of the [SQL-on-FHIR v2 specification](https://sql-on-fhir.org/ig/) — it does not
redefine ViewDefinition. The OHS Player supports the full projection surface: `where`, `forEach`,
`forEachOrNull`, `unionAll`, nested `select`, `constant`s, `collection` columns, and all FHIR primitive
column types.

### ViewJoinMap — defined here

A [ViewJoinMap](StructureDefinition-ViewJoinMap.html) stitches one or more ViewDefinitions — each applied
to a different scope of a search result — into a single flat row per *pivot* resource. The pivot drives
row count; joins append columns from related resources.

### ViewConfig — defined here

A [ViewConfig](StructureDefinition-ViewConfig.html) is the contract for declaring a UI configuration: a
`viewType` plus a list of typed `property` entries. It does not enumerate any application's concrete
configs — implementers ship their own as ViewConfig instances.

### View types — a CodeSystem

View types are codes that name the kinds of component an OHS Player can render; a ViewConfig binds to one of
them. They are an implementation's own vocabulary, expressed as a FHIR `CodeSystem`. This guide carries
an [example vocabulary](CodeSystem-view-type-codesystem.html) only.

---

## How the OHS Player renders

At runtime the OHS Player composes a screen from three inputs:

1. **State** — a flat row produced by a ViewJoinMap and its ViewDefinitions.
2. **View type** — the code that selects which component renders that state.
3. **View config** — the configuration for that view type, which tunes the component.

The OHS Player resolves a renderer for the `(state type, view type)` pair and hands it the state:

```kotlin
// OHS Player reference application — feature/patient/profile/PatientProfileScreen.kt
val registry = LocalViewRegistry.current

// Resolve renderers by (state type, view type).
val header  = registry.componentRenderer<PatientSummaryState>(ViewTypeCS.PatientHeader)
val section = registry.layoutRenderer<PatientAllergyState>(ViewTypeCS.SectionCard)
val allergy = registry.componentRenderer<PatientAllergyState>(ViewTypeCS.AllergyItem)

// Render the extracted state through the resolved renderers.
header.Render(patient, RenderOptions())
section.Render(items = allergies, component = allergy, key = { it.allergyId.orEmpty() })
```

`patient` and `allergies` are states extracted via the ViewJoinMaps; `PatientHeader`/`AllergyItem`/
`SectionCard` are view types; the configuration for each is held by the registered renderer. How an OHS Player
turns these artifacts into running UI — code generation, a renderer registry, a runtime interpreter — is
its own concern.

---

## Examples

This guide includes a worked set of examples (the configuration behind the reference application's
patient profile), one of each artifact kind:

- **ViewDefinition** — `PatientSummary`, `Allergy`, `AllergyReaction` (`where` + `forEach`),
  `PatientContact` (`forEachOrNull`), `PatientTelecom` (`unionAll`).
- **ViewJoinMap** — `PatientAllergyState` (dynamic join), `AllergyReactionState`, `GroupMemberState`.
- **ViewConfig** — `PatientHeaderConfig`, `GroupCardConfig`.
- **View types** — the example `ViewTypeCS` vocabulary.

See the [Artifacts](artifacts.html) page for the full list.

---

## FSH source layout

```
input/fsh/
├── spec/                 # Blueprint logical models (the contract)
│   ├── ViewJoinMap.fsh
│   └── ViewConfig.fsh
├── codesystems/          # Normative vocabularies
│   └── SearchScopeCS.fsh
└── examples/             # Example instances — one of each artifact kind
    ├── viewdefinitions/
    ├── viewjoinmaps/
    ├── viewconfigs/
    └── viewtypes/
```

---

## References

- [SQL-on-FHIR v2 Implementation Guide](https://sql-on-fhir.org/ig/) — the ViewDefinition specification
- [FHIRPath](http://hl7.org/fhirpath/) — the expression language used by ViewDefinition columns
- [Open Health Stack](https://developers.google.com/open-health-stack)
