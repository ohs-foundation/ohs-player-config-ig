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
