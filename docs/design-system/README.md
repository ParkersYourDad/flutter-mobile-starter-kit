# Design system

## Principles
- Flutter SDK primitives are the implementation foundation.
- Tokens are the source for color, spacing, radius, and motion values.
- Components own their interaction and accessibility contracts.
- Prefer directional padding/alignment and preserve RTL behavior.
- Support text scaling; avoid fixed-height text containers.
- Respect platform reduced-motion preferences for non-essential motion.

## Initial components
- `KitButton`: enabled/disabled state, pointer activation, keyboard activation, focus indication, semantic button role.
- `KitSurface`: neutral surface with optional outline.
- `KitBadge`: compact status label.
- `KitDivider`: token-colored separator.
- `KitEmptyState`: reusable empty-state composition with optional action.

## Component acceptance checklist
- [ ] Public API and intended use documented.
- [ ] Enabled, disabled, focused, pressed, and error states handled where relevant.
- [ ] Semantic role, label, and enabled state exposed correctly.
- [ ] Keyboard and focus behavior verified.
- [ ] RTL, long text, and large text scale verified.
- [ ] Reduced-motion behavior verified for animated states.
- [ ] Widget tests cover behavior and important edge cases.
- [ ] No feature-specific business logic inside the component.
