import 'package:flutter/widgets.dart';

import '../tokens/kit_tokens.dart';

class KitColorScheme {
  const KitColorScheme({
    required this.canvas,
    required this.surface,
    required this.surfaceMuted,
    required this.textPrimary,
    required this.textSecondary,
    required this.outline,
    required this.accent,
    required this.onAccent,
    required this.danger,
  });

  final Color canvas;
  final Color surface;
  final Color surfaceMuted;
  final Color textPrimary;
  final Color textSecondary;
  final Color outline;
  final Color accent;
  final Color onAccent;
  final Color danger;
}

class KitTypography {
  const KitTypography({
    required this.display,
    required this.headline,
    required this.title,
    required this.body,
    required this.label,
    required this.caption,
  });

  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;
  final TextStyle label;
  final TextStyle caption;
}

class KitThemeData {
  const KitThemeData({required this.colors, required this.typography});

  final KitColorScheme colors;
  final KitTypography typography;

  static const KitThemeData light = KitThemeData(
    colors: KitColorScheme(
      canvas: KitColors.canvas,
      surface: KitColors.surface,
      surfaceMuted: KitColors.surfaceMuted,
      textPrimary: KitColors.textPrimary,
      textSecondary: KitColors.textSecondary,
      outline: KitColors.outline,
      accent: KitColors.accent,
      onAccent: KitColors.onAccent,
      danger: KitColors.danger,
    ),
    typography: KitTypography(
      display: TextStyle(
        color: KitColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      headline: TextStyle(
        color: KitColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
      title: TextStyle(
        color: KitColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
      body: TextStyle(
        color: KitColors.textPrimary,
        fontSize: 16,
        height: 1.5,
      ),
      label: TextStyle(
        color: KitColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
      caption: TextStyle(
        color: KitColors.textSecondary,
        fontSize: 12,
        height: 1.4,
      ),
    ),
  );
}

class KitTheme extends InheritedWidget {
  const KitTheme({
    required this.data,
    required super.child,
    super.key,
  });

  final KitThemeData data;

  static KitThemeData of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<KitTheme>();
    assert(inherited != null, 'KitTheme is missing above this context.');
    return inherited!.data;
  }

  @override
  bool updateShouldNotify(KitTheme oldWidget) => data != oldWidget.data;
}
