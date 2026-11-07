import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_mobile_starter_kit/design_system/tokens/kit_tokens.dart';

class KitCheckbox extends StatefulWidget {
  const new({
    required this.value,
    required this.semanticLabel,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final String semanticLabel;
  final ValueChanged<bool>? onChanged;

  @override
  State<KitCheckbox> createState() => _KitCheckboxState();
}

class _KitCheckboxState extends State<KitCheckbox> {
  bool _focused = false;
  bool _spaceIsDown = false;

  bool get _enabled => widget.onChanged != null;

  void _toggle() {
    if (_enabled) widget.onChanged?.call(!widget.value);
  }

  void _handleFocusChange(bool focused) {
    setState(() {
      _focused = focused;
      if (!focused) _spaceIsDown = false;
    });
  }

  KeyEventResult _handleKey(FocusNode _, KeyEvent event) {
    if (!_enabled) return KeyEventResult.ignored;

    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
      _toggle();
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.space) {
      _spaceIsDown = true;
      return KeyEventResult.handled;
    }
    if (event is KeyUpEvent &&
        event.logicalKey == LogicalKeyboardKey.space &&
        _spaceIsDown) {
      _spaceIsDown = false;
      _toggle();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final colors = KitTheme.of(context).colors;
    final fill = widget.value ? colors.accent : colors.surface;
    final border = !_enabled || !widget.value ? colors.outline : colors.accent;

    return Focus(
      canRequestFocus: _enabled,
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKey,
      child: Semantics(
        label: widget.semanticLabel,
        checked: widget.value,
        enabled: _enabled,
        onTap: _enabled ? _toggle : null,
        child: GestureDetector(
          excludeFromSemantics: true,
          behavior: HitTestBehavior.opaque,
          onTap: _enabled ? _toggle : null,
          child: SizedBox(
            width: KitControlSizes.minimumTapTarget,
            height: KitControlSizes.minimumTapTarget,
            child: Center(
              child: Container(
                width: KitControlSizes.checkbox,
                height: KitControlSizes.checkbox,
                decoration: BoxDecoration(
                  color: _enabled ? fill : colors.surfaceMuted,
                  border: Border.all(
                    color: _focused ? colors.textPrimary : border,
                    width: _focused ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(KitRadii.sm),
                ),
                child: widget.value
                    ? CustomPaint(
                        painter: _CheckmarkPainter(
                          color: _enabled
                              ? colors.onAccent
                              : colors.textSecondary,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckmarkPainter extends CustomPainter {
  const new({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 0.22, size.height * 0.52)
      ..lineTo(size.width * 0.43, size.height * 0.72)
      ..lineTo(size.width * 0.79, size.height * 0.3);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CheckmarkPainter oldDelegate) =>
      color != oldDelegate.color;
}
