import 'package:flutter/material.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/pages/base/base_page.dart';

import 'package:provider/provider.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(child: Consumer<EventProvider>(
      builder: (BuildContext context, EventProvider eventProvider, _) {
        var id = eventProvider.selectedEvent;
        var event = eventProvider.getById(id);
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: Text(event!.name),
              )
            ],
          ),
        );
      },
    ));
  }
}
