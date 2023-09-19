import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/pages/event/main/widgets/bottom_nav_item.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: eventProvider.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Error :(',
            );
          } else if (snapshot.hasData) {
            final isLoggedIn = authProvider.isAuth;
            final isCheckedIn = eventProvider.selectedEvent?.checkedIn ?? false;
            final hasGallery = eventProvider.selectedEvent?.instaUrl != null;
            final hasSponsors =
                eventProvider.selectedEvent?.sponsorCategories != null;

            return Stack(
              children: [
                AutoTabsScaffold(
                  routes: [
                    EventProgramRoute(),
                    const EventSpeakersRoute(),
                    const RegistrationDetailsRoute(),
                    const FavouritesRoute(),
                    const GalleryRoute(),
                    const SponsorsRoute(),
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
                            colors: <Color>[
                              Color(0xFFF4F2FA),
                              Color(0xFFF6EFF8)
                            ]),
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
                          if (false)
                            BottomNavItem(
                              index: 1,
                              label: 'Előadók',
                              icon: Icons.co_present,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(1);
                              },
                            ),
                          if (isCheckedIn)
                            BottomNavItem(
                              index: 2,
                              label: 'Regisztrációm',
                              icon: Icons.list_alt_rounded,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(2);
                              },
                            ),
                          if (isLoggedIn)
                            BottomNavItem(
                              index: 3,
                              icon: Icons.favorite_outline_sharp,
                              label: 'Kedvencek',
                              badgeText: numFavourites,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(3);
                              },
                            ),
                          if (hasGallery)
                            BottomNavItem(
                              index: 4,
                              label: 'Fotók',
                              icon: Icons.photo_library,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(4);
                              },
                            ),
                          if (hasSponsors)
                            BottomNavItem(
                              index: 5,
                              label: 'Támogatók',
                              icon: Icons.factory,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(5);
                              },
                            ),
                        ],
                      ),
                    );
                  },
                )
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
