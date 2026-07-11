## ADDED Requirements

### Requirement: Theme Selection and Persistence
The system SHALL support Light and Dark themes, allow the user to toggle between them, and persist the selected theme locally so that it is restored on subsequent application launches.

#### Scenario: Toggle and persist dark theme
- **WHEN** the user selects Dark Theme in the system preferences
- **THEN** the system SHALL immediately switch the application UI to dark mode and save this preference locally

#### Scenario: Restore theme on launch
- **WHEN** the application is opened
- **THEN** the system SHALL read the persisted theme preference (defaulting to system theme or light theme if none is saved) and apply it to the application UI

### Requirement: Comparison List Persistence
The system SHALL automatically persist the current list of beers in the local storage whenever a beer is added, deleted, or when the list is cleared, and restore this list on subsequent application launches.

#### Scenario: Restore beer list on launch
- **WHEN** the application is opened and a previously saved beer list exists
- **THEN** the system SHALL load and display the sorted beer list automatically
