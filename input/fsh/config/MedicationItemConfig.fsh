Logical: MedicationItemConfig
Parent: CardConfig
Id: MedicationItemConfig
Title: "Medication Item Configuration"
Description: """
Configuration for the MedicationItem component rendered inside the Medications section.
"""
* showStatus 0..1 boolean "Show the medication status chip"
* showDosage 0..1 boolean "Show the dosage instruction text"
* compact 0..1 boolean "Use a single-line compact display mode"
