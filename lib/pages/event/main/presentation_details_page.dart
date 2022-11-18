import 'package:auto_route/auto_route.dart';
import 'package:eventapp/pages/event/main/widgets/qa/qa.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:eventapp/providers/qa_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'widgets/presentation_details.dart';

class PresentationDetailsPage extends StatelessWidget with HeaderDelegate {
  final int programItemId;

  const PresentationDetailsPage({
    Key? key,
    @PathParam('programItemId') required this.programItemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final programProvider = Provider.of<ProgramProvider>(context, listen: true);
    final checkedIn = Provider.of<EventProvider>(context, listen: true)
        .selectedEvent
        ?.checkedIn;

    final programItem = programProvider.findById(programItemId);

    return ChangeNotifierProvider(
      create: (_) => QAProvider(),
      child: Scaffold(
        body: Column(
          children: [
            WHeader(
              title: null,
              isShowBackButton: true,
              delegate: this,
            ),
            Expanded(
              child: (programItem!.activeQAId != null && checkedIn!)
                  ? Material(
                      child: SlidingUpPanel(
                        parallaxEnabled: true,
                        backdropEnabled: true,
                        minHeight: programItem.qAactive ? 100 : 0,
                        // maxHeight: 400,
                        backdropOpacity: .6,
                        header: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(231, 235, 239, 1),
                          ),
                          child: Text(
                            'Kérdésem van!'.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 107, 113, 121),
                                fontSize: 14,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w500,
                                height: 1),
                          ),
                        ),
                        collapsed: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(231, 235, 239, 1),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  width: 48,
                                  height: 3,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    color: Color.fromRGBO(91, 110, 136, 1),
                                  )),
                              const SizedBox(height: 16),
                              Text(
                                'Kérdésem van!'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 107, 113, 121),
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                        panel: programItem.activeQAId != null
                            ? QA(qaSessionId: programItem.activeQAId)
                            : const Center(child: Text("Inactive")),
                        body: PresentationDetails(
                          programItem: programItem,
                        ),
                      ),
                    )
                  : PresentationDetails(
                      programItem: programItem,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}
