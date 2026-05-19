Logical: GroupHeaderConfig
Parent: CardConfig
Id: GroupHeaderConfig
Title: "Group Header Configuration"
Description: """
Configuration for the GroupHeader component shown at the top of the household
profile screen. Controls which household and head-of-household fields are visible.
"""
* showMemberCount 0..1 boolean "Show the total number of household members"
* showHeadName    0..1 boolean "Show the head-of-household name"
