import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/checkin_page.dart';
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
              topRight: !eventProvider.selectedEvent!.checkedIn
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(10, 26),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 13),
                        backgroundColor: const Color(0xFFf172ac),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(TutorialOverlay());
                      },
                      child: SizedBox(
                        child: Text(
                          'Check-in'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : null,
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
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        labelColor: Theme.of(context).colorScheme.primary,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            shape: BoxShape.rectangle),
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: 0,
                          fontSize: 14,
                        ),
                        tabs: eventProvider.eventDays.map((day) {
                          return Tab(
                            height: 30,
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

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => 'Barrrier label';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return const CheckInPage();
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'This is a nice overlay',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
