import 'package:auto_route/auto_route.dart';
import 'package:eventapp/features/author/presentation/speaker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../utils/widgets/w_header.dart';
import '../application/speakers_provider.dart';

class EventSpeakersPage extends ConsumerWidget with HeaderDelegate {
  const EventSpeakersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speakers = ref
        .watch(speakersProvider)
        .where((element) => element.presentations.isNotEmpty)
        .toList();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: () =>
                  ref.read(speakersProvider.notifier).getAllSpeakers(),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: speakers.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SpeakerWidget(speaker: speakers[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}
