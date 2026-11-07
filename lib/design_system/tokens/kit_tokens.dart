import 'dart:ui';

abstract final class KitColors {
  static const Color canvas = Color(0xFFF8F8F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF0F0EC);
  static const Color textPrimary = Color(0xFF20211F);
  static const Color textSecondary = Color(0xFF686B65);
  static const Color outline = Color(0xFFDADCD5);
  static const Color accent = Color(0xFF315E52);
  static const Color onAccent = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFB3261E);
}

abstract final class KitSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double section = 64;
}

abstract final class KitRadii {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 18;
  static const double pill = 999;
}

abstract final class KitControlSizes {
  static const double minimumTapTarget = 48;
  static const double checkbox = 22;
  static const double switchTapTargetWidth = 52;
  static const double switchTrackWidth = 48;
  static const double switchTrackHeight = 28;
  static const double switchThumb = 18;
}

abstract final class KitMotion {
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration standard = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 280);
}
