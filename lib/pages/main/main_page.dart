import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/event_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, eventProvider, _) {
      final authProvider = Provider.of<AuthProvider>(context);

      return AutoTabsRouter(
        routes: [
          const EventMainRoute(),
          const CheckInRoute(),
          authProvider.isAuth ? const ProfileRoute() : const AuthRoute(),
        ],
        duration: const Duration(milliseconds: 400),
        builder: (context, child, animation) {
          // obtain the scoped TabsRouter controller using context
          final tabsRouter = AutoTabsRouter.of(context);

          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          //alterntivly you could use a global key
          return Scaffold(
              body: FadeTransition(
                opacity: animation,
                // the passed child is techinaclly our animated selected-tab page
                child: child,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  // here we switch between tabs
                  tabsRouter.setActiveIndex(index);
                },
                items: [
                  const BottomNavigationBarItem(
                    label: 'Event',
                    icon: Icon(
                      Icons.event,
                    ),
                  ),
                  const BottomNavigationBarItem(
                    label: 'Check-In',
                    icon: Icon(
                      Icons.qr_code_2_outlined,
                    ),
                  ),
                  authProvider.isAuth
                      ? const BottomNavigationBarItem(
                          label: 'Profile',
                          icon: Icon(Icons.person),
                        )
                      : const BottomNavigationBarItem(
                          label: 'Auth',
                          icon: Icon(Icons.login),
                        ),
                ],
              ));
        },
      );
    });
  }
}
