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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            WHeader(
              title: eventProvider.selectedEvent!.name,
              isShowBackButton: true,
              delegate: this,
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(color: Color(0xFFE5EAF0)),
                      child: TabBar(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        unselectedLabelColor: Colors.black54,
                        isScrollable: true,
                        indicatorWeight: 1,
                        labelPadding: EdgeInsets.symmetric(horizontal: 16),
                        labelColor: Theme.of(context).colorScheme.primary,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            shape: BoxShape.rectangle),
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontSize: 14,
                        ),
                        tabs: const [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Program"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Info"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: const TabBarView(
                          children: [
                            EventProgramPage(),
                            EventInfoPage(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}
