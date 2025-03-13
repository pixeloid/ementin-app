import 'package:ementin_flutter/models/schedule_model.dart';
import 'package:ementin_flutter/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class LoveButton extends StatelessWidget {
  const LoveButton({
    Key? key,
    required this.presentation,
  }) : super(key: key);

  final ScheduleEvent presentation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(presentation.favourite! > 0
            ? PhosphorIcons.heart_fill
            : PhosphorIcons.heart),
        color: Theme.of(context).colorScheme.primary,

        // 5
        onPressed: () {
          Provider.of<ProgramProvider>(context, listen: false)
              .toggleFavoriteStatus(presentation.id);
          //   const snackBar = SnackBar(content: Text('Favorite Pressed'));
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}
