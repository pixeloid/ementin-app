import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_define/app_route.gr.dart';

class EventCard extends StatelessWidget {
  final EventModel? event;

  const EventCard({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, eventProvider, child) {
        return InkWell(
          onTap: () {
            eventProvider.selectedEvent = event!.id;
            AutoRouter.of(context).push(const MainRoute(children: [
              EventMainRoute(
                children: [
                  EventInfoRoute(),
                ],
              ),
            ]));
          },
          splashColor: Theme.of(context).primaryColor,
          child: Text(
            event!.id +
                (eventProvider.selectedEvent == event!.id ? '**ACTIVE**' : ''),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
