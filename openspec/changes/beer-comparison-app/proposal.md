## Why

Users currently lack a quick and automated way to compare the cost-benefit of different beer brands and sizes (volume) by calculating and comparing the price per liter. This application will solve this problem by enabling fast, offline beer cost-per-liter comparison with persistent storage, theme choices, sharing capabilities, and developer donation support.

## What Changes

- Add a beer comparator feature allowing users to input beer details (optional name/brand, volume, price) and view an automatically ordered comparison list sorted by price per liter.
- Add sharing capability to allow users to share the sorted beer list via text sharing plugins.
- Add local persistence of the beer list, user preferences, and theme preferences so data is kept across app restarts.
- Add theme selection (Light Theme and Dark Theme) that is fully persistent.
- Add a Donation screen with a thank-you message, PIX QR Code placeholder, option to copy PIX key, WhatsApp community link, and Developer LinkedIn link.

## Capabilities

### New Capabilities

- `beer-comparator`: Main calculator and list sorting functionality, including item deletion, list clearing, and text sharing.
- `preferences-theme`: Persistent system of user preferences, including Light/Dark theme switching.
- `donation-screen`: Separate screen displaying donation instructions, PIX key copy, WhatsApp community, and developer LinkedIn links.

### Modified Capabilities


## Impact

- **Dependencies**: Introduces packages for state management (e.g., `flutter_bloc` or `provider`), local storage/database (e.g., `shared_preferences` or `hive`/`isar`), dependency injection (`get_it`), and utility packages like `share_plus` (for sharing) and `url_launcher` (for opening links).
- **Architecture**: Implements Clean Architecture with feature-first structure (Data, Domain, Presentation layers), SOLID, DDD adaptations, and repository patterns.
- **UI**: Implements dynamic MaterialApp configuration utilizing Light and Dark themes.
