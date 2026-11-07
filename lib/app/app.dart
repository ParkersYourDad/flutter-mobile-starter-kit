import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_starter_kit/app/router.dart';
import 'package:flutter_mobile_starter_kit/design_system/theme/kit_theme.dart';
import 'package:flutter_mobile_starter_kit/l10n/app_localizations.dart';

class StarterKitApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = KitThemeData.light;
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
