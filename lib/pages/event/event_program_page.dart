import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/checkin_page.dart';
import 'package:eventapp/pages/event/main/program_list_page.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/event_provider.dart';
import '../../utils/widgets/w_header.dart';

class EventProgramPage extends StatelessWidget with HeaderDelegate {
  const EventProgramPage({
    Key? key,
  }) : super(key: key);

  Future<void> getProgram(BuildContext context) async {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    await Provider.of<ProgramProvider>(context, listen: false)
        .getProgram(selectedEvent!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(builder: (context, eventProvider, _) {
      return FutureBuilder(
          future: getProgram(context),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Scaffold(
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
                                    minimumSize: const Size(10, 26),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 13),
                                    backgroundColor: const Color(0xFFf172ac),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(CheckInOverlay());
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
                              : TextButton(
                                  onPressed: () => Provider.of<AuthProvider>(
                                          context,
                                          listen: false)
                                      .logout(),
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.logout_outlined,
                                    ),
                                  ),
                                ),
                        ),
                        Expanded(
                          child: DefaultTabController(
                            length: eventProvider.eventDays.length,
                            initialIndex: eventProvider.currentDayIndex,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFE5EAF0)),
                                  child: TabBar(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    unselectedLabelColor: Colors.black54,
                                    isScrollable: true,
                                    indicatorWeight: 1,
                                    labelPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 0),
                                    labelColor:
                                        Theme.of(context).colorScheme.primary,
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
                                                color: Colors.grey,
                                                width: 0.5))),
                                    child: TabBarView(
                                      children: eventProvider.eventDays.map(
                                        (day) {
                                          return Consumer<ProgramProvider>(
                                            builder: (ctx, programProvider, _) {
                                              return ProgramListPage(
                                                  programProvider
                                                      .getProgramForDay(day));
                                            },
                                          );
                                        },
                                      ).toList(),
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
    });
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}

class CheckInOverlay extends ModalRoute<void> {
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
