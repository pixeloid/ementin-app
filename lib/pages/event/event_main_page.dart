import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/event/main/event_program_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
                length: eventProvider.eventDays.length,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(color: Color(0xFFE5EAF0)),
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        unselectedLabelColor: Colors.black54,
                        isScrollable: true,
                        indicatorWeight: 1,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
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
                        tabs: eventProvider.eventDays.map((day) {
                          return Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(DateFormat('EEEE', 'hu')
                                  .format(day)
                                  .toUpperCase()),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(
                          children: eventProvider.eventDays.map((day) {
                            return EventProgramPage(date: day);
                          }).toList(),
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
