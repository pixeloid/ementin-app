import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/pages/event/main/widgets/program_item.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/widgets/w_header.dart';

class EventSpeakerDetailsPage extends StatelessWidget with HeaderDelegate {
  final AuthorModel speaker;

  EventSpeakerDetailsPage({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final programProvider =
        Provider.of<ProgramProvider>(context, listen: false);

    List<ProgramItem> programItems = [];

    speaker.presentations.reduce((value, el) {
      final programItem = programProvider.findPresentationByIri(el);
      if (programItem != null) {
        programItems.add(ProgramItem(presentation: programItem));
      }
    });

    return Scaffold(
      body: Column(
        children: <Widget>[
          WHeader(
            title: speaker.name,
            isShowBackButton: true,
            delegate: this,
          ),
          Column(
            children: programItems,
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
