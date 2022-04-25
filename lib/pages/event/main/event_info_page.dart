import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:provider/provider.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numLikes = Provider.of<ProgramProvider>(context).numLikes;
    return BasePage(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 200),
              child: Text("event.name: $numLikes"),
            )
          ],
        ),
      ),
    );
  }
}
