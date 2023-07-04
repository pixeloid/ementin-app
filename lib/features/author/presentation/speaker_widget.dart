import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app_define/app_theme.dart';
import '../../program/widgets/author.dart';
import '../domain/author_model.dart';
import 'event_speaker_details_page.dart';

class SpeakerWidget extends ConsumerWidget {
  const SpeakerWidget({
    super.key,
    required this.speaker,
  });

  final AuthorModel speaker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventSpeakerDetailsPage(
                  speaker: speaker,
                )));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: ref.watch(themeProvider).accentTxt,
          border: Border.all(
            color: ref.watch(themeProvider).greyWeaker,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Author(
              author: speaker,
              hideDescription: false,
            ),
            if (speaker.presentations.isNotEmpty)
              const Icon(PhosphorIcons.arrow_right_thin)
          ],
        ),
      ),
    );
  }
}
