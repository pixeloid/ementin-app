import 'package:eventapp/models/schedule_model.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'program_item_hero.dart';

class ScheduleEventWidget extends StatelessWidget {
  final String? prefix;
  final bool showDayName;
  final ScheduleEvent scheduleEvent;

  const ScheduleEventWidget({
    Key? key,
    required this.scheduleEvent,
    this.prefix,
    this.showDayName = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramItemHero(
          event: scheduleEvent,
          showDayName: showDayName,
          showBody: false,
          prefix: prefix,
          showLoveButton: true,
          onTap: scheduleEvent.body != null
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                            body: ProgramItemFullHeroPage(
                              presentation: scheduleEvent,
                              showBody: true,
                              showLoveButton:
                                  scheduleEvent.type == 'Presentation',
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          )));
                }
              : () {},
        ),
      ],
    );
  }
}
