Logical: PatientHeaderConfig
Parent: CardConfig
Id: PatientHeaderConfig
Title: "Patient Header Configuration"
Description: """
Configuration for the PatientHeader component shown at the top of the patient
IPS summary screen. Controls which demographic fields appear in the header.
"""
* showMrn       0..1 boolean "Show the patient's MRN identifier"
* showBirthDate 0..1 boolean "Show the patient's date of birth"
* showGender    0..1 boolean "Show the patient's gender"
* showStatus    0..1 boolean "Show the active / inactive status chip"
