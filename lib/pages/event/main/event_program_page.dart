import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventProgramPage extends StatelessWidget {
  const EventProgramPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, provider, _) {
      var id = provider.selectedEvent;
      var event = provider.getById(id);
      return Scaffold(
        body: Center(
          child: Text('${event!.name} PROGRAM'),
        ),
      );
    });
  }
}
