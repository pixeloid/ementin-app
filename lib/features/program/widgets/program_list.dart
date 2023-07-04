import 'dart:math';

import 'package:eventapp/features/event/domain/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../event/application/event_provider.dart';
import '../domain/program_item_model.dart';
import 'program_header_simple.dart';
import 'program_item.dart';

class ProgramList extends ConsumerStatefulWidget {
  final List<ProgramItemModel> programData;
  const ProgramList(this.programData, {Key? key}) : super(key: key);

  @override
  createState() => _ProgramListPageState();
}

class _ProgramListPageState extends ConsumerState<ProgramList> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      var inProgressIndex = widget.programData.indexWhere((element) {
        final now = DateTime.now();
        return element.start.isBefore(now) && element.end.isAfter(now);
      });
      inProgressIndex = max(inProgressIndex, 0);
      if (inProgressIndex > 0) {
        inProgressIndex +=
            ref.read(currentEventProvider)!.ads.isNotEmpty ? 1 : 0;
        scrollToIndex(inProgressIndex);
      }
    });
    super.initState();
  }

  final ItemScrollController itemController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final EventModel? selectedEvent = ref.watch(currentEventProvider);
    selectedEvent!.ads.shuffle();

    final ad = selectedEvent.ads.isNotEmpty ? selectedEvent.ads.first : null;

    final isCheckedIn = selectedEvent.checkedIn;

    final count =
        widget.programData.length + (isCheckedIn && ad != null ? 1 : 0);
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
          var item =
              widget.programData[i - (isCheckedIn && ad != null ? 1 : 0)];

          return item.children.isEmpty
              ? ProgramItem(
                  id: item.id,
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(243, 244, 246, 1),
                      width: 1,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProgramHeaderSimple(
                        time: !item.isTimeHidden
                            ? '${DateFormat('Hm').format(item.start).toString()}-${DateFormat('Hm').format(item.end).toString()}'
                            : null,
                        title: item.title,
                      ),
                      if (item.chairs != null)
                        Text(
                          item.chairs.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Color(0xFF554577),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                      if (item.children.isNotEmpty)
                        Column(
                          children: List.generate(
                              item.children.length,
                              (index) => Column(
                                    children: [
                                      if (index == 0)
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ProgramItem(
                                        id: item.children[index].id,
                                      ),
                                      if (index < item.children.length - 1)
                                        const SizedBox(
                                          height: 16,
                                        )
                                    ],
                                  )).toList(),
                        ),
                    ],
                  ),
                );
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
