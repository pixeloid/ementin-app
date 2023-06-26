import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_theme.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/pages/event/main/program_list_page.dart';
import 'package:eventapp/pages/event/main/widgets/program_item_hero.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/event_provider.dart';
import '../../utils/widgets/w_header.dart';

class EventProgramPage extends StatelessWidget with HeaderDelegate {
  EventProgramPage({
    Key? key,
    ProgramItemModel? selectedProgramItem,
  }) : super(key: key);

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);

    Provider.of<ProgramProvider>(context, listen: false)
        .getProgram(eventProvider.selectedEvent as EventModel);
    return Column(
      children: [
        WHeader(
          title: eventProvider.selectedEvent!.name,
          isShowBackButton: true,
          delegate: this,
        ),
        Builder(builder: (context) {
          final programProvider =
              Provider.of<ProgramProvider>(context, listen: true);

          return Expanded(
            child: programProvider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        color: context.theme().greyWeak,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: "Keresés a címekben",
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Color(0xFFF9FAFB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(26),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              Provider.of<ProgramProvider>(context,
                                      listen: false)
                                  .changeSearchString(value);
                            },
                          ),
                        ),
                      ),
                      programProvider.searchString.length > 3
                          ? Expanded(
                              child: ListView(
                                children: programProvider
                                    .findPresentationByTitle(_controller.value)
                                    .map((programItem) => ProgramItemHero(
                                        presentation: programItem,
                                        showDayName: true,
                                        onTap: () {},
                                        showBody: false,
                                        showLoveButton: true,
                                        hideAuthor: true))
                                    .toList(),
                              ),
                            )
                          : Expanded(
                              child: DefaultTabController(
                                length: eventProvider.eventDays.length,
                                initialIndex: eventProvider.currentDayIndex,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                        labelPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 0),
                                        labelColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        indicator: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: Colors.white,
                                            shape: BoxShape.rectangle),
                                        labelStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          height: 0,
                                          fontSize: 14,
                                        ),
                                        tabs:
                                            eventProvider.eventDays.map((day) {
                                          return Tab(
                                            height: 30,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  DateFormat('EEEE', 'hu')
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
                                                builder:
                                                    (ctx, programProvider, _) {
                                                  return ProgramListPage(
                                                      programProvider
                                                          .getProgramForDay(
                                                              day));
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
        })
      ],
    );
  }
}
