import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/features/event_home/widgets/bottom_nav_item.dart';
import 'package:eventapp/features/program/application/program_provider.dart';
import 'package:eventapp/features/user/application/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/widgets/w_header.dart';
import '../../../widgets/error_response_handler.dart';
import '../../author/application/speakers_provider.dart';
import '../../event/application/event_provider.dart';

class EventHomePage extends ConsumerWidget with HeaderDelegate {
  EventHomePage({
    Key? key,
  }) : super(key: key);

  final _eventPreloadFutureProvider = FutureProvider.autoDispose<void>(
    (ref) async {
      await Future.wait([
        ref.watch(programProvider.notifier).getProgram(),
        ref.watch(speakersProvider.notifier).getAllSpeakers(),
        ref.watch(checkedInUsersProvider.notifier).getCheckedInUsers(),
      ]);
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final pollProvider = Provider.of<PollProvider>(context, listen: false);
    // pollProvider.subscribe();
    //  pollProvider.getPollSession();
    final bool isCheckedIn = ref.watch(currentEventProvider)!.checkedIn;
    final bool hasGallery =
        ref.watch(currentEventProvider)!.instaUrl?.isNotEmpty ?? false;
    // final hasSponsors = eventProvider.selectedEvent?.sponsorCategories != null;

    final eventPreloadFuture = ref.watch(_eventPreloadFutureProvider);

    return Scaffold(
      body: Column(
        children: [
          WHeader(
            title: isCheckedIn.toString(),
            isShowBackButton: false,
            delegate: this,
            drawerButton: true,
          ),
          Expanded(
            child: eventPreloadFuture.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, st) => Scaffold(
                body: ErrorResponseHandler(
                  error: error,
                  retryCallback: () => ref.refresh(_eventPreloadFutureProvider),
                  stackTrace: st,
                ),
              ),
              data: (_) => Stack(
                children: [
                  AutoTabsScaffold(
                    routes: [
                      EventProgramRoute(),
                      const EventSpeakersRoute(),
                      const CheckedInUsersListRoute(),
                      const RegistrationDetailsRoute(),
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
                            if (isCheckedIn)
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
                                label: 'Résztvevők',
                                icon: Icons.people_alt,
                                onNavTap: () {
                                  tabsRouter.setActiveIndex(2);
                                },
                              ),
                            if (isCheckedIn)
                              BottomNavItem(
                                index: 3,
                                label: 'Regisztrációm',
                                icon: Icons.list_alt_rounded,
                                onNavTap: () {
                                  tabsRouter.setActiveIndex(3);
                                },
                              ),
                            if (isCheckedIn)
                              BottomNavItem(
                                index: 4,
                                icon: Icons.favorite_outline_sharp,
                                label: 'Kedvencek',
                                badgeText: numFavourites.toString(),
                                onNavTap: () {
                                  tabsRouter.setActiveIndex(4);
                                },
                              ),
                            if (hasGallery && isCheckedIn)
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
                AutoRouter.of(context).popUntil((route) => route.isFirst);
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
