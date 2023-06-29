import 'package:eventapp/features/program/application/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

import '../../program/domain/program_item_model.dart';

class LoveButton extends StatelessWidget {
  const LoveButton({
    Key? key,
    required this.presentation,
  }) : super(key: key);

  final ProgramItemModel presentation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(presentation.isLiked != null
            ? PhosphorIcons.heart_fill
            : PhosphorIcons.heart),
        color: Theme.of(context).colorScheme.primary,

        // 5
        onPressed: () {
          //     Provider.of<ProgramProvider>(context, listen: false)
          //       .toggleLike(presentation);
          //   const snackBar = SnackBar(content: Text('Favorite Pressed'));
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}
