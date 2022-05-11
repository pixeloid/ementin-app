import 'package:flutter/material.dart';
import 'package:eventapp/app_define/app_assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppTheme {
  AppTheme._();

  /// Default theme
  factory AppTheme.origin() {
    return AppTheme._();
  }

  /// Default theme
  factory AppTheme.light() {
    return AppTheme._()
      ..assets = AppAssets.origin()
      ..isDark = false
      ..primaryColor = Colors.white
      ..accentColor = Colors.white
      ..backgroundColor = Colors.white
      ..headerBgColor = Colors.white;
  }

  AppAssets assets = AppAssets.origin();
  bool isDark = true;
  Color primaryColor = Colors.blueGrey;
  Color accentColor = Colors.blueGrey;
  Color backgroundColor = const Color(0xFFF2F2F2);
  Color headerBgColor = Colors.blueGrey;

  /// Build theme data
  ThemeData buildThemeData(ctx) {
    return ThemeData(
      primaryColor: primaryColor,
      pageTransitionsTheme: _buildPageTransitionsTheme(),
      buttonTheme: _buildButtonTheme(),
      textTheme: _buildTextTheme(ctx),
    );
  }

  /// Custom page transitions theme
  PageTransitionsTheme _buildPageTransitionsTheme() {
    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );
  }

  /// Custom button theme full width
  ButtonThemeData _buildButtonTheme() {
    return ButtonThemeData(
      minWidth: double.infinity,
      shape: const Border(),
      buttonColor: accentColor,
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.all(16),
    );
  }

  /// Custom text theme
  TextTheme _buildTextTheme(ctx) {
    return GoogleFonts.poppinsTextTheme();
  }
}

class AppThemeProvider with ChangeNotifier {
  AppTheme get theme => AppTheme.light();

  set theme(AppTheme value) {
    notifyListeners();
  }
}

extension AppThemeExt on BuildContext {
  AppTheme theme() {
    return watch<AppThemeProvider>().theme;
  }
}
