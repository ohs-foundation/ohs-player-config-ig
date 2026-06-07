Each code in this system names a **view type** — a kind of UI component used to render a piece of
FHIR-derived data. A [ViewConfig](StructureDefinition-ViewConfig.html) references one of these codes
(via its `viewType` field) to declare which component it configures.

### How an OHS Player uses a view type

At runtime an OHS Player binds three things to produce a rendered view:

1. the **state** extracted from a SearchResult (see [ViewJoinMap](StructureDefinition-ViewJoinMap.html)
   and [ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition-ViewDefinition.html)),
2. the **view type** code, which selects the component, and
3. the **ViewConfig** for that view type, which tunes the component's appearance and behavior.

How an OHS Player maps a view-type code to a concrete renderer — a registry, a factory, a switch — is an
implementation detail. This CodeSystem only fixes the shared vocabulary so configs and implementations agree on
the same names. A different implementation can satisfy the same contract in its own way.

### Layout view types

Generic layout view types (e.g. vertical list, grid) that arrange a collection of items are typically
owned by the OHS Player framework rather than declared here, since they are not data-specific.
