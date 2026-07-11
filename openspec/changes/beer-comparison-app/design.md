## Context

This project aims to build a modern, scalable, and fully testable Flutter application for beer cost-per-liter comparison. To ensure maintainability, clear separation of concerns, and readiness for unit/widget testing, the codebase will adhere to Clean Architecture principles adapted to Domain-Driven Design (DDD) on a Feature-by-Feature directory structure.

## Goals / Non-Goals

**Goals:**
- Implement Clean Architecture + DDD + SOLID principles.
- Use a feature-by-feature layout to divide code into modular units (`beer_comparator`, `preferences`, and `donation`).
- Isolate business logic from UI frameworks and device-specific integrations.
- Suggest and integrate proven, production-grade pub.dev packages for state management, persistence, and OS-level operations.
- Ensure all business logic layers are decoupled and 100% prepared for unit testing.
- Support both Light and Dark themes persistently.

**Non-Goals:**
- Back-end or cloud-based server integration (the application is strictly offline and local-first).
- Native payment gateways or Apple Pay/Google Pay integration for donations (donations are completed externally via PIX key copy/paste or QR Code).

## Decisions

### 1. State Management: BLoC / Cubit (`flutter_bloc`)
- **Decision**: Use `flutter_bloc` for UI state management.
- **Rationale**: BLoC offers strict separation between UI events and state changes, fits exceptionally well into Clean Architecture's flow (Presentation -> UseCase), is highly testable using `bloc_test`, and prevents UI widgets from containing business logic.
- **Alternatives Considered**: 
  - `Provider`/`ChangeNotifier`: Simpler, but lacks strict unidirectional flow constraints and makes it easier to bleed business logic into presentation layers.
  - `Riverpod`: Powerful, but has a higher learning curve and doesn't separate events/states as rigidly as BLoC does out-of-the-box.

### 2. Dependency Injection: Service Locator (`get_it`)
- **Decision**: Use `get_it` to register and resolve all dependencies (Blocs, Use Cases, Repositories, Data Sources).
- **Rationale**: `get_it` is a fast, lightweight, and easy-to-use service locator. It decouples interface definitions from implementations, enabling mock injections during testing.
- **Alternatives Considered**:
  - `Provider` (as DI): Mixes dependency lookup with the widget tree.
  - `manual constructor injection`: Extremely verbose and hard to maintain as the dependency tree grows.

### 3. Local Persistence: `shared_preferences`
- **Decision**: Use `shared_preferences` to persist both user preferences (theme) and the beer comparison list (serialized to/from JSON).
- **Rationale**: The database requirements are minimal: simple key-value configurations and a single list of beers. `shared_preferences` is robust, native, and has zero overhead compared to full databases like Hive or Isar.
- **Alternatives Considered**:
  - `Hive` / `Isar`: High-performance NoSQL options, but overkill for this lightweight application, introducing unnecessary complexity and build generation steps.
  - `SQLite`: Extremely heavy for simple key-value/list operations.

### 4. Code Organization: Feature-First Structure
- **Decision**: Structure the `lib/` folder by high-level features.
- **Rationale**: Organizing by features makes the codebase highly modular, easier to navigate as it grows, and matches DDD practices where domain models and use cases live near their respective functional boundaries.
- **Structure Pattern**:
  ```text
  lib/
  ├── core/                 # Shared resources, themes, DI setup
  │   ├── di/
  │   ├── theme/
  │   └── utils/
  └── features/             # Business features
      ├── beer_comparator/
      │   ├── data/         # Models, Repository Impls, DataSources
      │   ├── domain/       # Entities, Repositories, Use Cases
      │   └── presentation/ # Blocs, Pages, Widgets
      ├── preferences/
      │   └── ...           # Theme toggle and settings persistence
      └── donation/
          └── ...           # Donation page, links, PIX key utilities
  ```

### 5. Standard Packages for Native Operations
- **Decision**: 
  - Sharing: `share_plus`
  - URL Launching: `url_launcher`
  - Clipboard Copy: Flutter Framework standard `Clipboard` (from `package:flutter/services.dart`)
- **Rationale**: Standard, well-maintained packages recommended by the Flutter ecosystem that resolve OS-specific differences seamlessly. Using Flutter's built-in `Clipboard` prevents unnecessary external dependencies.

## Risks / Trade-offs

- **[Risk] State Serialization overhead**: Serializing the entire beer list to/from a JSON string in `shared_preferences` on every modification could cause minor delays if the list is extremely large.
  - *Mitigation*: Limit the maximum size of the comparison list to a reasonable number (e.g., 50 items) or keep objects extremely lightweight. Since the user manually inputs each beer, lists are naturally small (typically under 10 items).
- **[Risk] External links failing on older devices**: `url_launcher` can occasionally fail if the target app (like WhatsApp) isn't installed or if native web browsers are disabled.
  - *Mitigation*: Configure URL schemes properly in AndroidManifest/Info.plist (using queries) and apply a safe fallback to open links in an in-app web view or display an error dialog if launching fails.
