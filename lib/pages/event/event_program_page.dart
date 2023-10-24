import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_theme.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/pages/event/main/program_list_page.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:eventapp/utils/extension/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/event_provider.dart';
import '../../utils/widgets/w_header.dart';

@RoutePage()
class EventProgramPage extends StatelessWidget with HeaderDelegate {
  EventProgramPage({
    Key? key,
    ProgramItemModel? selectedProgramItem,
  }) : super(key: key);

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    final programProvider =
        Provider.of<ProgramProvider>(context, listen: false);

    programProvider.getProgram(selectedEvent as EventModel);
    return Column(
      children: [
        WHeader(
          title: selectedEvent.name,
          isShowBackButton: true,
          delegate: this,
        ),
        Builder(builder: (context) {
          return Expanded(
            child: Selector<ProgramProvider, bool>(
              selector: (_, provider) => provider.isLoading,
              builder: (context, isLoading, child) => isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        /*  Selector<ProgramProvider, bool>(
                          builder: (context, showSearch, child) => showSearch
                              ? ProgramSearch()
                              : TextButton(
                                  onPressed: () => Provider.of<ProgramProvider>(
                                          context,
                                          listen: false)
                                      .toggleSearch(),
                                  child: const Text('Keresés'),
                                ),
                          selector: (_, provider) => provider.showSearch,
                        ), 
                        if (Provider.of<ProgramProvider>(context, listen: true)
                            .filteredList
                            .isEmpty)
                            */
                        Expanded(
                          child: DefaultTabController(
                            length: programProvider.schedule!.days.length,
                            initialIndex: programProvider.schedule?.days
                                        .indexWhere((day) => day.date.isToday())
                                        .isNegative ==
                                    true
                                ? 0
                                : programProvider.schedule?.days.indexWhere(
                                        (day) => day.date.isToday()) ??
                                    0,
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
                                    tabs: programProvider.schedule!.days
                                        .map((day) {
                                      return Tab(
                                        height: 30,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(DateFormat('EEEE')
                                              .format(day.date)
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
                                      children:
                                          programProvider.schedule!.days.map(
                                        (day) {
                                          return ScheduleEventList(day);
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
            ),
          );
        })
      ],
    );
  }
}

class ProgramSearch extends StatelessWidget {
  ProgramSearch({
    super.key,
  });
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final programProvider = Provider.of<ProgramProvider>(context, listen: true);

    return Container(
      color: context.theme().greyWeak,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                hintText: "Keresés a címekben",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                errorText: (programProvider.minSearchTextLength >
                            programProvider.searchString.length &&
                        programProvider.searchString.isNotEmpty)
                    ? 'Minimum ${programProvider.minSearchTextLength} karakter'
                    : null,
                suffixIcon: programProvider.searchString.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _controller.clear();
                          Provider.of<ProgramProvider>(context, listen: false)
                              .changeSearchString('');
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                fillColor: const Color(0xFFF9FAFB),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(26),
                  ),
                ),
              ),
              onChanged: (value) {
                Provider.of<ProgramProvider>(context, listen: false)
                    .changeSearchString(value);
              },
            ),
            /*  if (programProvider.filteredList.isNotEmpty)
              SizedBox(
                height: 300,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      ProgramItemHero(
                    event: programProvider.filteredList[index],
                    showDayName: true,
                    onTap: () {},
                    showBody: false,
                    showLoveButton: true,
                    hideAuthor: true,
                  ),
                  itemCount: programProvider.filteredList.length,
                ),
              ) */
          ],
        ),
      ),
    );
  }
}
