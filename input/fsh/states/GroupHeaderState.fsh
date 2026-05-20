Instance: GroupHeaderState
InstanceOf: ViewJoinMap
Usage: #definition
* name = "groupHeader"
* from = #root
* resource = "Group"
* view = "Group"
* joins[0].view = "RelatedPerson"
* joins[0].from = #revIncluded
* joins[0].resource = "RelatedPerson"
* joins[0].searchParam = "patient"
