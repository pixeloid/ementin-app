// ignore_for_file: prefer_const_constructors

import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/extension/app_extension.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({Key? key}) : super(key: key);
  Future<void> _getEvents(BuildContext context) async {
    await Provider.of<EventProvider>(context, listen: false).getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(child: Scaffold(
      body: Consumer<AuthProvider>(builder: (context, authProvider, index) {
        return Column(
          children: <Widget>[
            WHeader(
              title: 'Rendezvényeink',
              isShowBackButton: false,
            ),
            FutureBuilder(
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CupertinoActivityIndicator(
                          radius: 16.SP,
                        ))
                      : Consumer<EventProvider>(
                          builder: (context, eventProvider, index) {
                          var eventList = eventProvider.events;
                          return Expanded(
                            child: RefreshIndicator(
                              onRefresh: () => _getEvents(context),
                              child: ListView.builder(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                shrinkWrap: true,
                                itemCount: eventList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return EventCard(event: eventList[index]);
                                },
                              ),
                            ),
                          );
                        }),
              future: _getEvents(context),
            ),
          ],
        );
      }),
    ));
  }
}
