// ignore_for_file: prefer_const_constructors

import 'package:eventapp/widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/extension/app_extension.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:eventapp/generated/l10n.dart';

import 'package:provider/provider.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> with HeaderDelegate {
  ///TicketsProvider
  late EventProvider _provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _provider = context.read<EventProvider>();
      await _provider.getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(child: Consumer<EventProvider>(
      builder: (BuildContext context, EventProvider provider, _) {
        final eventList = provider.events;
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              WHeader(
                  title: 'Rendezvényeink',
                  isShowBackButton: false,
                  delegate: this),
              if (eventList == null)
                CupertinoActivityIndicator(
                  radius: 16.SP,
                )
              else if (eventList.isEmpty)
                Text(S.of(context).data_is_empty)
              else
                ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: eventList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <EventCard>[
                          EventCard(event: eventList[index]),
                        ],
                      );
                    }),
            ],
          ),
        );
      },
    ));
  }

  @override
  void deactivate() {
    _provider.resetState();
    super.deactivate();
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
