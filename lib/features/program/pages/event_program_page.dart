import 'package:eventapp/features/event/application/event_provider.dart';
import 'package:eventapp/features/program/application/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../domain/program_item_model.dart';
import '../widgets/program_list.dart';

class EventProgramPage extends ConsumerWidget {
  EventProgramPage({
    Key? key,
    ProgramItemModel? selectedProgramItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programList = ref.watch(programProvider.notifier).getProgram();
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              // Selector<ProgramProvider, bool>(
              //   builder: (context, showSearch, child) => showSearch
              //       ? ProgramSearch()
              //       : TextButton(
              //           onPressed: () => Provider.of<ProgramProvider>(
              //                   context,
              //                   listen: false)
              //               .toggleSearch(),
              //           child: const Text('Keresés'),
              //         ),
              //   selector: (_, provider) => provider.showSearch,
              // ),
              //  if (Provider.of<ProgramProvider>(context, listen: true)
              //      .filteredList
              //      .isEmpty)
              Expanded(
                child: DefaultTabController(
                  length: ref.read(eventDaysListProvider).length,
                  initialIndex: ref.read(currendDayIndexProvider),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration:
                            const BoxDecoration(color: Color(0xFFE5EAF0)),
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
                          tabs: ref.read(eventDaysListProvider).map((day) {
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
                            children: ref.read(eventDaysListProvider).map(
                              (day) {
                                return ProgramList(
                                    ref.read(programOfDayProvider(day)));
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
      ],
    );
  }
}
/* 
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
            if (programProvider.filteredList.isNotEmpty)
              SizedBox(
                height: 300,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      ProgramItemHero(
                    presentation: programProvider.filteredList[index],
                    showDayName: true,
                    onTap: () {},
                    showBody: false,
                    showLoveButton: true,
                    hideAuthor: true,
                  ),
                  itemCount: programProvider.filteredList.length,
                ),
              )
          ],
        ),
      ),
    );
  }
}
 */