import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PEventMain extends StatelessWidget {
  const PEventMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
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
                BottomNavigationBarItem(
                    label: 'Users',
                    icon: Icon(
                      Icons.info_rounded,
                    )),
                BottomNavigationBarItem(label: 'Posts'),
                BottomNavigationBarItem(label: 'Settings'),
              ],
            ));
      },
    );
  }
}
