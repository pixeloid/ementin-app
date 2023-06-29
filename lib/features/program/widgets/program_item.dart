import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/program_item_model.dart';
import 'program_item_hero.dart';

class ProgramItem extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
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
