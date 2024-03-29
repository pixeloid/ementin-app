import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocaleProvider with ChangeNotifier {
  /// Save locale
  // ignore: deprecated_member_use
  Locale _locale = Locale(ui.window.locale.languageCode);

  /// Get current locale
  Locale get locale => _locale;

  /// Update new locale
  set locale(Locale value) {
    _locale = value;
    Intl.defaultLocale = value.languageCode;
    notifyListeners();
  }
}
