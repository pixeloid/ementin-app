import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/app_define/app_theme.dart';
import 'package:ementin_flutter/models/event_model.dart';
import 'package:ementin_flutter/pages/event/event_speaker_details_page.dart';
import 'package:ementin_flutter/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import '../../models/author/author.dart';
import '../../providers/event_provider.dart';
import '../../utils/widgets/w_header.dart';
import 'main/widgets/author.dart';

@RoutePage()
class EventSpeakersPage extends StatelessWidget with HeaderDelegate {
  const EventSpeakersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: true);

    final authors = Provider.of<ProgramProvider>(context, listen: false)
        .authors
        .where((element) => element.presentations?.isNotEmpty == true)
        .toList();

    final programProvider =
        Provider.of<ProgramProvider>(context, listen: false);

    Future<void> refreshProgram() async {
      await programProvider
          .getProgram(eventProvider.selectedEvent as EventModel);
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          WHeader(
            title: 'Előadók',
            isShowBackButton: false,
            delegate: this,
          ),
          Consumer<ProgramProvider>(
            builder: (BuildContext context, programProvider, Widget? child) {
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshProgram,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: authors.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return SpeakerWidget(speaker: authors[index]);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void onBack(context) {
    Navigator.of(context).pop();
  }
}

class SpeakerWidget extends StatelessWidget {
  const SpeakerWidget({
    super.key,
    required this.speaker,
  });

  final Author speaker;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventSpeakerDetailsPage(
                  author: speaker,
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
          color: context.theme().accentTxt,
          border: Border.all(
            color: context.theme().greyWeaker,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AuthorWidget(
              author: speaker,
              hideDescription: false,
            ),
            if (speaker.presentations!.isNotEmpty)
              const Icon(PhosphorIcons.arrow_right_thin)
          ],
        ),
      ),
    );
  }
}
