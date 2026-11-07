import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';
import '../tokens/kit_tokens.dart';

class KitSurface extends StatelessWidget {
  const KitSurface({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(KitSpacing.lg),
    this.radius = KitRadii.lg,
    this.border = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final bool border;

  @override
  Widget build(BuildContext context) {
    final colors = KitTheme.of(context).colors;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius),
        border: border ? Border.all(color: colors.outline) : null,
      ),
      child: child,
    );
  }
}
