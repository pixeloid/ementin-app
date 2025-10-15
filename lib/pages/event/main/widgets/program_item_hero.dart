import 'dart:async';
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/models/author/author.dart';
import 'package:ementin_flutter/models/schedule_model.dart';
import 'package:ementin_flutter/providers/event_provider.dart';
import 'package:ementin_flutter/providers/program_provider.dart';
import 'package:ementin_flutter/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'author.dart';
import 'love_button.dart';
import 'my_rating_bar.dart';

class ProgramItemHero extends StatefulWidget {
  final ScheduleEvent scheduleEvent;
  final VoidCallback onTap;
  final bool showBody;
  final bool showLoveButton;
  final bool showDayName;
  final bool hideAuthor;
  final bool hasDetails;
  final String? prefix;

  const ProgramItemHero({
    Key? key,
    required this.scheduleEvent,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
    this.prefix,
    this.showDayName = false,
    this.hideAuthor = false,
    this.hasDetails = false,
  }) : super(key: key);

  @override
  State<ProgramItemHero> createState() => _ProgramItemHeroState();
}

class _ProgramItemHeroState extends State<ProgramItemHero> {
  int percentProgress = 0;
  bool inProgress = false;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      final DateTime now = DateTime.now();
      final remaining = widget.scheduleEvent.end.difference(now).inSeconds;
      final length = widget.scheduleEvent.duration.inSeconds;
      if (mounted && remaining < length && remaining > 0) {
        setState(() {
          percentProgress = (100 - (100 / length * remaining)).round();
          inProgress = percentProgress > 0 && percentProgress < 100;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final programProvider =
        Provider.of<ProgramProvider>(context, listen: false);
    final scheduleEventIndexInFlatList = programProvider.flatEvents
        .indexWhere((element) => element.id == widget.scheduleEvent.id);

    return Selector<ProgramProvider, ScheduleEvent?>(
      selector: (context, programProvider) =>
          programProvider.flatEvents[scheduleEventIndexInFlatList],
      builder: (context, favourite, _) {
        final event = programProvider.flatEvents[scheduleEventIndexInFlatList];

        final author =
            event.authors?.isNotEmpty == true ? event.authors!.first : null;
        final checkedIn = Provider.of<EventProvider>(context, listen: true)
            .selectedEvent!
            .checkedIn;

        return Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            onTap: checkedIn ? widget.onTap : null,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: inProgress
                    ? const Color.fromARGB(69, 241, 114, 171)
                    : const Color(0xFFF4F6FA),
                border: event.body != null && checkedIn
                    ? Border.all(
                        color: const Color.fromARGB(255, 227, 227, 227),
                        width: 1,
                      )
                    : null,
              ),
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                children: [
                  if (inProgress)
                    Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: (percentProgress / 100).toDouble(),
                          barRadius: const Radius.circular(5.0),
                          backgroundColor:
                              const Color.fromARGB(255, 222, 222, 222),
                          progressColor:
                              const Color.fromARGB(255, 241, 114, 171),
                        ),
                      ],
                    ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (!event.isTimeHidden)
                              Text(
                                "${DateFormat('Hm').format(event.start).toString()} ${widget.showDayName ? DateFormat(' (EEEE)').format(event.start) : ''}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2C2B7A),
                                  height: 1.2,
                                ),
                              ),
                            Row(
                              children: [
                                if (event.duration.inMinutes < 120 &&
                                    !event.isTimeHidden)
                                  Text(
                                    "${event.duration.inMinutes}'",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFABAAB5),
                                      height: 1.2,
                                    ),
                                  ),
                                if (widget.hasDetails && checkedIn)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      PhosphorIcons.article,
                                      size: 20,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                if (checkedIn && widget.showLoveButton)
                                  LoveButton(presentation: event),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (event.groupName != null && event.groupName!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  event.groupName!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2C2B7A),
                                    height: 1.2,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ),
                            Row(children: [
                              Flexible(
                                child: Text(
                                  event.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1F2937),
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            if (author != null && !widget.hideAuthor)
                              Expanded(
                                child: AuthorWidget(
                                  author: author,
                                  hideDescription: true,
                                  structuredAuthors: event.structuredAuthors,
                                ),
                              ),
                            if (checkedIn)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (event.isRatable && event.rate != null)
                                    Row(
                                      children: [
                                        Icon(
                                          PhosphorIcons.star_fill,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        Text(
                                          event.rate.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

@RoutePage()
class ProgramItemFullHeroPage extends StatelessWidget with HeaderDelegate {
  final ScheduleEvent presentation;
  final VoidCallback onTap;
  final bool showBody;
  final bool showLoveButton;
  final bool showDayName;

  const ProgramItemFullHeroPage({
    Key? key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
    this.showDayName = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkedIn = Provider.of<EventProvider>(context, listen: false)
        .selectedEvent!
        .checkedIn;
    final List<Author>? authors = presentation.authors;

    LineSplitter ls = const LineSplitter();
    final unescape = HtmlUnescape();
    final body = unescape.convert(presentation.body ?? '');
    List<String> lines = ls.convert(body);

    return Column(
      children: [
        WHeader(
          title: null,
          isShowBackButton: true,
          delegate: this,
        ),
        Expanded(
          child: Column(
            children: [
              if (presentation.body != null)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(00, 16, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (!presentation.isTimeHidden)
                                  Text(
                                    "${DateFormat('Hm').format(presentation.start).toString()} (${DateFormat('EEEE').format(presentation.start).toString()})",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2C2B7A),
                                      height: 1.2,
                                    ),
                                  ),
                                if (!presentation.isTimeHidden)
                                  Text(
                                    "${presentation.duration.inMinutes} perc",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFABAAB5),
                                      height: 1.2,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            if (presentation.groupName != null && presentation.groupName!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  presentation.groupName!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2C2B7A),
                                    height: 1.2,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            Row(children: [
                              Flexible(
                                child: Text(
                                  presentation.title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1F2937),
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 8),
                            if (authors!.isNotEmpty)
                              Wrap(
                                  spacing: 6.0,
                                  runSpacing: 6.0,
                                  children: authors
                                      .toList()
                                      .map((e) => AuthorWidget(
                                            author: e,
                                            hideDescription: false,
                                            structuredAuthors: presentation.structuredAuthors,
                                          ))
                                      .toList()),
                            const SizedBox(height: 16),
                            Column(children: [
                              for (var i = 0; i < lines.length; i++)
                                Text(lines[i]),
                              const SizedBox(
                                height: 8,
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (checkedIn && presentation.isRatable)
                Consumer<ProgramProvider>(
                  builder: (BuildContext context, programProvider, _) {
                    final index = programProvider.flatEvents
                        .indexWhere((element) => element.id == presentation.id);
                    final eventInFlatList = programProvider.flatEvents[index];
                    debugPrint(eventInFlatList.rate.toString());
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8, bottom: 32),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.5, color: Colors.black12),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Értékelésem:'.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          MyRatingBar(
                              value: eventInFlatList.rate?.toDouble() ?? 0,
                              scheduleEvent: eventInFlatList),
                        ],
                      ),
                    );
                  },
                )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void onBack(context) {
    Navigator.of(context).pop();
  }
}
