// ignore_for_file: prefer_const_constructors

import 'package:eventapp/features/auth/application/auth_provider.dart';
import 'package:eventapp/features/event/application/event_provider.dart';
import 'package:eventapp/features/event/widgets/event_card.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/filter_option.dart';

class EventListPage extends ConsumerWidget {
  const EventListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(filteredEventListProvider);
    ref.listen(isLoggedInProvider, (bool? prevloggedIn, bool loggedIn) {
      ref.read(eventListProvider.notifier).getEvents();
    });

    final categories = [
      FilterOption('past', 'Lezajlott'),
      FilterOption('current', 'Aktuális'),
      FilterOption('future', 'Jövőbeni'),
    ];

    return BasePage(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            WHeader(
              title: ref.watch(selectedEventFilterProvider)?.id,
              isShowBackButton: false,
              showAuth: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories
                  .map(
                    (category) => FilterChip(
                      label: Text(category.name),
                      onSelected: (selected) => ref
                          .watch(selectedEventFilterProvider.notifier)
                          .update((state) => category),
                      selected: category.id ==
                          ref.watch(selectedEventFilterProvider)?.id,
                    ),
                  )
                  .toList(),
            ),
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
}
