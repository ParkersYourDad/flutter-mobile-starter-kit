import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_text.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_mobile_starter_kit/design_system/tokens/kit_tokens.dart';

class KitBadge extends StatelessWidget {
  const new({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: KitTheme.of(context).colors.surfaceMuted,
        borderRadius: BorderRadius.circular(KitRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: KitSpacing.sm,
          vertical: KitSpacing.xxs,
        ),
        child: KitText(
          label,
          variant: KitTextVariant.caption,
          tone: KitTextTone.secondary,
        ),
      ),
    );
  }
}
