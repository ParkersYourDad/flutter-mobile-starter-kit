import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_text_field.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testApp({
    required Widget child,
    TextDirection direction = TextDirection.ltr,
  }) {
    return WidgetsApp(
      color: KitThemeData.light.colors.canvas,
      builder: (context, _) => KitTheme(
        data: KitThemeData.light,
        child: Directionality(
          textDirection: direction,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }

  testWidgets('accepts text and reports changes', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    String? changed;

    await tester.pumpWidget(
      testApp(
        child: KitTextField(
          controller: controller,
          label: 'Email address',
          onChanged: (value) => changed = value,
        ),
      ),
    );

    await tester.tap(find.byType(EditableText));
    await tester.enterText(find.byType(EditableText), 'person@example.com');

    expect(controller.text, 'person@example.com');
    expect(changed, 'person@example.com');
  });

  testWidgets('exposes a text-field semantic node', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      testApp(
        child: KitTextField(
          controller: controller,
          label: 'البريد الإلكتروني',
        ),
        direction: TextDirection.rtl,
      ),
    );

    final semantics = tester.getSemantics(find.byType(KitTextField));
    expect(semantics.label, 'البريد الإلكتروني');
    expect(semantics.hasFlag(SemanticsFlag.isTextField), isTrue);
  });

  testWidgets('does not accept edits when disabled', (tester) async {
    final controller = TextEditingController(text: 'locked');
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      testApp(
        child: KitTextField(
          controller: controller,
          label: 'Read only',
          enabled: false,
        ),
      ),
    );

    expect(find.byType(EditableText), findsOneWidget);
    expect(tester.widget<EditableText>(find.byType(EditableText)).readOnly, isTrue);
  });

  testWidgets('renders validation feedback', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      testApp(
        child: KitTextField(
          controller: controller,
          label: 'Email address',
          errorText: 'Enter a valid email address',
        ),
      ),
    );

    expect(find.text('Enter a valid email address'), findsOneWidget);
  });
}
