# Architecture decisions

## Platform scope
Android and iOS only. Web, desktop, and server-side Flutter are out of scope. Native runner projects are generated using Flutter tooling and then reviewed for the project's minimum OS versions.

## App shell
Use Flutter's `WidgetsApp.router`. MaterialApp and CupertinoApp are not the default app shells. Components are owned by this repository and built from Flutter SDK primitives.

## Navigation
GoRouter is the navigation package. Route pages use a repository-owned Page implementation so routing does not require MaterialPage. Route transitions remain disabled until reduced-motion policy is connected.

## State
Riverpod 3 is used for app state. Prefer manual Notifier and AsyncNotifier providers. Do not add generated provider code.

## Localization
English and Arabic are the initial locales. ARB files are the source of truth; Flutter `gen-l10n` generates localization accessors. Locale selection follows the device locale by default.

## Architecture shape
Keep the foundation small: app composition, design system, and only cross-cutting infrastructure with a concrete use case. Add feature-first data/domain/presentation layers when a feature needs them; do not pre-create empty folders.

## Dependencies
Every dependency must solve a named problem. Record compatibility, maintenance, license, platform support, and why an SDK solution is insufficient before adding it.
