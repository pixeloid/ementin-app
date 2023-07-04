import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/program_provider.dart';
import 'program_item_details.dart';
import 'program_item_hero.dart';

class ProgramItem extends ConsumerWidget {
  final String? prefix;
  final bool showDayName;

  const ProgramItem({
    Key? key,
    required this.id,
    this.prefix,
    this.showDayName = false,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentation = ref.watch(programItemProvider(id));
    return Column(
      children: [
        (presentation != null)
            ? ProgramItemHero(
                presentation: presentation,
                showDayName: showDayName,
                showBody: false,
                prefix: prefix,
                showLoveButton: true,
                onTap: presentation.body != null
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Scaffold(
                                  body: ProgramItemDetails(
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
              )
            : Text('Not found #$id'),
      ],
    );
  }
}
