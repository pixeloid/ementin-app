import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import 'package:badges/badges.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var eventProvider = Provider.of<EventProvider>(context);
    final isLoggedIn = authProvider.isAuth;
    final isCheckedIn = eventProvider.selectedEvent?.checkedIn;
    return AutoTabsScaffold(
      routes: [
        const EventMainRoute(),
        const CheckInRoute(),
        const FavouritesRoute(),
        isLoggedIn ? const ProfileRoute() : const AuthRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        final numFavourites =
            Provider.of<ProgramProvider>(context).favourites.length.toString();

        return Container(
          height: 90,
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F3FA),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                index: 0,
                icon: Icons.home_rounded,
                onNavTap: () {
                  tabsRouter.setActiveIndex(0);
                },
              ),
              if (isCheckedIn != null && !isCheckedIn)
                BottomNavItem(
                  index: 1,
                  icon: Icons.qr_code_2,
                  onNavTap: () {
                    tabsRouter.setActiveIndex(1);
                  },
                ),
              if (isLoggedIn)
                BottomNavItem(
                  index: 2,
                  icon: Icons.favorite_outline_sharp,
                  badgeText: numFavourites,
                  onNavTap: () {
                    tabsRouter.setActiveIndex(2);
                  },
                ),
              BottomNavItem(
                index: 3,
                icon: isLoggedIn ? Icons.logout : Icons.login_sharp,
                onNavTap: () {
                  tabsRouter.setActiveIndex(3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.onNavTap,
    this.badgeText,
  }) : super(key: key);

  final String? badgeText;
  final int index;
  final IconData icon;
  final Function()? onNavTap;

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    final currentIndex = tabsRouter.activeIndex;
    final Size size = MediaQuery.of(context).size;

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
            height: 60,
            transform: Matrix4.translationValues(
                0.0, index == currentIndex ? -20 : -5, 0.0),
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
                          size: 30,
                          color: const Color(0xFF2C2B7A),
                        ),
                      )
                    : Icon(
                        icon,
                        size: 30,
                        color: const Color(0xFF2C2B7A),
                      ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(
                0.0, index == currentIndex ? -20 : -15, 0.0),
            child: const Text(
              'MENU',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color(0xFF2C2B7A)),
            ),
          )
        ],
      ),
    );
  }
}
