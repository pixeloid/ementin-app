import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:flutter/material.dart';

import '../app_define/app_route.gr.dart';

class EventCard extends StatelessWidget {
  final EventModel? event;

  const EventCard({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).push(PEvent(event: event)),
      splashColor: Theme.of(context).primaryColor,
      child: Text(
        event!.id,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
