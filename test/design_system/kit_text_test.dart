import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_text.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders text and exposes the supplied semantics label', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    addTearDown(semantics.dispose);

    await tester.pumpWidget(
      WidgetsApp(
        color: KitThemeData.light.colors.canvas,
        builder: (context, _) => const KitTheme(
          data: KitThemeData.light,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: KitText(
              'Visible heading',
              variant: KitTextVariant.headline,
              semanticsLabel: 'Accessible heading',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Visible heading'), findsOneWidget);
    expect(
      tester.getSemantics(find.byType(KitText)).label,
      'Accessible heading',
    );
  });
}
