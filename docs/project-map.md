# Project Modules and Delivery Boundaries

The repository stays a single Flutter application foundation. Work is split into bounded modules and short-lived branches; do not create separate repositories or speculative package boundaries.

## Module map

| Module | Owns | Must not own |
|---|---|---|
| App foundation | Bootstrap, app composition, routing, environment and app-level configuration | Feature UI internals or reusable control behavior |
| Design system | Tokens, themes, typography, motion and platform adaptation policy | Product-specific content or business rules |
| UI primitives | Text, buttons, icons, surfaces, badges and separators | Form validation or navigation |
| Form controls | Text entry, selection, checkbox, switch, validation and field semantics | Screen-level form submission workflows |
| Overlays | Dialog, sheet, snackbar and transient presentation | Global app navigation policy |
| Platform | Android/iOS configuration, lifecycle, permissions and native integration | Cross-platform UI components |
| Quality | Tests, CI, accessibility, performance gates and engineering docs | Runtime application features |

## Delivery rules

1. Each module is developed on a branch named `work/<module>`.
2. A branch should change one coherent module and its direct tests/docs only.
3. Do not create empty folders, placeholder classes, speculative abstractions or duplicate documentation.
4. Keep public APIs small. Export only stable components from `lib/design_system/kit_ui.dart`.
5. A component is not complete because it renders. It needs behavioral, semantic, keyboard/focus, RTL, text-scaling and disabled-state coverage where applicable.
6. Do not merge a module while known compile, analysis, test or accessibility failures remain.
7. CI status must be observed, not assumed. A missing status is not a pass.
8. Native platform targets and minimum OS versions are not considered configured until their generated files are inspected and verified.

## Planned sequence

1. Stabilize the current design-system primitives and theme contracts.
2. Complete form controls, beginning with text input only after defining editing, selection, IME, autofill, focus and semantics requirements.
3. Build overlays on top of the verified theme and focus infrastructure.
4. Configure and verify Android/iOS native projects.
5. Expand CI and quality gates; run the full toolchain on the pinned Flutter SDK.

## Current verification boundary

The GitHub repository contains source files and a CI workflow. This alone does not prove that Flutter dependency resolution, localization generation, static analysis, widget tests or native builds pass. Record each result only after an actual run.
