import 'package:flutter/widgets.dart';

import '../theme/kit_theme.dart';

enum KitTextVariant { display, headline, title, body, label, caption }

enum KitTextTone { primary, secondary, accent, danger, onAccent }

class KitText extends StatelessWidget {
  const KitText(
    this.data, {
    super.key,
    this.variant = KitTextVariant.body,
    this.tone = KitTextTone.primary,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
  });

  final String data;
  final KitTextVariant variant;
  final KitTextTone tone;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = KitTheme.of(context);
    final baseStyle = switch (variant) {
      KitTextVariant.display => theme.typography.display,
      KitTextVariant.headline => theme.typography.headline,
      KitTextVariant.title => theme.typography.title,
      KitTextVariant.body => theme.typography.body,
      KitTextVariant.label => theme.typography.label,
      KitTextVariant.caption => theme.typography.caption,
    };
    final color = switch (tone) {
      KitTextTone.primary => theme.colors.textPrimary,
      KitTextTone.secondary => theme.colors.textSecondary,
      KitTextTone.accent => theme.colors.accent,
      KitTextTone.danger => theme.colors.danger,
      KitTextTone.onAccent => theme.colors.onAccent,
    };

    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      style: baseStyle.copyWith(color: color),
    );
  }
}
