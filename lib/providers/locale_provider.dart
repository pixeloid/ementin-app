import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  // ignore: deprecated_member_use
  LocaleNotifier() : super(Locale(ui.window.locale.languageCode));

  /// Update new locale
  set locale(Locale value) {
    state = value;
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>(
  (_) => LocaleNotifier(),
);
