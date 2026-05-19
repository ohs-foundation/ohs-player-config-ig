Each code in this system identifies a UI component factory registered in the KMP `ViewRegistry`.
When the OHS Player framework encounters a view configuration that references a given code, it
looks up the corresponding `ComponentRenderer` and delegates rendering to it.

### Code generation

The `:ig-codegen` plugin emits these codes as `val` properties on a generated `ViewTypeCS` Kotlin
object (package `dev.ohs.player.generated.viewtype`). Each property holds a `ViewType` instance
wrapping the code string:

```kotlin
object ViewTypeCS {
  val PatientCard      = ViewType("PatientCard")
  val PatientHeader    = ViewType("PatientHeader")
  val AllergyItem      = ViewType("AllergyItem")
  val MedicationItem   = ViewType("MedicationItem")
  val ConditionItem    = ViewType("ConditionItem")
  val ImmunizationItem = ViewType("ImmunizationItem")
  val SectionCard      = ViewType("SectionCard")
  val GroupCard        = ViewType("GroupCard")
  val GroupHeader      = ViewType("GroupHeader")
  val MemberItem       = ViewType("MemberItem")
}
```

### Usage in the app

Application code references `ViewTypeCS` constants rather than raw strings, giving a compile-time
guarantee that the code exists in the IG:

```kotlin
// AppViewRegistry.kt
registry.register(ViewTypeCS.PatientCard, PatientCardRenderer)
registry.register(ViewTypeCS.AllergyItem, AllergyItemRenderer)
```

### Layout types

Layout component types (`VerticalList`, `HorizontalList`, `Grid`) are owned by the OHS Player
library framework and are **not** declared in this CodeSystem. They are constants on their
respective `*Renderer` companion objects in the library.
