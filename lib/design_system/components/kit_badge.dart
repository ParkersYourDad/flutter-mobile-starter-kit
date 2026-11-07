import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';
import 'kit_text.dart';

class KitBadge extends StatelessWidget {
  const KitBadge({required this.label, super.key});

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
