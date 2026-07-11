## ADDED Requirements

### Requirement: Donation Screen Access and UI
The system SHALL provide access to a dedicated "Doar" (Donation) screen from a button on the main screen. This screen SHALL display a thank-you message, a QR Code image placeholder, a button to copy the PIX key, and external buttons/links.

#### Scenario: Navigate to Donation Screen
- **WHEN** the user taps the "Doar" button on the main screen
- **THEN** the system SHALL navigate to the Donation Screen showing the donation details

### Requirement: PIX Key Clipboard Copy
The system SHALL allow the user to copy the developer's PIX key to the device clipboard and show a confirmation notification (Snackbar or Toast).

#### Scenario: Copy PIX Key
- **WHEN** the user taps the "Copiar Chave PIX" button
- **THEN** the system SHALL copy the string `00020101021126580014br.gov.bcb.pix0136d5c8a37d-77c7-49e0-8925-694adcd79cf35204000053039865802BR5916JOELTON LINO LUZ6008VARGINHA62070503***63040D6C` to the device clipboard and show a success message

### Requirement: External Links Integration
The system SHALL provide buttons to open external links for the WhatsApp community and the developer's LinkedIn profile.

#### Scenario: Open WhatsApp Community
- **WHEN** the user taps the "Comunidade WhatsApp" button
- **THEN** the system SHALL launch the URL `https://chat.whatsapp.com/HzgGW1xdWByHnbGkHHKRDn` in an external browser or WhatsApp application

#### Scenario: Open LinkedIn Profile
- **WHEN** the user taps the "LinkedIn do Desenvolvedor" button
- **THEN** the system SHALL launch the URL `https://www.linkedin.com/in/joeltonluz` in an external browser or LinkedIn application
