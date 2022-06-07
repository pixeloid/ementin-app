import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationDetailsPage extends StatelessWidget {
  const RegistrationDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);

    return Center(
      child: Column(
        children: [
          WHeader(
            title:
                '${eventProvider.selectedEvent!.eventRegistration!.firstname} ${eventProvider.selectedEvent!.eventRegistration!.lastname}',
            isShowBackButton: false,
          ),
          Stack(children: [
            Text('${eventProvider.selectedEvent!.eventRegistration!.iri}'),
          ])
        ],
      ),
    );
  }
}
