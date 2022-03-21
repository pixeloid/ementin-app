import 'package:eventapp/providers/event.dart';
import 'package:flutter/material.dart';

import '../screens/event/main/event_main_info_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  void selectEvent(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EventMainInfoScreen.route,
        arguments: {'id': id, 'name': name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectEvent(context),
      splashColor: Theme.of(context).primaryColor,
      child: GridTile(
        child: Text(
          event.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
