import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';

class KitBadge extends StatelessWidget {
  const KitBadge({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = KitTheme.of(context).colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: BorderRadius.circular(KitRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: KitSpacing.sm,
          vertical: KitSpacing.xxs,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
