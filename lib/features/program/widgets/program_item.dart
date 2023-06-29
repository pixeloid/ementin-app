import 'package:flutter/material.dart';

import '../domain/program_item_model.dart';
import 'program_item_hero.dart';

class ProgramItem extends StatelessWidget {
  final String? prefix;
  final bool showDayName;

  const ProgramItem({
    Key? key,
    required this.presentation,
    this.prefix,
    this.showDayName = false,
  }) : super(key: key);

  final ProgramItemModel presentation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramItemHero(
          presentation: presentation,
          showDayName: showDayName,
          showBody: false,
          prefix: prefix,
          showLoveButton: true,
          onTap: presentation.body != null
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                            body: ProgramItemFullHero(
                              presentation: presentation,
                              showBody: true,
                              showLoveButton:
                                  presentation.type == 'Presentation',
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
