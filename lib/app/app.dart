import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../design_system/theme/kit_theme.dart';
import '../l10n/app_localizations.dart';
import 'router.dart';

class StarterKitApp extends StatelessWidget {
  const StarterKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = KitThemeData.light;
    return WidgetsApp.router(
      color: theme.colors.canvas,
      routerConfig: appRouter,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return KitTheme(
          data: theme,
          child: DefaultTextStyle(
            style: theme.typography.body,
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
