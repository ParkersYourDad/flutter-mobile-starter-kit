import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';

class KitButton extends StatefulWidget {
  const KitButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  State<KitButton> createState() => _KitButtonState();
}

class _KitButtonState extends State<KitButton> {
  bool _pressed = false;
  bool _focused = false;

  bool get _enabled => widget.onPressed != null;

  void _activate() {
    if (_enabled) widget.onPressed?.call();
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.space)) {
      _activate();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final colors = KitTheme.of(context).colors;
    final background = !_enabled
        ? colors.surfaceMuted
        : _pressed
            ? colors.textPrimary
            : colors.accent;
    final foreground = !_enabled ? colors.textSecondary : colors.onAccent;

    return FocusableActionDetector(
      enabled: _enabled,
      onShowFocusHighlight: (value) => setState(() => _focused = value),
      child: Focus(
        onKeyEvent: _handleKey,
        child: Semantics(
          button: true,
          enabled: _enabled,
          label: widget.label,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _enabled ? _activate : null,
            onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
            onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
            onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
            child: AnimatedContainer(
              duration: KitMotion.fast,
              curve: Curves.easeOut,
              constraints: const BoxConstraints(minHeight: 48),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: KitSpacing.lg,
                vertical: KitSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(KitRadii.md),
                border: _focused
                    ? Border.all(color: colors.textPrimary, width: 2)
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foreground,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
