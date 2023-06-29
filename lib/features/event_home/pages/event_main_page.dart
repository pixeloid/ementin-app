import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/features/event_home/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/widgets/w_header.dart';
import '../../event/application/events_list_provider.dart';

class EventHomePage extends ConsumerWidget with HeaderDelegate {
  const EventHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final pollProvider = Provider.of<PollProvider>(context, listen: false);
    // pollProvider.subscribe();
    //  pollProvider.getPollSession();
    const isLoggedIn = true;
    const isCheckedIn = true;
    const hasGallery = true;
    final currentEvent = ref.watch(currentEventProvider);
    // final hasSponsors = eventProvider.selectedEvent?.sponsorCategories != null;
    return Scaffold(
      body: Column(
        children: [
          WHeader(
            title: currentEvent!.name,
            isShowBackButton: false,
            delegate: this,
            drawerButton: true,
          ),
          Expanded(
            child: Stack(
              children: [
                AutoTabsScaffold(
                  routes: const [
                    //   EventProgramRoute(),
                    //EventSpeakersRoute(),
                    //RegistrationDetailsRoute(),
                    //FavouritesRoute(),
                    //GalleryRoute(),
                    //SponsorsRoute(),
                    //    isLoggedIn ? const ProfileRoute() : const AuthRoute(),
                  ],
                  bottomNavigationBuilder: (_, tabsRouter) {
                    const numFavourites = 10;

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
                          if (true)
                            BottomNavItem(
                              index: 1,
                              label: 'Előadók',
                              icon: Icons.co_present,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(1);
                              },
                            ),
                          if (isCheckedIn!)
                            BottomNavItem(
                              index: 2,
                              label: 'Regisztrációm',
                              icon: Icons.list_alt_rounded,
                              onNavTap: () {
                                tabsRouter.setActiveIndex(2);
                              },
                            ),
                          if (true)
                            BottomNavItem(
                              index: 3,
                              icon: Icons.favorite_outline_sharp,
                              label: 'Kedvencek',
                              badgeText: numFavourites.toString(),
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
                          //  if (hasSponsors)
                          //    BottomNavItem(
                          //      index: 5,
                          //      label: 'Támogatók',
                          //      icon: Icons.factory,
                          //      onNavTap: () {
                          //        tabsRouter.setActiveIndex(5);
                          //      },
                          //    ),
                        ],
                      ),
                    );
                  },
                ),
                // if (pollProvider.poll != null)
                //   Dialog(
                //     child: Poll(poll: pollProvider.poll, key: UniqueKey()),
                //   )
              ],
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Összes esemény listja'),
              onTap: () {
                AutoRouter.of(context).replace(const EventListRoute());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onBack(BuildContext context) {}
}
