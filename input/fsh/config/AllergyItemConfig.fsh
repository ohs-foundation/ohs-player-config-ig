Logical: AllergyItemConfig
Parent: CardConfig
Id: AllergyItemConfig
Title: "Allergy Item Configuration"
Description: """
Configuration for the AllergyItem component rendered inside the Allergies section.
"""
* showCriticality 0..1 boolean "Show the criticality badge (color-coded: high / moderate / low)"
* showStatus 0..1 boolean "Show the clinical status of the allergy"
