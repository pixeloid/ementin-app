import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:ementin_flutter/pages/base/base_page.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EventInfoPage extends StatelessWidget {
  const EventInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    final er = eventProvider.selectedEvent!.eventRegistration;
    return BasePage(
      child: Center(
        child: Text(er.toString()),
      ),
    );
  }
}
