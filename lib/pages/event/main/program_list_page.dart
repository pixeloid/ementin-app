import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/models/schedule_model.dart';
import 'package:eventapp/pages/event/main/widgets/program_header_simple.dart';
import 'package:eventapp/pages/event/main/widgets/program_item.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ProgramListPage extends StatefulWidget {
  final Day scheduleDay;
  const ProgramListPage(this.scheduleDay, {Key? key}) : super(key: key);

  @override
  State<ProgramListPage> createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
/*       var inProgressIndex = widget.scheduleDay.indexWhere((element) {
        final now = DateTime.now();
        return element.start.isBefore(now) && element.end.isAfter(now);
      });
      inProgressIndex = max(inProgressIndex, 0);
      if (inProgressIndex > 0) {
        inProgressIndex += Provider.of<EventProvider>(context, listen: false)
                .selectedEvent!
                .ads
                .isNotEmpty
            ? 1
            : 0;
        scrollToIndex(inProgressIndex);
      }
 */
    });
    super.initState();
  }

  final ItemScrollController itemController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final EventModel selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent!;
    selectedEvent.ads.shuffle();
    final ad = selectedEvent.ads.isNotEmpty ? selectedEvent.ads.first : null;

    final isCheckedIn =
        Provider.of<EventProvider>(context).selectedEvent?.checkedIn;

    final count = widget.scheduleDay.eventGroups.length +
        (isCheckedIn! && ad != null ? 1 : 0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Color(0xFFFcFcFc)),
      child: ScrollablePositionedList.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
        padding: const EdgeInsets.only(top: 16),
        itemCount: count,
        itemScrollController: itemController,
        itemBuilder: (_, i) {
          //  if (i >= widget.programData.length) return Container();

          if (i == 0 && isCheckedIn && ad != null) {
            return GestureDetector(
              onTap: () => ad.url != null ? _openUrl(ad.url) : null,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 4 / 1,
                  child: Image(
                    image: NetworkImage("https://home.ementin.hu${ad.image}"),
                  ),
                ),
              ),
            );
          }

          return Column(
              children: widget.scheduleDay.eventGroups
                  .map((group) => Column(
                        children: group.columns
                            .map(
                              (column) => Column(
                                children: column.events!
                                    .map(
                                      (event) => event.children.isEmpty
                                          ? ProgramItem(
                                              presentation: event,
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8),
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8),
                                                ),
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      243, 244, 246, 1),
                                                  width: 1,
                                                ),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ProgramHeaderSimple(
                                                    time: !event.isTimeHidden
                                                        ? '${DateFormat('Hm').format(event.start).toString()}-${DateFormat('Hm').format(event.end).toString()}'
                                                        : null,
                                                    title: event.title,
                                                  ),
                                                  if (event.chairs != null)
                                                    Text(
                                                      event.chairs.toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF554577),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.2,
                                                      ),
                                                    ),
                                                  if (event.children.isNotEmpty)
                                                    Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        ListView.separated(
                                                          separatorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return const SizedBox(
                                                              height: 12,
                                                            );
                                                          },
                                                          itemCount: event
                                                              .children.length,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemBuilder: (_, i) {
                                                            return ProgramItem(
                                                              presentation: event
                                                                  .children[i],
                                                            );
                                                          },
                                                        )
                                                      ],
                                                    )
                                                ],
                                              ),
                                            ),
                                    )
                                    .toList(),
                              ),
                            )
                            .toList(),
                      ))
                  .toList());

/*           var item =
              widget.scheduleDay[i - (isCheckedIn && ad != null ? 1 : 0)];

          */
        },
      ),
    );
  }

  _openUrl(url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  void scrollToIndex(int index) {
    if (itemController.isAttached) {
      itemController.jumpTo(
        index: index,
      );
    }
  }
}
