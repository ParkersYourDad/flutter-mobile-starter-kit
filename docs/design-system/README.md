# Design system

## Principles
- Flutter SDK primitives are the implementation foundation.
- Tokens are the source for color, spacing, radius, control sizes, and motion values.
- Components own their interaction and accessibility contracts.
- Prefer directional padding/alignment and preserve RTL behavior.
- Support text scaling; avoid fixed-height text containers.
- Respect platform reduced-motion preferences for non-essential motion.
- Import the public API from `design_system/kit_ui.dart`.

## Theme and typography
- `KitThemeData` supplies the color scheme and typography scale.
- `KitText` is the standard text component. Use its variants and tones rather than styling raw text in feature screens.
- `onAccent` is intended for text on accent-colored surfaces.
- Control hit targets use `KitControlSizes.minimumTapTarget`.

## Initial components
- `KitText`: display, headline, title, body, label, and caption variants with semantic-label support.
- `KitButton`: enabled/disabled state, pointer and keyboard activation, focus indication, semantic button role.
- `KitIconButton`: caller-supplied icon content, required semantic label, pointer and keyboard activation, focus indication, minimum 48 logical-pixel target.
- `KitCheckbox`: controlled checked state, keyboard/pointer activation, semantics, and custom-drawn checkmark.
- `KitSwitch`: controlled on/off state, directional thumb placement, keyboard/pointer activation, and toggled semantics.
- `KitTextField`: editable text input built on `EditableText`, with caller-owned controller, optional focus node, formatters, autofill, IME actions, selection handles, adaptive context menu, helper/error feedback, and semantic field labeling.
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

## Known limitations
- The icon button accepts icon content from the caller; a consistent first-party icon drawing set has not been implemented yet.
- Text input, selection controls, dialogs, and bottom sheets are not part of this initial set. Text editing will be added only with complete selection handles and context-menu behavior, not as a visual-only wrapper.
- Reduced-motion policy is not wired into the app shell yet. Non-essential component and route animations are intentionally not used until that policy is implemented.
