import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';
import 'kit_text.dart';

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
  bool _spaceIsDown = false;

  bool get _enabled => widget.onPressed != null;

  void _activate() {
    if (_enabled) widget.onPressed?.call();
  }

  void _handleFocusChange(bool focused) {
    setState(() {
      _focused = focused;
      if (!focused) {
        _pressed = false;
        _spaceIsDown = false;
      }
    });
  }

  KeyEventResult _handleKey(FocusNode _, KeyEvent event) {
    if (!_enabled) return KeyEventResult.ignored;

    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.enter) {
      _activate();
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.space) {
      _spaceIsDown = true;
      setState(() => _pressed = true);
      return KeyEventResult.handled;
    }
    if (event is KeyUpEvent &&
        event.logicalKey == LogicalKeyboardKey.space &&
        _spaceIsDown) {
      _spaceIsDown = false;
      setState(() => _pressed = false);
      _activate();
      return KeyEventResult.handled;
    }
    if (event is KeyUpEvent &&
        event.logicalKey == LogicalKeyboardKey.enter) {
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
    final foreground = !_enabled ? KitTextTone.secondary : KitTextTone.onAccent;

    return Focus(
      canRequestFocus: _enabled,
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKey,
      child: Semantics(
        button: true,
        enabled: _enabled,
        label: widget.label,
        onTap: _enabled ? _activate : null,
        child: GestureDetector(
          excludeFromSemantics: true,
          behavior: HitTestBehavior.opaque,
          onTap: _enabled ? _activate : null,
          onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
          child: Container(
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
            child: KitText(
              widget.label,
              variant: KitTextVariant.label,
              tone: foreground,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
