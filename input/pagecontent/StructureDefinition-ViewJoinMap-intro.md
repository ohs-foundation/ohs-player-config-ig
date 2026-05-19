A `ViewJoinMap` describes how to assemble a flat state row by joining columns from multiple
[ViewDefinition](https://sql-on-fhir.org/ig/StructureDefinition/ViewDefinition.html) projections,
each sourced from a different scope of a FHIR `SearchResult`.

### Concepts

**Pivot** — the resource type that drives row count. One output row is produced per pivot resource
instance. The pivot scope is one of `root` (the primary search result resource), `included`
(forward-included resources), or `revIncluded` (reverse-included resources).

**Join** — a secondary ViewDefinition whose columns are appended to every pivot row.
- *Static join* (no `matchKey`): the join resource is the same for all pivot rows. Columns are
  evaluated once and shared across the output list.
- *Dynamic join* (with `matchKey`): each pivot row carries a foreign-key column that identifies
  which joined resource to merge. The extractor builds a lookup map keyed by joined resource ID
  before the pivot loop, so each unique joined resource is evaluated exactly once regardless of
  how many pivot rows reference it.

### The `name` field and code generation

The `name` field becomes the base name for the generated Kotlin `State` data class and
`StateExtractor` object. The SUSHI `Instance:` name must match the generated class name exactly —
by convention both use PascalCase with a `State` suffix (e.g. `PatientAllergyState`).

### Example — GroupMemberState

One row per household member (`Patient` from `included` via `"member"` search param), enriched
with head-of-household identity from a `RelatedPerson` matched by `relatedPersonLink`:

```fsh
Instance: GroupMemberState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "groupMember"
* from = #included
* resource = "Patient"
* view = "Member"
* searchParam = "member"
* joins[0].view = "RelatedPerson"
* joins[0].from = #revIncluded
* joins[0].resource = "RelatedPerson"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "relatedPersonLink"
```

Given a group with members `Patient/p1` and `Patient/p3`, and a `RelatedPerson/rp1` linked to
`Patient/p1`, the extractor produces two rows: one for each member, with `RelatedPerson` columns
populated only for the member that has a matching `relatedPersonLink` value.

### SearchScope reference

| Code | Description |
|------|-------------|
| `root` | The primary resource returned by the search query |
| `included` | Resources returned via forward include (`_include`) |
| `revIncluded` | Resources returned via reverse include (`_revinclude`) |
