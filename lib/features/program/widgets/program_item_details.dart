import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../utils/widgets/w_header.dart';
import '../../author/domain/author_model.dart';
import '../../event/application/event_provider.dart';
import '../domain/program_item_model.dart';
import 'author.dart';
import 'my_rating_bar.dart';

class ProgramItemDetails extends ConsumerWidget with HeaderDelegate {
  final ProgramItemModel presentation;
  final VoidCallback onTap;
  final bool showBody;
  final bool showLoveButton;

  const ProgramItemDetails({
    Key? key,
    required this.presentation,
    required this.onTap,
    required this.showBody,
    required this.showLoveButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkedIn = ref.watch(currentEventProvider)!.checkedIn;
    final List<AuthorModel> authors = presentation.people;
    return Column(
      children: [
        WHeader(
          title: null,
          isShowBackButton: true,
          delegate: this,
        ),
        Expanded(
          child: Column(
            children: [
              if (presentation.body != null)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(00, 16, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (!presentation.isTimeHidden)
                                  Text(
                                    DateFormat('Hm')
                                        .format(presentation.start)
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2C2B7A),
                                      height: 1.2,
                                    ),
                                  ),
                                if (!presentation.isTimeHidden)
                                  Text(
                                    "${presentation.duration.inMinutes} perc",
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
                                  presentation.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1F2937),
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 8),
                            if (authors.isNotEmpty)
                              Wrap(
                                  spacing: 6.0,
                                  runSpacing: 6.0,
                                  children: authors
                                      .toList()
                                      .map((e) => Author(
                                            author: e,
                                            hideDescription: false,
                                          ))
                                      .toList()),
                            const SizedBox(height: 16),
                            Html(data: presentation.body, style: {
                              "body": Style(
                                  padding: EdgeInsets.zero,
                                  fontSize: FontSize.larger,
                                  lineHeight: LineHeight.em(1.4),
                                  fontWeight: FontWeight.w500)
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (checkedIn && presentation.isRatable)
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
                          value: presentation.rateValue?.toDouble() ?? 0,
                          presentation: presentation),
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }
}
