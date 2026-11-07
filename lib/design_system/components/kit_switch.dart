import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';

class KitSwitch extends StatefulWidget {
  const KitSwitch({
    required this.value,
    required this.semanticLabel,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final String semanticLabel;
  final ValueChanged<bool>? onChanged;

  @override
  State<KitSwitch> createState() => _KitSwitchState();
}

class _KitSwitchState extends State<KitSwitch> {
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
    final active = widget.value && _enabled;

    return Focus(
      canRequestFocus: _enabled,
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKey,
      child: Semantics(
        label: widget.semanticLabel,
        toggled: widget.value,
        enabled: _enabled,
        onTap: _enabled ? _toggle : null,
        child: GestureDetector(
          excludeFromSemantics: true,
          behavior: HitTestBehavior.opaque,
          onTap: _enabled ? _toggle : null,
          child: SizedBox(
            width: KitControlSizes.switchTapTargetWidth,
            height: KitControlSizes.minimumTapTarget,
            child: Center(
              child: Container(
                width: KitControlSizes.switchTrackWidth,
                height: KitControlSizes.switchTrackHeight,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: active ? colors.accent : colors.surfaceMuted,
                  borderRadius: BorderRadius.circular(KitRadii.pill),
                  border: _focused
                      ? Border.all(color: colors.textPrimary, width: 2)
                      : Border.all(color: colors.outline),
                ),
                child: Align(
                  alignment: widget.value
                      ? AlignmentDirectional.centerEnd
                      : AlignmentDirectional.centerStart,
                  child: Container(
                    width: KitControlSizes.switchThumb,
                    height: KitControlSizes.switchThumb,
                    decoration: BoxDecoration(
                      color: active ? colors.onAccent : colors.surface,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
