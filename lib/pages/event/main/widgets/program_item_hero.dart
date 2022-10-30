import 'dart:async';

import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/pages/event/main/presentation_details_page.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'author.dart';
import 'love_button.dart';

class ProgramItemHero extends StatefulWidget {
  final ProgramItemModel presentation;
  final bool showBody;
  final bool showLoveButton;

  final String? prefix;

  const ProgramItemHero(
      {Key? key,
      required this.presentation,
      required this.showBody,
      required this.showLoveButton,
      this.prefix})
      : super(key: key);

  @override
  State<ProgramItemHero> createState() => _ProgramItemHeroState();
}

class _ProgramItemHeroState extends State<ProgramItemHero> {
  int percentProgress = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      final DateTime now = DateTime.now().toUtc().add(const Duration(hours: 2));
      final remaining = widget.presentation.end.difference(now).inSeconds;
      final length = widget.presentation.end
          .difference(widget.presentation.start)
          .inSeconds;
      if (mounted && remaining < length && remaining > 0) {
        setState(() {
          percentProgress = (100 - (100 / length * remaining)).round();
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

    return GestureDetector(
      onTap: widget.presentation.body != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PresentationDetailsPage(
                    programItemId: widget.presentation.id,
                  ),
                ),
              );
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: widget.presentation.inProgress
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
            if (percentProgress > 0 && percentProgress < 100)
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!widget.presentation.isTimeHidden)
                        Text(
                          DateFormat('Hm')
                              .format(widget.presentation.start)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2C2B7A),
                            height: 1.2,
                          ),
                        ),
                      if (widget.presentation.qAactive)
                        CupertinoButton(
                          color: const Color(0xFF5F9588),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          minSize: 16.0,
                          onPressed: () {},
                          child: const SizedBox(
                            child: Text(
                              'Kérdésem van!',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                letterSpacing: 0,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      else if (widget.presentation.duration.inMinutes < 120)
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
                      if (author != null)
                        Author(
                          author: author,
                          hideDescription: true,
                        ),
                      if (checkedIn &&
                          widget.presentation.type == 'Presentation' &&
                          widget.presentation.isRatable)
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
    );
  }
}

class ProgramItemFullHero extends StatelessWidget {
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
    return Hero(
      tag: presentation.iri,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(onTap: onTap, child: null),
      ),
    );
  }
}
