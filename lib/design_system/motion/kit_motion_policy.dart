import 'package:flutter/widgets.dart';

/// Resolves non-essential animation durations against the platform setting.
abstract final class KitMotionPolicy {
  /// Returns zero when the platform requests reduced motion.
  static Duration duration(BuildContext context, Duration preferred) {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery?.disableAnimations ?? false) {
      return Duration.zero;
    }
    return preferred;
  }
}
