// Example: a card ViewConfig mixing boolean and decimal fields, bound to the GroupCard view type.
Instance: GroupCardConfigExample
InstanceOf: ViewConfig
Usage: #example
Title: "Example: GroupCard config"
Description: "Example runtime ViewConfig for a GroupCard component."
* viewType = #GroupCard
* property[0].name = "showMemberCount"
* property[0].type = #boolean
* property[0].valueBoolean = true
* property[1].name = "elevation"
* property[1].type = #decimal
* property[1].valueDecimal = 2.0
* property[2].name = "padding"
* property[2].type = #decimal
* property[2].valueDecimal = 16.0
