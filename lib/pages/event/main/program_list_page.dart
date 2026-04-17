import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/models/event_model.dart';
import 'package:ementin_flutter/models/schedule_model.dart';
import 'package:ementin_flutter/pages/event/main/widgets/banner_rotator.dart';
import 'package:ementin_flutter/pages/event/main/widgets/program_header_simple.dart';
import 'package:ementin_flutter/pages/event/main/widgets/program_item.dart';
import 'package:ementin_flutter/providers/auth_provider.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:ementin_flutter/utils/extension/color_hex_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

@RoutePage()
class ScheduleEventList extends StatefulWidget {
  final Day scheduleDay;
  const ScheduleEventList(this.scheduleDay, {Key? key}) : super(key: key);

  @override
  State<ScheduleEventList> createState() => _ScheduleEventListState();
}

class _ScheduleEventListState extends State<ScheduleEventList> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final now = DateTime.now();
      var inProgressIndex = widget.scheduleDay.eventGroups.indexWhere((group) =>
          group.columns
              .where((column) => column.events!
                  .where((event) =>
                      event.start.isBefore(now) && event.end.isAfter(now))
                  .isNotEmpty)
              .isNotEmpty);
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
    });
    super.initState();
  }

  final ItemScrollController itemController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final EventModel selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent!;
    selectedEvent.ads.shuffle();
    final ads = selectedEvent.ads.isNotEmpty ? selectedEvent.ads : null;
    selectedEvent.ads.shuffle();
    final isCheckedIn =
        Provider.of<EventProvider>(context).selectedEvent?.checkedIn;
    Provider.of<AuthProvider>(context, listen: true);
    var hasAd = isCheckedIn! && ads != null;
    final count = widget.scheduleDay.eventGroups.length + (hasAd ? 1 : 0);
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

          if (i == 0 && isCheckedIn && ads != null) {
            return BannerRotator(
              ads: ads,
              rotationDuration: const Duration(seconds: 5),
            );
          } else {
            final columns =
                widget.scheduleDay.eventGroups[i - (hasAd ? 1 : 0)].columns;
            return Column(
              children: columns
                  .map(
                    (column) => Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: HexColor.fromHex(column.color ?? '#f9f9f9'),
                        border: Border.all(
                          color: const Color.fromRGBO(243, 244, 246, 1),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 8),
                      child: Column(children: [
                        const SizedBox(
                          height: 8,
                        ),
                        if (column.name != null)
                          Text(
                            column.name.toString().toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        ...column.events!.map(
                          (event) => event.children.isEmpty
                              ? ScheduleEventWidget(
                                  scheduleEvent: event,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          243, 244, 246, 1),
                                      width: 1,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
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
                                          style: const TextStyle(
                                            color: Color(0xFF554577),
                                            fontWeight: FontWeight.w500,
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
                                            ..._buildGroupedChildren(
                                                event.children),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                        )
                      ]),
                    ),
                  )
                  .toList(),
            );
          }

/*           var item =
              widget.scheduleDay[i - (isCheckedIn && ad != null ? 1 : 0)];

          */
        },
      ),
    );
  }

  void scrollToIndex(int index) {
    if (itemController.isAttached) {
      itemController.jumpTo(
        index: index,
      );
    }
  }

  List<Widget> _buildGroupedChildren(List<ScheduleEvent> children) {
    final List<Widget> widgets = [];
    int i = 0;
    while (i < children.length) {
      final groupName = children[i].groupName;
      final hasGroup = groupName != null && groupName.isNotEmpty;

      if (!hasGroup) {
        if (widgets.isNotEmpty) widgets.add(const SizedBox(height: 12));
        widgets.add(ScheduleEventWidget(scheduleEvent: children[i]));
        i++;
        continue;
      }

      int j = i;
      while (j < children.length && children[j].groupName == groupName) {
        j++;
      }
      final groupItems = children.sublist(i, j);

      if (widgets.isNotEmpty) widgets.add(const SizedBox(height: 12));
      widgets.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF2C2B7A).withOpacity(0.25),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 2),
              child: Text(
                groupName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C2B7A),
                  height: 1.2,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            for (int k = 0; k < groupItems.length; k++) ...[
              if (k > 0) const SizedBox(height: 12),
              ScheduleEventWidget(
                scheduleEvent: groupItems[k],
                hideGroupName: true,
              ),
            ],
          ],
        ),
      ));
      i = j;
    }
    return widgets;
  }
}
