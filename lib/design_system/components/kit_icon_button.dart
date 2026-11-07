import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';

enum KitIconButtonVariant { neutral, accent, quiet }

class KitIconButton extends StatefulWidget {
  const KitIconButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    super.key,
    this.variant = KitIconButtonVariant.neutral,
    this.size = 48,
  }) : assert(size > 0);

  final Widget icon;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final KitIconButtonVariant variant;
  final double size;

  @override
  State<KitIconButton> createState() => _KitIconButtonState();
}

class _KitIconButtonState extends State<KitIconButton> {
  bool _focused = false;
  bool _pressed = false;
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

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
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
    final Color? background = switch (widget.variant) {
      KitIconButtonVariant.neutral => colors.surfaceMuted,
      KitIconButtonVariant.accent => colors.accent,
      KitIconButtonVariant.quiet => null,
    };
    final foreground = widget.variant == KitIconButtonVariant.accent
        ? colors.onAccent
        : colors.textPrimary;

    return Focus(
      canRequestFocus: _enabled,
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKey,
      child: Semantics(
        button: true,
        enabled: _enabled,
        label: widget.semanticLabel,
        onTap: _enabled ? _activate : null,
        child: GestureDetector(
          excludeFromSemantics: true,
          behavior: HitTestBehavior.opaque,
          onTap: _enabled ? _activate : null,
          onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
          child: Container(
            width: widget.size < 48 ? 48 : widget.size,
            height: widget.size < 48 ? 48 : widget.size,
            decoration: BoxDecoration(
              color: _enabled ? background : colors.surfaceMuted,
              borderRadius: BorderRadius.circular(KitRadii.md),
              border: _focused
                  ? Border.all(color: colors.textPrimary, width: 2)
                  : null,
            ),
            alignment: Alignment.center,
            child: Opacity(
              opacity: _enabled ? (_pressed ? 0.68 : 1) : 0.45,
              child: IconTheme(
                data: IconThemeData(color: foreground),
                child: widget.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
