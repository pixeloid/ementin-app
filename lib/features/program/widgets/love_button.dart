import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../program/domain/program_item_model.dart';
import '../application/program_provider.dart';

class LoveButton extends ConsumerWidget {
  const LoveButton({
    Key? key,
    required this.presentation,
  }) : super(key: key);

  final ProgramItemModel presentation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        icon: Icon(presentation.isFavourite == true
            ? PhosphorIcons.heart_fill
            : PhosphorIcons.heart),
        color: Theme.of(context).colorScheme.primary,

        // 5
        onPressed: () async {
          try {
            await ref.read(programProvider.notifier).toggleLike(presentation);
          } catch (_) {
            const snackBar = SnackBar(content: Text('Error'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
  }
}
