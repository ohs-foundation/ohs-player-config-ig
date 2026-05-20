Logical: PatientCardConfig
Parent: CardConfig
Id: PatientCardConfig
Title: "Patient Card Configuration"
Description: """
Configuration for the PatientCard component rendered in the patient list screen.
Controls which demographic fields are visible on the card.
"""
* showStatusChip 0..1 boolean "Show the active / inactive status chip"
* showAge 0..1 boolean "Show the patient's calculated age"
* showGender 0..1 boolean "Show the patient's gender"
