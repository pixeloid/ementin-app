import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/pages/event/main/widgets/program_item_hero.dart';
import 'package:flutter/material.dart';
import '../../models/author/author.dart';
import '../../utils/widgets/w_header.dart';

@RoutePage()
class EventSpeakerDetailsPage extends StatelessWidget with HeaderDelegate {
  final Author author;

  EventSpeakerDetailsPage({
    Key? key,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          WHeader(
            title: author.name,
            isShowBackButton: true,
            delegate: this,
          ),
          Column(
            children: author.presentations!
                .map((programItem) => ProgramItemHero(
                    scheduleEvent: programItem,
                    showDayName: true,
                    onTap: () {},
                    showBody: false,
                    showLoveButton: true,
                    hideAuthor: true))
                .toList(),
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
