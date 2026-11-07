# Definition of done

A change is complete only when all applicable items are satisfied.

## Engineering
- [ ] Scope and acceptance criteria are explicit.
- [ ] No unnecessary dependency, abstraction, or placeholder file was added.
- [ ] Public APIs and architectural boundaries are clear.
- [ ] Errors and asynchronous states are handled deliberately.

## UI
- [ ] Uses design tokens and first-party components.
- [ ] Works in Arabic/RTL and English/LTR.
- [ ] Supports text scaling and long content.
- [ ] Semantics and keyboard/focus behavior are correct.
- [ ] Reduced-motion preferences are respected.
- [ ] Loading, empty, error, offline, and content states exist where applicable.

## Verification
- [ ] `fvm flutter pub get`
- [ ] `fvm flutter gen-l10n`
- [ ] `fvm dart format --output=none --set-exit-if-changed .`
- [ ] `fvm flutter analyze`
- [ ] `fvm flutter test`
- [ ] Android and iOS builds verified when platform code changes.
- [ ] Any unavailable or unrun check is explicitly recorded.
