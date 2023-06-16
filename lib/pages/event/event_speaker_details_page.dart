import 'package:auto_route/auto_route.dart';
import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/pages/event/main/widgets/program_item.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/w_header.dart';

class EventSpeakerDetailsPage extends StatelessWidget with HeaderDelegate {
  final AuthorModel speaker;

  EventSpeakerDetailsPage({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          WHeader(
            title: speaker.name,
            isShowBackButton: true,
            delegate: this,
          ),
          Column(
            children: speaker.presentations
                .map((programItem) => ProgramItem(presentation: programItem))
                .toList(),
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
