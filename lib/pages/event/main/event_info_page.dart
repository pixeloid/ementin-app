import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    final er = eventProvider.selectedEvent!.eventRegistration;
    return Scaffold(
      body: Center(
        child: Text(er.toString()),
      ),
    );
  }
}
