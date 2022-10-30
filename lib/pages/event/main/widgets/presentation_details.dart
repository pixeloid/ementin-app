import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'author.dart';
import 'my_rating_bar.dart';

class PresentationDetails extends StatelessWidget {
  const PresentationDetails({super.key, required this.programItem});

  final ProgramItemModel programItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (programItem.body != null)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!programItem.isTimeHidden)
                            Text(
                              DateFormat('Hm')
                                  .format(programItem.start)
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2C2B7A),
                                height: 1.2,
                              ),
                            ),
                          if (!programItem.isTimeHidden)
                            Text(
                              "${programItem.duration.inMinutes} perc",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFABAAB5),
                                height: 1.2,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(children: [
                        Flexible(
                          child: Text(
                            programItem.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1F2937),
                              height: 1.2,
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      if (programItem.people.isNotEmpty)
                        Row(children: [
                          Author(
                            author: programItem.people.first,
                            hideDescription: false,
                          )
                        ]),
                      const SizedBox(height: 16),
                      Html(data: programItem.body, style: {
                        "body": Style(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            fontSize: FontSize.medium,
                            lineHeight: LineHeight.em(1.4),
                            fontWeight: FontWeight.w500)
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (Provider.of<EventProvider>(context).selectedEvent!.checkedIn &&
            programItem.type == 'programItem' &&
            programItem.isRatable)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8, bottom: 32),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.5, color: Colors.black12),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Értékelésem:'.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                MyRatingBar(
                    value: programItem.rateValue, presentation: programItem),
              ],
            ),
          )
      ],
    );
  }
}
