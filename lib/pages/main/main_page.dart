import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/event_provider.dart';
import 'package:badges/badges.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, eventProvider, _) {
      final isLoggedIn = Provider.of<AuthProvider>(context).isAuth;
      return AutoTabsRouter(
        routes: [
          const EventMainRoute(),
          const CheckInRoute(),
          const FavouritesRoute(),
          isLoggedIn ? const ProfileRoute() : const AuthRoute(),
        ],
        duration: const Duration(milliseconds: 400),
        builder: (context, child, animation) {
          // obtain the scoped TabsRouter controller using context

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
              bottomNavigationBar: const MainBottomNav());
        },
      );
    });
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.size,
    required this.index,
    required this.icon,
    required this.onNavTap,
    this.badgeText,
  }) : super(key: key);

  final String? badgeText;
  final Size size;
  final int index;
  final IconData icon;
  final Function()? onNavTap;

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    final currentIndex = tabsRouter.activeIndex;
    return InkWell(
      onTap: onNavTap,
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
                badgeText != null && badgeText != '0'
                    ? Badge(
                        badgeContent: Text(badgeText!),
                        child: Icon(
                          icon,
                          size: 22,
                          color: const Color(0xFF2C2B7A),
                        ),
                      )
                    : Icon(
                        icon,
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
    );
  }
}

List<IconData> icons = [
  Icons.home_rounded,
  Icons.qr_code_2,
  Icons.favorite_rounded,
  Icons.login,
];

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final tabsRouter = AutoTabsRouter.of(context);
    final isLoggedIn = Provider.of<AuthProvider>(context, listen: false).isAuth;

    return Consumer<ProgramProvider>(
      builder: (
        context,
        programProvider,
        child,
      ) =>
          Container(
        height: 80,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F3FA),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              size: size,
              index: 0,
              icon: Icons.home_rounded,
              onNavTap: () {
                tabsRouter.setActiveIndex(0);
              },
            ),
            BottomNavItem(
              size: size,
              index: 1,
              icon: Icons.qr_code_2,
              onNavTap: () {
                tabsRouter.setActiveIndex(1);
              },
            ),
            BottomNavItem(
              size: size,
              index: 2,
              icon: Icons.favorite_outline_sharp,
              badgeText: programProvider.favourites.length.toString(),
              onNavTap: () {
                tabsRouter.setActiveIndex(2);
              },
            ),
            BottomNavItem(
              size: size,
              index: 3,
              icon: isLoggedIn ? Icons.logout : Icons.login_sharp,
              onNavTap: () {
                tabsRouter.setActiveIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}