import 'package:flutter/widgets.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_button.dart';
import 'package:flutter_mobile_starter_kit/design_system/components/kit_text.dart';
import 'package:flutter_mobile_starter_kit/design_system/tokens/kit_tokens.dart';

class KitEmptyState extends StatelessWidget {
  const new({
    required this.title,
    required this.description,
    super.key,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KitSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KitText(
              title,
              variant: KitTextVariant.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: KitSpacing.sm),
            KitText(
              description,
              tone: KitTextTone.secondary,
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: KitSpacing.lg),
              KitButton(label: actionLabel!, onPressed: onAction),
            ],
          ],
        ),
      ),
    );
  }
}
