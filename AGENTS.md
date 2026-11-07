# Engineering rules for this repository

## Upstream guidance
This project adapts the workflow and quality themes from https://github.com/ParkersYourDad/flutter-engineering-skills. Treat it as guidance, not a runtime dependency. Apply relevant architecture, design-system, testing, accessibility, localization, performance, and workflow practices; do not copy its implementation wholesale.

## Project decisions (these override generic guidance)
- Android and iOS only.
- Build and own the UI system with Flutter SDK widgets and primitives. Do not add Forui or another third-party UI kit.
- Use `WidgetsApp.router`, not MaterialApp or CupertinoApp, as the app shell.
- Use GoRouter and Riverpod 3 with manual Notifier/AsyncNotifier providers.
- Use feature-first pragmatic layering. Do not create empty feature folders or abstractions without a real use case.
- Use ARB + Flutter `gen-l10n`; this is the only approved code-generation workflow.
- Do not add build_runner, Freezed, json_serializable, riverpod_generator, go_router_builder, injectable, or other generators.
- No mandatory backend, authentication, database, analytics, or cloud service.
- Every dependency needs a concrete purpose plus compatibility, maintenance, license, and platform review.

## UI and design-system rules
- Feature code consumes design tokens and kit components; it does not invent colors, spacing, radii, typography, or motion values.
- Components must support semantics, keyboard/focus, text scaling, RTL, and reduced motion where applicable.
- Use directional layout APIs and start/end terminology.
- Avoid nested cards and decorative complexity.
- A component is incomplete until behavior, accessibility, tests, and constraints are documented.

## Architecture
- `app/`: composition root, routing, app configuration, localization wiring.
- `core/`: cross-cutting infrastructure only when a real need exists.
- `design_system/`: tokens, theme, and first-party reusable components.
- `features/`: real product capabilities, with only the layers they need.
- Dependencies point inward; design-system components never depend on feature implementations.

## Verification
Run `fvm flutter pub get`, `fvm flutter gen-l10n`, `fvm dart format --output=none --set-exit-if-changed .`, `fvm flutter analyze`, and `fvm flutter test`. Test affected UI in Arabic/RTL, English/LTR, large text, keyboard/focus, and reduced-motion contexts. Record checks that could not be run; never claim unexecuted checks passed.
