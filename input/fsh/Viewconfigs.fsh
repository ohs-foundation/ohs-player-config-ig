// Base Configuration
Logical: ViewConfig
Id: ViewConfig
Title: "Base UI Configuration"
Description: "Abstract base for all UI component styling configurations."
* padding 0..1 decimal "Default padding in DP"

// Card-Specific Configuration
Logical: CardConfig
Parent: ViewConfig
Id: CardConfig
Title: "Card Configuration"
Description: "Configuration parameters for Card-based UI components."
* elevation 0..1 decimal "Shadow elevation depth in DP"
* cornerRadius 0..1 decimal "Corner rounding radius"

// Text-Specific Configuration
Logical: TextConfig
Parent: ViewConfig
Id: TextConfig
Title: "Text Configuration"
Description: "Configuration parameters for Text-based UI components."
* textSize 0..1 decimal "Font size in SP"
* fontWeight 0..1 string "Weight: Bold, Normal, or Light"
