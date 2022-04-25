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
          final currentIndex = tabsRouter.activeIndex;
          Size size = MediaQuery.of(context).size;

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
            bottomNavigationBar: Container(
              height: 80,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F3FA),
              ),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    tabsRouter.setActiveIndex(index);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == currentIndex ? 56 : 56,
                        transform: Matrix4.translationValues(
                            0.0, index == currentIndex ? -15 : 0, 0.0),
                        width: size.width / 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentIndex
                              ? const Color(0xFFf172ac)
                              : const Color(0x00f172ac),
                          border: Border.all(
                              width: 4,
                              color: index == currentIndex
                                  ? const Color(0xFFF5F3FA)
                                  : const Color(0x00F5F3FA)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              listOfIcons[index],
                              size: 22,
                              color: const Color(0xFF2C2B7A),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0.0, -10, 0.0),
                        child: const Text(
                          'MENU',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                              color: Color(0xFF2C2B7A)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: tabsRouter.activeIndex,
            //   onTap: (index) {
            //     // here we switch between tabs
            //     tabsRouter.setActiveIndex(index);
            //   },
            //   items: [
            //     const BottomNavigationBarItem(
            //       label: 'Event',
            //       icon: Icon(
            //         Icons.event,
            //       ),
            //     ),
            //     BottomNavigationBarItem(
            //       label: 'Check-In',
            //       icon: Stack(
            //         children: <Widget>[
            //           const Icon(Icons.qr_code_2_outlined),
            //           Positioned(
            //             right: 0,
            //             child: Container(
            //               padding: const EdgeInsets.all(1),
            //               decoration: BoxDecoration(
            //                 color: Colors.red,
            //                 borderRadius: BorderRadius.circular(6),
            //               ),
            //               constraints: const BoxConstraints(
            //                 minWidth: 12,
            //                 minHeight: 12,
            //               ),
            //               child: Text(
            //                 Provider.of<ProgramProvider>(context)
            //                     .numLikes
            //                     .toString(),
            //                 style: const TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 8,
            //                 ),
            //                 textAlign: TextAlign.center,
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     authProvider.isAuth
            //         ? const BottomNavigationBarItem(
            //             label: 'Profile',
            //             icon: Icon(Icons.person),
            //           )
            //         : const BottomNavigationBarItem(
            //             label: 'Auth',
            //             icon: Icon(Icons.login),
            //           ),
            //   ],
            // ),
          );
        },
      );
    });
  }
}

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.favorite_rounded,
  Icons.settings_rounded,
  Icons.person_rounded,
];
