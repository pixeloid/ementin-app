import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/event/main/event_info_page.dart';
import 'package:eventapp/pages/event/main/event_program_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/event_provider.dart';
import '../../utils/widgets/w_header.dart';

class EventMainPage extends StatelessWidget with HeaderDelegate {
  const EventMainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, eventProvider, _) {
      return Scaffold(
        body: Column(children: <Widget>[
          WHeader(
              title: eventProvider.selectedEvent!.name,
              isShowBackButton: true,
              delegate: this),
          DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const TabBar(
                  tabs: [
                    Tab(text: 'Program'),
                    Tab(text: 'Info'),
                  ],
                  indicatorColor: Color(0xFFf172ac),
                  indicatorWeight: 3,
                ),
                Container(
                  height: 400, //height of TabBarView
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: const TabBarView(
                    children: [
                      EventProgramPage(),
                      EventInfoPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}
