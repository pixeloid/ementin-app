import 'package:l10n_flutter/l10n_core.dart';

// Supported locales
const appL10nSettings = L10nSettings(locales: [
  L10nLocale('hu', 'HU', 'Hungarian'),
  L10nLocale('en', 'GB', 'English'),
]);

@appL10nSettings
class AppL10n {
  static const truck = L10nSet(
      'app_truck', 'Truck'); // where "app_truck" is the key in the locale file
}
