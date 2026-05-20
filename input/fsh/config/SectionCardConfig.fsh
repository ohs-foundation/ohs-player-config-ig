Logical: SectionCardConfig
Parent: CardConfig
Id: SectionCardConfig
Title: "Section Card Configuration"
Description: """
Configuration for the SectionCard wrapper component that groups related items
under a titled card with an optional item count badge.
"""
* showItemCount 0..1 boolean "Show the item count badge next to the section title"
* collapsible 0..1 boolean "Allow the section to be collapsed / expanded by the user"
