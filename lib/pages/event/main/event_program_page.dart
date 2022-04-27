import 'package:eventapp/models/program_model.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class EventProgramPage extends StatelessWidget {
  const EventProgramPage({
    Key? key,
  }) : super(key: key);

  Future<void> _refreshProgram(BuildContext context) async {
    final eventId =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;
    await Provider.of<ProgramProvider>(context, listen: false)
        .getProgram(eventId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _refreshProgram(context),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<ProgramProvider>(
              builder: (ctx, programData, _) => Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: programData.numItems,
                  itemBuilder: (_, i) {
                    var section = programData.program[i];
                    return Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(243, 244, 246, 1),
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    section.start.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    "${section.duration.inMinutes} perc",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    section.name,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ListView.builder(
                                    itemCount: section.program.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (_, i) {
                                      return Container(
                                        width: 300,
                                        child: Row(
                                          children: [
                                            Text(section.program[i].title)
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class MyRatingBar extends StatelessWidget {
  const MyRatingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return const Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return const Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return const Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return const Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          default:
            return const Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
        }
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class LoveButton extends StatelessWidget {
  const LoveButton({
    Key? key,
    required this.section,
  }) : super(key: key);

  final ProgramModel section;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(section.isLiked ? Icons.favorite : Icons.favorite_border),
        iconSize: 30,
        color: Colors.grey[400],
        // 5
        onPressed: () {
          Provider.of<ProgramProvider>(context, listen: false)
              .toggleLike(section);
          const snackBar = SnackBar(content: Text('Favorite Pressed'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}
