import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/program_header_simple.dart';
import 'widgets/program_item.dart';

class EventProgramPage extends StatelessWidget {
  final DateTime date;

  const EventProgramPage({
    Key? key,
    required this.date,
  }) : super(key: key);

  Future<void> _refreshProgram(BuildContext context) async {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    await Provider.of<ProgramProvider>(context, listen: false)
        .getProgram(selectedEvent!.id, date: date);
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    final isCheckedIn =
        Provider.of<EventProvider>(context).selectedEvent?.checkedIn;

    selectedEvent!.ads.shuffle();
    final ad = selectedEvent.ads.isNotEmpty ? selectedEvent.ads.first : null;
    return FutureBuilder(
      future: _refreshProgram(context),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<ProgramProvider>(
              builder: (ctx, programData, _) {
                final count =
                    programData.numItems + (isCheckedIn! && ad != null ? 1 : 0);

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(color: Color(0xFFFcFcFc)),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: count,
                    itemBuilder: (_, i) {
                      if (i >= programData.numItems) return Container();
                      var item = programData.programItems[i];

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
                                image: NetworkImage(
                                    "https://home.ementin.hu${ad.image}"),
                              ),
                            ),
                          ),
                        );
                      }

                      return item.children.isEmpty
                          ? ProgramItem(
                              presentation: item,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProgramHeaderSimple(
                                    time:
                                        '${item.start.toString()}-${item.end.toString()}',
                                    title: item.title,
                                  ),
                                  if (item.chairs != null)
                                    Text(
                                      'Üléselnök: ${item.chairs}',
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
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ListView.separated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              height: 12,
                                            );
                                          },
                                          itemCount: item.children.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (_, i) {
                                            return ProgramItem(
                                              presentation: item.children[i],
                                            );
                                          },
                                        )
                                      ],
                                    )
                                ],
                              ));
                    },
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
}
