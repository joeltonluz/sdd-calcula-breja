## ADDED Requirements

### Requirement: Beer Input Validation
The system SHALL validate that Volume (ml) and Price (R$) are both provided, positive, and greater than zero before adding a beer. The Name/Brand SHALL be optional.

#### Scenario: Valid inputs
- **WHEN** the user provides "Brahma", Volume "350", Price "3.99" and taps "Adicionar"
- **THEN** the system adds the beer to the list and recalculates the rankings

#### Scenario: Missing required inputs
- **WHEN** the user provides "Brahma" but leaves Volume or Price blank and taps "Adicionar"
- **THEN** the system SHALL show an input validation error message and prevent adding to the list

### Requirement: Cost-per-Liter Calculation
The system SHALL automatically calculate the value per liter of each beer added using the formula: `Value per liter = (Price / Volume) * 1000`.

#### Scenario: Correct calculation of value per liter
- **WHEN** a beer with Volume "350" and Price "3.99" is calculated
- **THEN** the system SHALL calculate the price per liter as "11.40" (rounded to 2 decimal places)

### Requirement: Sorted Comparison List and Highlight
The list of beers SHALL be ordered automatically in ascending order by the value per liter. The item in the first position (index 0) SHALL receive a distinct visual highlight indicating it is the best cost-benefit choice.

#### Scenario: List sorting and best choice highlight
- **WHEN** the list contains "Heineken 330ml @ 4.99" (15.12/L) and "Brahma 350ml @ 3.99" (11.40/L)
- **THEN** "Brahma" SHALL be placed first in the list and display a prominent "Melhor Custo-Benefício" highlight, while "Heineken" is placed second

### Requirement: Action Deletion and Clear List
The system SHALL allow the user to delete any individual item from the comparison list, or clear the entire list at once.

#### Scenario: Delete single beer
- **WHEN** the user taps the delete button of an item in the list
- **THEN** the system SHALL remove that item from the list and immediately update the remaining items' rankings and highlight

#### Scenario: Clear all beers
- **WHEN** the user taps the "Limpar lista" button
- **THEN** the system SHALL remove all beers from the list and show an empty state

### Requirement: Share Comparison
The system SHALL generate a shareable text compilation of the beer comparison list, ordered from best to worst, highlighting the item with the best cost-benefit.

#### Scenario: Share comparison list
- **WHEN** the user taps the "Compartilhar" button
- **THEN** the system SHALL launch the native share sheet with formatted text showing each beer's ranking, name, volume, price, value per liter, and final recommendation
