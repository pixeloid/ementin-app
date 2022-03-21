// ignore_for_file: avoid_print

import 'package:eventapp/screens/event/main/event_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/screen.dart';
import '../../screens/event/main/event_main_program_screen.dart';
import '../../screens/root_screen.dart';
import '../../screens/event/main/event_main_info_screen.dart';
import '../../screens/event/main/pushed_screen.dart';
import '../../widgets/exit_dialog.dart';

const info = 0;
const profile = 1;
const favourites = 2;

class BottomNavigationProvider extends ChangeNotifier {
  /// Shortcut method for getting [NavigationProvider].
  static BottomNavigationProvider of(BuildContext context) =>
      Provider.of<BottomNavigationProvider>(context, listen: false);

  int _currentScreenIndex = info;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('onGenerateRoute: ${settings.name}');
    switch (settings.name) {
      case PushedScreen.route:
        return MaterialPageRoute(builder: (_) => const PushedScreen());
      default:
        return MaterialPageRoute(builder: (_) => const EventRootScreen());
    }
  }

  final Map<int, Screen> _screens = {
    info: Screen(
      title: 'EventMainInfoScreen',
      child: const EventMainInfoScreen(),
      initialRoute: EventMainInfoScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating EventMainInfoScreen route: ${settings.name}');
        switch (settings.name) {
          case PushedScreen.route:
            return MaterialPageRoute(builder: (_) => const PushedScreen());
          default:
            return MaterialPageRoute(
                builder: (_) => const EventMainInfoScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    profile: Screen(
      title: 'EventListingScreen',
      child: const EventListingScreen(),
      initialRoute: EventListingScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating EventListingScreen route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(
                builder: (_) => const EventListingScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    favourites: Screen(
      title: 'EventMainProgramScreen',
      child: const EventMainProgramScreen(),
      initialRoute: PushedScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating EventMainProgramScreen route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(
              builder: (_) => const EventMainProgramScreen(),
            );
        }
      },
      scrollController: ScrollController(),
    ),
  };

  List<Screen> get screens => _screens.values.toList();

  Screen get currentScreen => _screens[_currentScreenIndex] as Screen;

  /// Set currently visible tab.
  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToStart();
    } else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  /// If currently displayed screen has given [ScrollController] animate it
  /// to the start of scroll view.
  void _scrollToStart() {
    if (currentScreen.scrollController.hasClients) {
      currentScreen.scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Provide this to [WillPopScope] callback.
  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen.navigatorState.currentState;

    if (currentNavigatorState!.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != info) {
        setTab(info);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => const ExitAlertDialog(),
        );
      }
    }
  }
}
