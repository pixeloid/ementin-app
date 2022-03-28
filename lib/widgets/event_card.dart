import 'package:eventapp/models/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final EventModel? event;

  const EventCard({
    Key? key,
    this.event,
  }) : super(key: key);

  void selectEvent(context) async {
    print(context.toString());
    // context.navigator()?.pushNamed(AppRoute.routeEvent).then((_) async {
    //  await provider.getProfile();
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectEvent(context),
      splashColor: Theme.of(context).primaryColor,
      child: Text(
        event!.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
