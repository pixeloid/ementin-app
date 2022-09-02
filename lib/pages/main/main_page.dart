import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/pages/poll/poll.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/poll_provider.dart';
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
    final pollProvider = Provider.of<PollProvider>(context, listen: false);
    pollProvider.subscribe();
    pollProvider.getPollSession();
    final isLoggedIn = authProvider.isAuth;
    final isCheckedIn = eventProvider.selectedEvent?.checkedIn;
    return Consumer<PollProvider>(
      builder: (_, pollProvider, __) => Scaffold(
        body: Stack(
          children: [
            AutoTabsScaffold(
              routes: [
                const EventMainRoute(),
                if (isCheckedIn!) const RegistrationDetailsRoute(),
                const FavouritesRoute(),
                //    isLoggedIn ? const ProfileRoute() : const AuthRoute(),
              ],
              bottomNavigationBuilder: (_, tabsRouter) {
                final numFavourites = Provider.of<ProgramProvider>(context)
                    .favourites
                    .length
                    .toString();

                return Container(
                  height: 80,
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Color(0xFFF4F2FA), Color(0xFFF6EFF8)]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BottomNavItem(
                        index: 0,
                        icon: Icons.home_rounded,
                        label: 'Program',
                        onNavTap: () {
                          tabsRouter.setActiveIndex(0);
                        },
                      ),
                      if (isLoggedIn && isCheckedIn)
                        BottomNavItem(
                          index: 1,
                          label: 'Regisztrációm',
                          icon: Icons.list_alt_rounded,
                          onNavTap: () {
                            tabsRouter.setActiveIndex(1);
                          },
                        ),
                      if (isLoggedIn)
                        BottomNavItem(
                          index: 2,
                          icon: Icons.favorite_outline_sharp,
                          label: 'Kedvencek',
                          badgeText: numFavourites,
                          onNavTap: () {
                            tabsRouter.setActiveIndex(2);
                          },
                        ),
                      if (isLoggedIn)
                        BottomNavItem(
                          index: 3,
                          label: 'Kilépés',
                          icon: Icons.logout_sharp,
                          onNavTap: () {
                            tabsRouter.setActiveIndex(0);
                            authProvider.logout();
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
            if (pollProvider.poll != null)
              Dialog(
                child: Poll(poll: pollProvider.poll, key: UniqueKey()),
              )
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String label;
  final String? badgeText;
  final int index;
  final IconData icon;
  final Function()? onNavTap;

  const BottomNavItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.onNavTap,
    required this.label,
    this.badgeText,
  }) : super(key: key);

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
            height: index == currentIndex ? 55 : 50,
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
                        badgeColor: const Color(0xFFDB2777),
                        badgeContent: Text(
                          badgeText!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
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
                0.0, index == currentIndex ? -15 : -10, 0.0),
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(
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
