// ============================================================================
// ViewConfig — the meta-model for a UI configuration.
//
// This is BLUEPRINT, not a concrete config. It defines HOW an implementer
// declares a config: a view type to bind to, plus a list of typed properties.
// Implementers ship concrete configs as ViewConfig Binary instances (runtime),
// each declaring its own properties — the IG does not enumerate them.
// ============================================================================

Logical: ViewConfig
Id: ViewConfig
Title: "View Configuration"
Description: """
A self-describing UI configuration bound to a view type.

`ViewConfig` is the contract for declaring a config — it does **not** fix any particular config's
fields. An implementer provides a config as a `ViewConfig` Binary that lists its own `property`
entries; each property gives a field `name`, its `type`, and a default `value`. A player generates a
typed config class from the property list and binds the values to the renderer selected by `viewType`.
"""
* viewType 1..1 code "View type this config parameterizes — the binding key to a component."
* property 0..* BackboneElement "One configuration field."
  * name 1..1 string "Field name (becomes a property on the generated config)."
  * type 1..1 code "FHIR primitive type of the field, e.g. boolean | decimal | integer | string."
  * value[x] 0..1 boolean or integer or decimal or string "Default value for the field."
