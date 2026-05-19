Logical: GroupCardConfig
Parent: CardConfig
Id: GroupCardConfig
Title: "Group Card Configuration"
Description: """
Configuration for the GroupCard component rendered in the household list screen.
Controls which household fields are visible on the card.
"""
* showMemberCount 0..1 boolean "Show the number of household members"
* showLocation    0..1 boolean "Show the household location"
