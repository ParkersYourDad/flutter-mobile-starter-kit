// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Mobile Starter Kit';

  @override
  String get appSubtitle =>
      'A clean foundation for building polished Android and iOS applications.';

  @override
  String get flutterBadge => 'Flutter';

  @override
  String get firstPartyUiBadge => 'First-party UI';

  @override
  String get mobileOnlyBadge => 'Mobile only';

  @override
  String get componentsTitle => 'Component preview';

  @override
  String get buttonExample => 'Test interaction';

  @override
  String get disabledButton => 'Disabled button';

  @override
  String get buttonPressedMessage => 'The button is working.';

  @override
  String get switchExample => 'Enable notifications';

  @override
  String get checkboxExample => 'Accept terms';

  @override
  String get emailFieldLabel => 'Email address';
}
