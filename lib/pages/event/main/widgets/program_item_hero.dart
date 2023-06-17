import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'author.dart';
import 'love_button.dart';
import 'my_rating_bar.dart';

class ProgramItemHero extends StatefulWidget {
  final ProgramItemModel presentation;
  final VoidCallback onTap;
  final bool showBody;
  final bool showLoveButton;
  final bool showDayName;
  final bool hideAuthor;
  final String? prefix;

  const ProgramItemHero({
    Key? key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
    this.prefix,
    this.showDayName = false,
    this.hideAuthor = false,
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
      final remaining = widget.presentation.end.difference(now).inSeconds;
      final length = widget.presentation.duration.inSeconds;
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
    final AuthorModel? author = widget.presentation.people.isNotEmpty
        ? widget.presentation.people.first
        : null;
    final checkedIn = Provider.of<EventProvider>(context, listen: false)
        .selectedEvent!
        .checkedIn;

    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: widget.onTap,
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
            border: widget.presentation.body != null
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
                      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                      progressColor: const Color.fromARGB(255, 241, 114, 171),
                    ),
                  ],
                ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!widget.presentation.isTimeHidden)
                          Text(
                            "${DateFormat('Hm').format(widget.presentation.start).toString()} ${widget.showDayName ? DateFormat(' (EEEE)', 'hu').format(widget.presentation.start) : ''}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2C2B7A),
                              height: 1.2,
                            ),
                          ),
                        if (widget.presentation.duration.inMinutes < 120 &&
                            !widget.presentation.isTimeHidden)
                          Text(
                            "${widget.presentation.duration.inMinutes} perc",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFABAAB5),
                              height: 1.2,
                            ),
                          ),
                      ],
                    ),
                    Row(children: [
                      Flexible(
                        child: Text(
                          widget.presentation.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                            height: 1.2,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        if (author != null && !widget.hideAuthor)
                          Author(
                            author: author,
                            hideDescription: true,
                          ),
                        if (checkedIn)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (widget.presentation.rateValue != 0)
                                Row(
                                  children: [
                                    Icon(
                                      PhosphorIcons.star_fill,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    Text(
                                      widget.presentation.rateValue.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              LoveButton(presentation: widget.presentation),
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
  }
}

class ProgramItemFullHero extends StatelessWidget with HeaderDelegate {
  final ProgramItemModel presentation;
  final VoidCallback onTap;
  final bool showBody;
  final bool showLoveButton;

  const ProgramItemFullHero({
    Key? key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkedIn = Provider.of<EventProvider>(context, listen: false)
        .selectedEvent!
        .checkedIn;
    final List<AuthorModel> authors = presentation.people;
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
                                    DateFormat('Hm')
                                        .format(presentation.start)
                                        .toString(),
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
                            Row(children: [
                              Flexible(
                                child: Text(
                                  presentation.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
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
                            if (authors.isNotEmpty)
                              Wrap(
                                  spacing: 6.0,
                                  runSpacing: 6.0,
                                  children: authors
                                      .toList()
                                      .map((e) => Author(
                                            author: e,
                                            hideDescription: false,
                                          ))
                                      .toList()),
                            const SizedBox(height: 16),
                            Html(data: presentation.body, style: {
                              "body": Style(
                                  padding: EdgeInsets.zero,
                                  fontSize: FontSize.larger,
                                  lineHeight: LineHeight.em(1.4),
                                  fontWeight: FontWeight.w500)
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (checkedIn && presentation.isRatable)
                Container(
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
                          value: presentation.rateValue,
                          presentation: presentation),
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}
