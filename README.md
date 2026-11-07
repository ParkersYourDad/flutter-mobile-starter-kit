# Flutter Mobile Starter Kit

A reusable Flutter foundation for **Android and iOS**, with a first-party UI component library and design system built directly on Flutter SDK primitives.

## Foundation
- Flutter 3.47.9 stable, pinned with FVM.
- `WidgetsApp.router` app shell.
- GoRouter navigation and Riverpod 3 state management.
- Manual Notifier/AsyncNotifier providers; no provider code generation.
- First-party design tokens, typography, theme, and UI components.
- English and Arabic localization through ARB and Flutter `gen-l10n`.
- No mandatory backend, auth provider, database, analytics, or cloud vendor.

## Current UI components
- Text styles and semantic text: `KitText`.
- Primary action and disabled state: `KitButton`.
- Icon action foundation: `KitIconButton`.
- Accessible text input with platform selection behavior: `KitTextField`.
- Controlled checkbox and switch.
- Surface, badge, divider, and empty state.

The public component API is exported from `lib/design_system/kit_ui.dart`.

## Status
This is an evolving engineering foundation, not yet production-verified. Native Android/iOS runner folders are generated locally as described below. Do not treat the project as release-ready until verification and platform checks pass in a Flutter 3.47.9 environment.

## Getting started

### 1. Install Flutter through FVM
```bash
fvm install
fvm flutter --version
```
Confirm Flutter 3.47.9 stable.

### 2. Generate native runners
From the repository root:
```bash
fvm flutter create --platforms=android,ios --project-name flutter_mobile_starter_kit .
```
Review native deployment settings. Intended minimums: Android API 24 and iOS 15.0.

### 3. Resolve packages and localization
```bash
fvm flutter pub get
fvm flutter gen-l10n
```

### 4. Verify
```bash
fvm dart format --output=none --set-exit-if-changed .
fvm flutter analyze
fvm flutter test
```

### 5. Run
```bash
fvm flutter run
```

## Structure
```text
lib/
  app/                  App composition and navigation
  design_system/
    components/         First-party reusable UI
    theme/              Theme and typography
    tokens/             Color, spacing, radius, control, motion tokens
    kit_ui.dart         Public UI API
  features/showcase/    Small component preview screen
  l10n/arb/             English and Arabic source translations
test/                   Component behavior tests
docs/                   Architecture, design-system, and quality decisions
```

Feature folders are added only when a real product capability is introduced; empty placeholders are intentionally avoided.

Read [AGENTS.md](AGENTS.md) before changing the project. It records the project-specific rules and the adapted workflow from [flutter-engineering-skills](https://github.com/ParkersYourDad/flutter-engineering-skills).

## License
MIT. See [LICENSE](LICENSE).
