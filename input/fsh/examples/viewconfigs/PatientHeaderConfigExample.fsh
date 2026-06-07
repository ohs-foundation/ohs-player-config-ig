// Example: a simple ViewConfig with boolean fields, bound to the PatientHeader view type.
Instance: PatientHeaderConfigExample
InstanceOf: ViewConfig
Usage: #example
Title: "Example: PatientHeader config"
Description: "Example runtime ViewConfig for a PatientHeader component."
* viewType = #PatientHeader
* property[0].name = "showMrn"
* property[0].type = #boolean
* property[0].valueBoolean = true
* property[1].name = "showBirthDate"
* property[1].type = #boolean
* property[1].valueBoolean = true
* property[2].name = "showStatus"
* property[2].type = #boolean
* property[2].valueBoolean = true
