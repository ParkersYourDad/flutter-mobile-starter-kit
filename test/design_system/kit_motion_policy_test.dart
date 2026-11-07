import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/motion/kit_motion_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('preserves duration when animations are enabled', (tester) async {
    late Duration resolved;
    const preferred = Duration(milliseconds: 180);

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: Builder(
          builder: (context) {
            resolved = KitMotionPolicy.duration(context, preferred);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(resolved, preferred);
  });

  testWidgets('removes non-essential motion when disabled', (tester) async {
    late Duration resolved;
    const preferred = Duration(milliseconds: 180);

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true),
        child: Builder(
          builder: (context) {
            resolved = KitMotionPolicy.duration(context, preferred);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(resolved, Duration.zero);
  });

  testWidgets('works without a MediaQuery', (tester) async {
    late Duration resolved;
    const preferred = Duration(milliseconds: 180);

    await tester.pumpWidget(
      Builder(
        builder: (context) {
          resolved = KitMotionPolicy.duration(context, preferred);
          return const SizedBox.shrink();
        },
      ),
    );

    expect(resolved, preferred);
  });
}
