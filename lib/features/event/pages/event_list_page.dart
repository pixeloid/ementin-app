// ignore_for_file: prefer_const_constructors

import 'package:eventapp/app_define/app_theme.dart';
import 'package:eventapp/features/auth/application/auth_provider.dart';
import 'package:eventapp/features/event/application/event_provider.dart';
import 'package:eventapp/features/event/widgets/event_card.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabbed_sliverlist/tabbed_sliverlist.dart';

import '../domain/filter_option.dart';

class EventListPage extends ConsumerWidget {
  const EventListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(isLoggedInProvider, (bool? prevloggedIn, bool loggedIn) {
      ref.read(eventListProvider.notifier).getEvents();
    });

    final filterOptions = [
      FilterOption('past', 'Lezajlott'),
      FilterOption('current', 'Aktuális'),
      FilterOption('future', 'Jövőbeni'),
    ].where((filterOption) =>
        ref.watch(filteredEventListProvider(filterOption)).isNotEmpty);

    return BasePage(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabbedList(
                tabLength: filterOptions.length,
                sliverTabBar: SliverTabBar(
                  backgroundColor: Theme.of(context).canvasColor,
                  title: Text(
                    'Rendezvények'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ref.watch(themeProvider).accent1Muted,
                      height: 1.2,
                    ),
                  ),
                  centerTitle: true,
                  tabBar: TabBar(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    unselectedLabelColor: Colors.black54,
                    isScrollable: true,
                    indicatorWeight: 1,
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    labelColor: Theme.of(context).colorScheme.primary,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        shape: BoxShape.rectangle),
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      height: 0,
                      fontSize: 14,
                    ),
                    tabs: filterOptions
                        .map((filterOption) => Tab(
                              height: 28,
                              text: filterOption.name,
                            ))
                        .toList(),
                  ),
                ),
                tabLists: filterOptions.map(
                  (filterOption) {
                    final events =
                        ref.watch(filteredEventListProvider(filterOption));
                    return TabListBuilder(
                      uniquePageKey: filterOption.id,
                      length: events.length,
                      builder: (BuildContext context, index) {
                        return EventCard(
                          event: events[index],
                        );
                      },
                      widgetBelowListView: Expanded(
                        child: Center(
                          child: events.isEmpty
                              ? Text('No events in progress')
                              : null,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
/*             Expanded(
              child: RefreshIndicator(
                onRefresh: () async =>
                    ref.read(eventListProvider.notifier).getEvents(),
                displacement: 5,
                child: (events.isNotEmpty)
                    ? AnimatedList(
                        key: ref.watch(eventListKeyProvider),
                        padding: EdgeInsets.all(16),
                        initialItemCount: events.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index,
                            Animation<double> animation) {
                          return SlideTransition(
                            position: CurvedAnimation(
                              curve: Curves.easeOut,
                              parent: animation,
                            ).drive((Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: const Offset(0, 0),
                            ))),
                            child: Column(
                              children: [
                                EventCard(event: events[index]),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text('No result'),
                      ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
