// ignore_for_file: prefer_const_constructors

import 'package:eventapp/features/event/application/events_list_provider.dart';
import 'package:eventapp/features/event/widgets/event_card.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventListPage extends ConsumerWidget {
  const EventListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventListProvider);
    debugPrint('reloaded');
    return BasePage(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            WHeader(
              title: 'Rendezvényeink',
              isShowBackButton: false,
              showAuth: false,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async =>
                    ref.read(eventListProvider.notifier).getEvents(),
                displacement: 5,
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: events.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EventCard(event: events[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
