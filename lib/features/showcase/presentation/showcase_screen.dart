import 'package:flutter/widgets.dart';

import '../../../design_system/components/kit_badge.dart';
import '../../../design_system/components/kit_button.dart';
import '../../../design_system/components/kit_divider.dart';
import '../../../design_system/components/kit_surface.dart';
import '../../../design_system/theme/kit_theme.dart';
import '../../../design_system/tokens/kit_tokens.dart';
import '../../../l10n/app_localizations.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  bool _buttonWasPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = KitTheme.of(context).colors;
    final l10n = AppLocalizations.of(context)!;

    return ColoredBox(
      color: colors.canvas,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(KitSpacing.lg),
          children: [
            const SizedBox(height: KitSpacing.xl),
            Text(
              l10n.appTitle,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            const SizedBox(height: KitSpacing.sm),
            Text(
              l10n.appSubtitle,
              style: TextStyle(color: colors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: KitSpacing.xl),
            Wrap(
              spacing: KitSpacing.xs,
              runSpacing: KitSpacing.xs,
              children: [
                KitBadge(label: l10n.flutterBadge),
                KitBadge(label: l10n.firstPartyUiBadge),
                KitBadge(label: l10n.mobileOnlyBadge),
              ],
            ),
            const SizedBox(height: KitSpacing.xl),
            KitSurface(
              border: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.componentsTitle,
                    style: TextStyle(
                      color: colors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: KitSpacing.md),
                  const KitDivider(),
                  const SizedBox(height: KitSpacing.md),
                  KitButton(
                    label: l10n.buttonExample,
                    onPressed: () => setState(() => _buttonWasPressed = true),
                  ),
                  const SizedBox(height: KitSpacing.md),
                  KitButton(label: l10n.disabledButton, onPressed: null),
                  if (_buttonWasPressed) ...[
                    const SizedBox(height: KitSpacing.md),
                    Text(
                      l10n.buttonPressedMessage,
                      style: TextStyle(color: colors.textSecondary),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
