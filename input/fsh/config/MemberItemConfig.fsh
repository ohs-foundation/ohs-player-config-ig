Logical: MemberItemConfig
Parent: CardConfig
Id: MemberItemConfig
Title: "Member Item Configuration"
Description: """
Configuration for the MemberItem component rendered in the household member list.
Controls which demographic fields are visible for each member row.
"""
* showAge          0..1 boolean "Show the member's calculated age"
* showGender       0..1 boolean "Show the member's gender"
* showRelationship 0..1 boolean "Show the member's relationship to the head"
