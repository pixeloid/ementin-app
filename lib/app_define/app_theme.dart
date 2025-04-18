import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ThemeType {
  ementin,
  ementinDark,
}

class AppTheme {
  static const ThemeType defaultTheme = ThemeType.ementin;

  AppTheme({
    required this.isDark,
    required this.bg1,
    required this.surface,
    required this.bg2,
    required this.accent1,
    required this.accent1Dark,
    required this.accent1Darker,
    required this.accent2,
    required this.accent3,
    required this.grey,
    required this.greyStrong,
    required this.greyWeak,
    required this.greyWeaker,
    required this.error,
    required this.focus,
    required this.txt,
    required this.accentTxt,
  });

  bool isDark;
  Color bg1;
  Color surface;
  Color bg2;
  Color accent1;
  Color accent1Dark;
  Color accent1Darker;
  Color accent2;
  Color accent3;
  Color grey;
  Color greyStrong;
  Color greyWeak;
  Color greyWeaker;
  Color error;
  Color focus;
  Color txt;
  Color accentTxt;

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.ementin:
        return AppTheme(
          isDark: false,
          txt: Colors.black,
          accentTxt: Colors.white,
          bg1: const Color(0xFFF9FAFB),
          bg2: const Color(0xffc1dcbc),
          surface: Colors.white,
          accent1: const Color(0xFF2C2B7A),
          accent1Dark: const Color(0xff00856f),
          accent1Darker: const Color(0xff006b5a),
          accent2: const Color(0xFFf172ac),
          accent3: const Color(0xff5bc91a),
          greyWeak: const Color.fromARGB(255, 208, 216, 227),
          greyWeaker: const Color.fromARGB(255, 234, 237, 240),
          grey: const Color(0xff515d5a),
          greyStrong: const Color(0xff151918),
          error: Colors.red.shade900,
          focus: const Color(0xFF0ee2b1),
        );

      case ThemeType.ementinDark:
        return AppTheme(
          isDark: true,
          txt: Colors.white,
          accentTxt: Colors.black,
          bg1: const Color(0xff121212),
          bg2: const Color(0xff2c2c2c),
          surface: const Color(0xff252525),
          accent1: const Color(0xff00a086),
          accent1Dark: const Color(0xff00caa5),
          accent1Darker: const Color(0xff00caa5),
          accent2: const Color(0xfff19e46),
          accent3: const Color(0xff5BC91A),
          greyWeak: const Color(0xffa8b3b0),
          greyWeaker: const Color.fromARGB(255, 216, 225, 223),
          grey: const Color(0xffced4d3),
          greyStrong: const Color(0xffffffff),
          error: const Color(0xffe55642),
          focus: const Color(0xff0ee2b1),
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        secondary: accent2,
        surface: bg1,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins',
          ),
    );

    // We can also add on some extra properties that ColorScheme seems to miss
    return t.copyWith(
      inputDecorationTheme: const InputDecorationTheme(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: accent1,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: greyWeak,
        selectionHandleColor: Colors.transparent,
        cursorColor: accent1,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return accent1;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return accent1;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return accent1;
          }
          return null;
        }),
        trackColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return accent1;
          }
          return null;
        }),
      ),
    );
  }
}

class AppThemeProvider with ChangeNotifier {
  AppTheme get theme => AppTheme.fromType(ThemeType.ementin);

  set theme(AppTheme value) {
    notifyListeners();
  }
}

extension AppThemeExt on BuildContext {
  AppTheme theme() {
    return watch<AppThemeProvider>().theme;
  }
}
