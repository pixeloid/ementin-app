import 'package:flutter/material.dart';

class EventMainInfoScreen extends StatelessWidget {
  const EventMainInfoScreen({
    Key? key,
  }) : super(key: key);
  static const route = '/event/main/info';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Event details'),
      ),
    );
  }
}
