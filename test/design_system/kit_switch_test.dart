import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_switch.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('reports the opposite value when tapped', (tester) async {
    bool? changedValue;
    await tester.pumpWidget(
      WidgetsApp(
        color: KitThemeData.light.colors.canvas,
        builder: (context, _) => KitTheme(
          data: KitThemeData.light,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: KitSwitch(
              value: false,
              semanticLabel: 'Enable notifications',
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(KitSwitch));
    expect(changedValue, isTrue);
  });

  testWidgets('does not report changes when disabled', (tester) async {
    bool? changedValue;
    await tester.pumpWidget(
      WidgetsApp(
        color: KitThemeData.light.colors.canvas,
        builder: (context, _) => KitTheme(
          data: KitThemeData.light,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: KitSwitch(
              value: false,
              semanticLabel: 'Enable notifications',
              onChanged: null,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(KitSwitch));
    expect(changedValue, isNull);
  });
}
