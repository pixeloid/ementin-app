import 'package:eventapp/models/program_item_model.dart';
import 'package:flutter/material.dart';

import 'program_item_hero.dart';

class ProgramItem extends StatelessWidget {
  final String? prefix;

  const ProgramItem({Key? key, required this.presentation, this.prefix})
      : super(key: key);

  final ProgramItemModel presentation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramItemHero(
          presentation: presentation,
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
