## 1. Project Configuration and Dependencies

- [ ] 1.1 Add required dependencies to pubspec.yaml (flutter_bloc, get_it, shared_preferences, share_plus, url_launcher)
- [ ] 1.2 Configure iOS Info.plist and AndroidManifest.xml with url_launcher queries for links and sharing schemes
- [ ] 1.3 Create the Clean Architecture folder structure under lib/ (core, features, features/beer_comparator, features/preferences, features/donation)

## 2. Core Infrastructure & Preferences Feature

- [ ] 2.1 Define Light and Dark MaterialApp themes in core/theme/app_theme.dart
- [ ] 2.2 Create PreferencesLocalDataSource interface and SharedPreferences implementation for theme persistence
- [ ] 2.3 Create PreferencesRepository and implementations to get/save theme preferences
- [ ] 2.4 Create SaveThemeUseCase and GetThemeUseCase in domain layer
- [ ] 2.5 Implement ThemeCubit to manage the current theme state and handle toggling
- [ ] 2.6 Initialize Dependency Injection setup with GetIt in core/di/injection.dart

## 3. Beer Comparator Feature - Data and Domain Layers

- [ ] 3.1 Create Beer entity in domain/entities/beer.dart with calculated price per liter and sorting/comparison properties
- [ ] 3.2 Create BeerModel in data/models/beer_model.dart with JSON serialization helpers
- [ ] 3.3 Create BeerLocalDataSource interface and SharedPreferences-backed implementation
- [ ] 3.4 Create BeerRepository interface in domain layer and implementation in data layer
- [ ] 3.5 Create GetBeersUseCase, SaveBeerUseCase, DeleteBeerUseCase, and ClearBeersUseCase in domain layer

## 4. Beer Comparator Feature - Presentation Layer

- [ ] 4.1 Implement BeerComparatorBloc (or Cubit) managing list loading, adding, deleting, and clearing
- [ ] 4.2 Build BeerForm widget to validate inputs (positive, non-zero price and volume) and dispatch Add Beer event
- [ ] 4.3 Build BeerListItem widget displaying name, volume, price, price per liter, and individual delete button
- [ ] 4.4 Build BeerList widget sorting items by price/L, highlighting the first item as the best deal
- [ ] 4.5 Implement comparison sharing formatter and integration with share_plus in presentation layer or a helper

## 5. Donation Feature

- [ ] 5.1 Build DonationPage showing thank-you text, a placeholder image/icon for PIX QR code, and developer links
- [ ] 5.2 Implement copy-to-clipboard logic for PIX key using standard Clipboard API, displaying a Toast or Snackbar notification
- [ ] 5.3 Implement WhatsApp community link launch button with url_launcher
- [ ] 5.4 Implement LinkedIn developer link launch button with url_launcher

## 6. Integration and Quality Verification

- [ ] 6.1 Connect ThemeCubit and BeerComparatorBloc in main.dart and configure multi-provider/multi-bloc integration
- [ ] 6.2 Build main scaffold/navigation to switch between the main comparison page and the donation page
- [ ] 6.3 Write unit tests for Beer entity calculation logic, sorting, and validation logic
- [ ] 6.4 Run linter, compiler checks, and ensure application builds correctly with zero errors
