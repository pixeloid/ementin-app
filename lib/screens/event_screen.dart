import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final eventId = routeArgs['id'] ?? '';
    final eventName = routeArgs['name'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(eventName)),
      body: const Center(
        child: Text('The selected Event page'),
      ),
    );
  }
}
