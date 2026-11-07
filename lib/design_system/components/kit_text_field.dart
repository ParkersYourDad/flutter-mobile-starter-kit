import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_text.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_mobile_starter_kit/design_system/tokens/kit_tokens.dart';

/// A first-party text field built on Flutter's low-level EditableText.
class KitTextField extends StatefulWidget {
  const new({
    required this.controller,
    required this.label,
    super.key,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.autofillHints,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.errorText,
    this.helperText,
  }) : assert(maxLines == null || maxLines > 0),
       assert(minLines == null || minLines > 0),
       assert(maxLines == null || minLines == null || maxLines >= minLines);

  final TextEditingController controller;
  final String label;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final String? errorText;
  final String? helperText;

  @override
  State<KitTextField> createState() => _KitTextFieldState();
}

class _KitTextFieldState extends State<KitTextField> {
  late FocusNode _focusNode;
  bool _ownsFocusNode = false;

  @override
  void initState() {
    super.initState();
    _attachFocusNode(widget.focusNode);
  }

  void _attachFocusNode(FocusNode? suppliedNode) {
    _ownsFocusNode = suppliedNode == null;
    _focusNode = suppliedNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant KitTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      if (_ownsFocusNode) _focusNode.dispose();
      _attachFocusNode(widget.focusNode);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = KitTheme.of(context);
    final colors = theme.colors;
    final enabled = widget.enabled;
    final hasError = widget.errorText != null;
    final borderColor = hasError
        ? colors.danger
        : _focusNode.hasFocus
        ? colors.accent
        : colors.outline;
    final selectionControls = defaultTargetPlatform == TargetPlatform.iOS
        ? cupertino.cupertinoTextSelectionHandleControls
        : material.materialTextSelectionHandleControls;
    final keyboardAppearance =
        MediaQuery.maybeOf(context)?.platformBrightness ?? Brightness.light;

    return Semantics(
      container: true,
      textField: true,
      enabled: enabled,
      label: widget.label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          KitText(widget.label, variant: KitTextVariant.label),
          const SizedBox(height: KitSpacing.xs),
          DecoratedBox(
            decoration: BoxDecoration(
              color: enabled ? colors.surface : colors.surfaceMuted,
              border: Border.all(
                color: borderColor,
                width: _focusNode.hasFocus || hasError ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(KitRadii.md),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: KitSpacing.md,
                vertical: KitSpacing.sm,
              ),
              child: material.Theme(
                // Material is limited to Android selection handles and the
                // adaptive platform context-menu primitives.
                data: material.ThemeData(platform: defaultTargetPlatform),
                child: EditableText(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  style: theme.typography.body.copyWith(
                    color: enabled ? colors.textPrimary : colors.textSecondary,
                  ),
                  cursorColor: colors.accent,
                  backgroundCursorColor: colors.textSecondary,
                  selectionColor: colors.accent.withValues(alpha: 0.22),
                  selectionControls: selectionControls,
                  contextMenuBuilder: (context, editableTextState) =>
                      material.AdaptiveTextSelectionToolbar.editableText(
                        editableTextState: editableTextState,
                      ),
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  inputFormatters: widget.inputFormatters,
                  autofillHints: widget.autofillHints,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  obscureText: widget.obscureText,
                  readOnly: widget.readOnly || !enabled,
                  onChanged: enabled ? widget.onChanged : null,
                  onSubmitted: enabled ? widget.onSubmitted : null,
                  enableInteractiveSelection: true,
                  keyboardAppearance: keyboardAppearance,
                ),
              ),
            ),
          ),
          if (hasError || widget.helperText != null) ...[
            const SizedBox(height: KitSpacing.xs),
            KitText(
              widget.errorText ?? widget.helperText!,
              variant: KitTextVariant.caption,
              tone: hasError ? KitTextTone.danger : KitTextTone.secondary,
            ),
          ],
        ],
      ),
    );
  }
}
