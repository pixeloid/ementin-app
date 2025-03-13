// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/providers/auth_provider.dart';
import 'package:ementin_flutter/widgets/event_card.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:ementin_flutter/pages/base/base_page.dart';
import 'package:ementin_flutter/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:ementin_flutter/l10n/app_localizations.dart';

import 'package:provider/provider.dart';

@RoutePage()
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
              title: AppLocalizations.of(context)!.our_events,
              isShowBackButton: false,
              showAuth: false,
            ),
            FutureBuilder(
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Consumer<EventProvider>(
                      builder: (context, eventProvider, index) {
                        var eventList = eventProvider.events;
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => _getEvents(context),
                            child: ListView.separated(
                              padding: EdgeInsets.all(16),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount: eventList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return EventCard(event: eventList[index]);
                              },
                            ),
                          ),
                        );
                      },
                    ),
              future: _getEvents(context),
            ),
          ],
        );
      }),
    ));
  }
}
