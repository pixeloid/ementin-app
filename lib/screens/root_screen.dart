import 'package:eventapp/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation/bottom_navigation.dart';

/// Navigation entry point for app.
class EventRootScreen extends StatelessWidget {
  const EventRootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        // Create bottom navigation bar items from screens.
        final bottomNavigationBarItems = provider.screens
            .map((screen) => BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: screen.title))
            .toList();

        // Initialize [Navigator] instance for each screen.
        final screens = provider.screens
            .map(
              (screen) => Navigator(
                key: screen.navigatorState,
                onGenerateRoute: screen.onGenerateRoute,
              ),
            )
            .toList();

        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              children: screens,
              index: provider.currentTabIndex,
            ),
            drawer: const AppDrawer(),
            appBar: AppBar(title: const Text('title')),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}
