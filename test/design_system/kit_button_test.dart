import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_button.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';

void main() {
  Widget testApp({required Widget child}) {
    return WidgetsApp(
      color: KitThemeData.light.colors.canvas,
      builder: (context, _) => KitTheme(
        data: KitThemeData.light,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: child,
        ),
      ),
    );
  }

  testWidgets('invokes callback when enabled button is tapped', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      testApp(
        child: KitButton(label: 'Continue', onPressed: () => taps++),
      ),
    );

    await tester.tap(find.text('Continue'));
    expect(taps, 1);
  });

  testWidgets('does not invoke callback when disabled', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      testApp(child: KitButton(label: 'Disabled', onPressed: null)),
    );

    await tester.tap(find.text('Disabled'));
    expect(taps, 0);
  });
}
