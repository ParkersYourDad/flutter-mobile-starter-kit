import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_icon_button.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testApp({required Widget child}) {
    return WidgetsApp(
      color: KitThemeData.light.colors.canvas,
      builder: (context, _) => KitTheme(
        data: KitThemeData.light,
        child: Directionality(textDirection: TextDirection.ltr, child: child),
      ),
    );
  }

  testWidgets('invokes callback when enabled icon button is tapped', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      testApp(
        child: KitIconButton(
          semanticLabel: 'Close',
          icon: const Text('x'),
          onPressed: () => taps++,
        ),
      ),
    );

    await tester.tap(find.text('x'));
    expect(taps, 1);
  });

  testWidgets('does not invoke callback when disabled', (tester) async {
    const taps = 0;
    await tester.pumpWidget(
      testApp(
        child: const KitIconButton(
          semanticLabel: 'Close',
          icon: Text('x'),
          onPressed: null,
        ),
      ),
    );

    await tester.tap(find.text('x'));
    expect(taps, 0);
  });
}
