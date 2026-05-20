# OHS Player Configuration IG

This Implementation Guide defines the declarative configuration contract between a FHIR server and
the [OHS Player](https://github.com/OHSFoundation/ohs-player-reference-client-app) — a Kotlin
Multiplatform UI framework for rendering FHIR clinical data on Android and other platforms.

Instead of hardcoding data models and component types in application code, authors declare them
here as FHIR artifacts. A Gradle code-generation plugin reads the compiled IG and emits typed
Kotlin classes directly into the app — no hand-written boilerplate.

---

## The Pipeline

```
┌─────────────────────────────────┐
│  FHIR Implementation Guide      │
│  (this IG — authored in FSH)    │
│                                 │
│  codesystems/ViewTypeCS.fsh     │
│  views/Allergy.fsh              │
│  states/PatientAllergyState.fsh │
│  config/AllergyItemConfig.fsh   │
└────────────────┬────────────────┘
                 │  SUSHI compiler
                 ▼
┌─────────────────────────────────┐
│  fsh-generated/resources/       │
│  CodeSystem-view-type-...json   │
│  Binary-Allergy.json            │
│  Binary-PatientAllergyState.json│
│  StructureDefinition-Allergy... │
└────────────────┬────────────────┘
                 │  :ig-codegen Gradle plugin
                 ▼
┌─────────────────────────────────┐
│  build/generated/ig-codegen/    │
│  viewtype/ViewTypeCS.kt         │
│  state/PatientAllergyState.kt   │
│  extractor/PatientAllergyExt.kt │
│  config/AllergyItemConfig.kt    │
└────────────────┬────────────────┘
                 │  consumed by
                 ▼
┌─────────────────────────────────┐
│  KMP Reference App              │
│  PatientRepository              │
│  PatientAllergyExtractor        │
│      .extract(engine, result)   │
└─────────────────────────────────┘
```

---

## Artifact Types

### ViewDefinition *(borrowed from SQL-on-FHIR)*

Defines a flat projection of a FHIR resource using FHIRPath column expressions. This IG borrows
`ViewDefinition` from the [SQL-on-FHIR v2 IG](https://sql-on-fhir.org) (`org.sql-on-fhir.ig:2.0.0`)
— we are consumers, not authors, of that spec.

Each view names the resource type it targets and declares a list of columns, each with a `name`
and a FHIRPath `path` expression. See [ViewDefinition Operations](#viewdefinition-operations) below
for the full set of supported fields.

### ViewJoinMap *(defined in this IG)*

Describes how to stitch one or more ViewDefinitions together into a single flat row per *pivot*
resource. The pivot resource drives row count; joins append columns from related resources.
The `:ig-codegen` plugin generates a `State` data class and a `StateExtractor` object from
every ViewJoinMap artifact.

See [ViewJoinMap](StructureDefinition-ViewJoinMap.html) for the full element reference.

### ViewTypeCS *(defined in this IG)*

A CodeSystem enumerating the UI component codes recognised by the KMP `ViewRegistry`. Each code
maps to a registered `ComponentRenderer` in the application. The codegen plugin emits these codes
as `val` properties on a generated `ViewTypeCS` Kotlin object.

See [ViewTypeCS](CodeSystem-view-type-codesystem.html) for all declared codes.

### Config StructureDefinitions *(defined in this IG)*

Logical models that declare the configuration fields for each UI component. The codegen plugin
flattens the inheritance chain and emits a `@Serializable data class` per leaf config. Apps
deserialise a config JSON document at startup to control component appearance.

---

## ViewDefinition Operations

The `:ig-codegen` plugin supports the following ViewDefinition fields. All features compose:
a single view can use `where` + `forEach` together, or `constant` + `collection` together.

### `select[].column[]` — flat projection *(always supported)*

The baseline. Each column has a `name`, a FHIRPath `path`, and an optional `type`.

```fsh
* select[0].column[0].name = "patientId"
* select[0].column[0].path = "id"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
```

### `select[].column[].type` — field type mapping

Controls the Kotlin type of the generated state field. Supported FHIR URI suffixes:

| FHIR type suffix | Kotlin type | `EvalResult` accessor |
|---|---|---|
| `string`, `code`, `uri`, `id`, `markdown` (default) | `String?` | `.str` |
| `boolean` | `Boolean?` | `.bool` |
| `integer`, `positiveInt`, `unsignedInt` | `Int?` | `.int` |
| `integer64` | `Long?` | `.long` |
| `decimal` | `BigDecimal?` | `.decimal` |
| `date` | `FhirDate?` | `.date` |
| `dateTime`, `instant` | `FhirDateTime?` | `.dateTime` |

### `select[].column[].collection` — repeated values

Set to `true` when the FHIRPath expression returns multiple values. The state field becomes
`List<T>` instead of `T?`. The extractor uses `engine.evalList()` and maps to the element type.

```fsh
* select[0].column[0].name = "given"
* select[0].column[0].path = "name.given"
* select[0].column[0].type = "http://hl7.org/fhir/StructureDefinition/string"
* select[0].column[0].collection = true
```

Generated field: `val given: List<String> = emptyList()`

### `constant[]` — named FHIRPath variables

Declares constants accessible in column expressions via `%name` syntax. All constant values are
passed to the FHIRPath engine as a `variables` map on every `eval` call.

```fsh
* constant[0].name = "mrnSystem"
* constant[0].valueString = "http://hospital.example/mrn"
* select[0].column[0].name = "mrn"
* select[0].column[0].path = "identifier.where(system = %mrnSystem).value.first()"
```

Supported value types: `valueString`, `valueInteger`, `valueBoolean`, `valueDecimal`.

### `where[]` — pivot filter

A top-level array of FHIRPath boolean expressions. Pivot resources where any clause evaluates to
anything other than `true` are skipped entirely before column extraction. Multiple clauses are
AND-ed. The filter runs once per pivot, before the column evaluation loop.

```fsh
* where[0].path = "clinicalStatus.coding.where(system = 'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical').code = 'active'"
```

Generated guard (one per clause):
```kotlin
if (engine.eval(allergyIntolerance, "clinicalStatus...code = 'active'").bool != true) continue
```

**Example:** `views/AllergyReaction.fsh` — restricts extraction to active allergies only.

### `select[].forEach` — row expansion

When a `SelectBlock` declares `forEach`, its column expressions are evaluated against each element
in the collection returned by the path rather than the pivot resource itself. One output row is
produced per element. Anchor columns (from other select blocks without `forEach`) are evaluated
once per pivot and repeated on every expanded row.

```fsh
* select[1].forEach = "reaction"
* select[1].column[0].name = "severity"
* select[1].column[0].path = "severity"
* select[1].column[1].name = "manifestation"
* select[1].column[1].path = "manifestation.coding.display.first()"
```

Generated inner loop:
```kotlin
val reactionList = engine.evalList(allergyIntolerance, "reaction")
for (reaction in reactionList) {
    val severity = reaction.raw?.let { engine.eval(it, "severity").str }
    val manifestation = reaction.raw?.let { engine.eval(it, "manifestation.coding.display.first()").str }
    add(AllergyReactionState(allergyId = allergyId, ..., severity = severity, manifestation = manifestation))
}
```

If the path returns zero elements, no rows are emitted for that pivot. Use `forEachOrNull` to
guarantee at least one row.

**Example:** `views/AllergyReaction.fsh` — one row per reaction entry on each active allergy.

### `select[].forEachOrNull` — row expansion with null fallback

Identical to `forEach` but guarantees that the pivot always contributes at least one output row:
when the path returns an empty collection, one row is emitted with all expansion columns set to
null (LEFT JOIN semantics). Anchor and join columns are populated normally on the null row.

```fsh
* select[1].forEachOrNull = "contact"
* select[1].column[0].name = "contactGivenName"
* select[1].column[0].path = "name.given.first()"
```

Generated loop with null fallback:
```kotlin
val contactList = engine.evalList(patient, "contact").ifEmpty { listOf(null) }
for (contact in contactList) {
    val contactGivenName = contact?.raw?.let { engine.eval(it, "name.given.first()").str }
    add(PatientContactState(patientId = patientId, contactGivenName = contactGivenName, ...))
}
```

A patient with no recorded contacts produces one row with `patientId` populated and all
`contact*` fields null. A patient with two contacts produces two rows.

**Example:** `views/PatientContact.fsh` — ensures every patient appears at least once.

### `select[].unionAll[]` — multiple row shapes merged

A `SelectBlock` may contain a `unionAll` array instead of `column`. Each inner block must declare
the **same column names** (they form the same schema). The extractor emits one row per inner block,
all using the same state class. Anchor columns from other select blocks are captured in the
enclosing scope and reused on every `unionAll` row.

Each inner block is wrapped in a Kotlin `run { }` scope so local variable names don't clash.

```fsh
* select[1].unionAll[0].column[0].name = "telecomSystem"
* select[1].unionAll[0].column[0].path = "telecom.where(system = 'phone').system.first()"
* select[1].unionAll[0].column[1].name = "telecomValue"
* select[1].unionAll[0].column[1].path = "telecom.where(system = 'phone').value.first()"
* select[1].unionAll[1].column[0].name = "telecomSystem"
* select[1].unionAll[1].column[0].path = "telecom.where(system = 'email').system.first()"
* select[1].unionAll[1].column[1].name = "telecomValue"
* select[1].unionAll[1].column[1].path = "telecom.where(system = 'email').value.first()"
```

Generated output — two `add()` calls per pivot, one per block:
```kotlin
// unionAll block 0
run {
    val telecomSystem = engine.eval(patient, "telecom.where(system = 'phone').system.first()").str
    val telecomValue  = engine.eval(patient, "telecom.where(system = 'phone').value.first()").str
    add(PatientTelecomState(patientId = patientId, telecomSystem = telecomSystem, telecomValue = telecomValue))
}
// unionAll block 1
run {
    val telecomSystem = engine.eval(patient, "telecom.where(system = 'email').system.first()").str
    val telecomValue  = engine.eval(patient, "telecom.where(system = 'email').value.first()").str
    add(PatientTelecomState(patientId = patientId, telecomSystem = telecomSystem, telecomValue = telecomValue))
}
```

**Example:** `views/PatientTelecom.fsh` — one row per telecom system (phone + email).

---

## End-to-End Example

The following walkthrough traces a single concept — **patient allergies** — from FSH declaration
through to a populated Kotlin state object, using the sample data bundled with the reference app.

### Step 1 — Declare the pivot ViewDefinition

`views/Allergy.fsh` describes the columns to extract from each `AllergyIntolerance` resource:

```fsh
Instance: Allergy
InstanceOf: ViewDefinition
Usage: #definition
* name = "Allergy"
* resource = #AllergyIntolerance
* fhirVersion = #4.0.1
* select[0].column[0].name = "allergyId"
* select[0].column[0].path = "id"
* select[0].column[1].name = "substance"
* select[0].column[1].path = "code.coding.display.first()"
* select[0].column[2].name = "criticality"
* select[0].column[2].path = "criticality"
* select[0].column[3].name = "allergyStatus"
* select[0].column[3].path = "clinicalStatus.coding.code.first()"
* select[0].column[4].name = "allergyPatientRef"
* select[0].column[4].path = "patient.reference.replace('Patient/', '')"
```

### Step 2 — Declare the ViewJoinMap

`states/PatientAllergyState.fsh` joins the allergy columns with patient demographics:

```fsh
Instance: PatientAllergyState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "patientAllergy"
* from = #revIncluded
* resource = "AllergyIntolerance"
* view = "Allergy"
* joins[0].view = "PatientSummary"
* joins[0].from = #included
* joins[0].resource = "Patient"
* joins[0].searchParam = "patient"
* joins[0].matchKey = "allergyPatientRef"
```

The pivot iterates over `AllergyIntolerance` resources from `revIncluded`. For each allergy, the
extractor looks up the matching `Patient` in `included` using `allergyPatientRef` as the join key.

### Step 3 — Generated Kotlin

SUSHI compiles the FSH to `Binary-PatientAllergyState.json`. The codegen plugin reads that file
and emits two Kotlin artifacts:

**`state/PatientAllergyState.kt`** — a flat `@Serializable` data class merging allergy +
patient columns:

```kotlin
@Serializable
@JoinMap(
  pivot = Scope(resource = "AllergyIntolerance", from = "revIncluded"),
  joins = [Scope(resource = "Patient", from = "included",
                 searchParam = "patient", matchKey = "allergyPatientRef")],
)
data class PatientAllergyState(
  @FhirPath(expression = "id",                          resource = "AllergyIntolerance")
  val allergyId: String? = null,
  @FhirPath(expression = "code.coding.display.first()", resource = "AllergyIntolerance")
  val substance: String? = null,
  @FhirPath(expression = "criticality",                 resource = "AllergyIntolerance")
  val criticality: String? = null,
  @FhirPath(expression = "clinicalStatus.coding.code.first()", resource = "AllergyIntolerance")
  val allergyStatus: String? = null,
  @FhirPath(expression = "patient.reference.replace('Patient/', '')", resource = "AllergyIntolerance")
  val allergyPatientRef: String? = null,
  // --- joined Patient columns ---
  @FhirPath(expression = "id",               resource = "Patient") val patientId: String? = null,
  @FhirPath(expression = "name.family.first()", resource = "Patient") val familyName: String? = null,
  @FhirPath(expression = "name.given.first()",  resource = "Patient") val givenName: String? = null,
  // ... remaining Patient columns
)
```

**`extractor/PatientAllergyExtractor.kt`** — evaluates FHIRPath expressions against a
`SearchResult` and returns `List<PatientAllergyState>`. Join columns are pre-evaluated once
per unique joined resource before the pivot loop, so the number of FhirPath engine calls is
`O(patients) + O(allergies)` rather than `O(patients × allergies)`.

### Step 4 — Sample FHIR data → populated state

Given this `AllergyIntolerance` from the reference app sample bundle:

```json
{
  "resourceType": "AllergyIntolerance",
  "id": "ai-p1-a",
  "patient": { "reference": "Patient/p1" },
  "code": { "coding": [{ "display": "Penicillin" }] },
  "criticality": "high",
  "clinicalStatus": {
    "coding": [{ "code": "active" }]
  }
}
```

...and this `Patient` in `included`:

```json
{
  "resourceType": "Patient",
  "id": "p1",
  "name": [{ "family": "Diallo", "given": ["Amina"] }],
  "gender": "female",
  "birthDate": "1990-03-14",
  "active": true,
  "identifier": [{ "type": { "coding": [{ "code": "MR" }] }, "value": "MRN-2015-0342" }]
}
```

`PatientAllergyExtractor.extract(engine, result)` produces:

```kotlin
PatientAllergyState(
  allergyId      = "ai-p1-a",
  substance      = "Penicillin",
  criticality    = "high",
  allergyStatus  = "active",
  allergyPatientRef = "p1",
  patientId      = "p1",
  familyName     = "Diallo",
  givenName      = "Amina",
  gender         = "female",
  birthDate      = FhirDate("1990-03-14"),
  active         = true,
  mrn            = "MRN-2015-0342",
  phone          = null,
)
```

---

## FSH Directory Structure

```
input/fsh/
├── codesystems/
│   ├── SearchScopeCS.fsh          # SearchScopeCS CodeSystem + SearchScopeVS ValueSet
│   └── ViewTypeCS.fsh             # UI component type vocabulary
├── config/                        # @Serializable config StructureDefinitions (one per component)
│   ├── ViewConfig.fsh             # Base: padding
│   ├── CardConfig.fsh             # Extends ViewConfig: + elevation, cornerRadius
│   ├── PatientCardConfig.fsh      # Extends CardConfig: + showStatusChip, showAge, showGender
│   ├── PatientHeaderConfig.fsh
│   ├── AllergyItemConfig.fsh
│   ├── MedicationItemConfig.fsh
│   ├── ConditionItemConfig.fsh
│   ├── ImmunizationItemConfig.fsh
│   ├── SectionCardConfig.fsh
│   ├── GroupCardConfig.fsh
│   ├── GroupHeaderConfig.fsh
│   └── MemberItemConfig.fsh
├── spec/
│   └── ViewJoinSpec.fsh           # ViewJoinMap Logical model
├── views/                         # ViewDefinition instances (one per resource projection)
│   ├── PatientSummary.fsh         # Patient — flat demographics (anchor view)
│   ├── Allergy.fsh                # AllergyIntolerance — flat columns
│   ├── AllergyReaction.fsh        # AllergyIntolerance — where + forEach (reactions)
│   ├── Medication.fsh             # MedicationRequest — flat columns
│   ├── Condition.fsh              # Condition — flat columns
│   ├── Immunization.fsh           # Immunization — flat columns
│   ├── PatientContact.fsh         # Patient — forEachOrNull (emergency contacts)
│   ├── PatientTelecom.fsh         # Patient — unionAll (phone + email rows)
│   ├── Group.fsh                  # Group — flat columns
│   ├── Member.fsh                 # Patient — flat columns (household member)
│   └── RelatedPerson.fsh          # RelatedPerson — flat columns (head of household)
└── states/                        # ViewJoinMap instances (one per generated State class)
    ├── PatientSummaryState.fsh    # root Patient
    ├── PatientAllergyState.fsh    # revIncluded AllergyIntolerance + Patient join
    ├── AllergyReactionState.fsh   # revIncluded AllergyIntolerance (where+forEach) + Patient join
    ├── PatientConditionState.fsh  # revIncluded Condition + Patient join
    ├── PatientMedicationState.fsh # revIncluded MedicationRequest + Patient join
    ├── PatientImmunizationState.fsh # revIncluded Immunization + Patient join
    ├── PatientContactState.fsh    # root Patient (forEachOrNull contacts)
    ├── PatientTelecomState.fsh    # root Patient (unionAll phone+email)
    ├── GroupListState.fsh         # root Group
    ├── GroupHeaderState.fsh       # root Group + static RelatedPerson join
    └── GroupMemberState.fsh       # included Patient + RelatedPerson join
```

---

## Codegen Setup

The `:ig-codegen` Gradle plugin reads the compiled IG artifacts from `fsh-generated/resources/`.
The IG path is resolved in this order:

1. Gradle property `ohs.ig.dir` — set via `-Pohs.ig.dir=<path>` or `gradle.properties`
2. `local.properties` key `ohs.ig.dir` — machine-local, gitignored
3. Fallback: sibling directory `../ohs-sample-ig/fsh-generated/resources`

Run SUSHI before invoking the codegen task:

```bash
cd ~/path/to/ohs-sample-ig
npx fsh-sushi .
./gradlew :ohs-player-library:generateIgCode
```
