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
                    var program = programData.program[i];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                program.start.toString(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                "${program.duration.inMinutes} perc",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                program.name,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              RatingBar.builder(
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
                              )
                            ],
                          ),
                          IconButton(
                              icon: Icon(program.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              iconSize: 30,
                              color: Colors.grey[400],
                              // 5
                              onPressed: () {
                                Provider.of<ProgramProvider>(context,
                                        listen: false)
                                    .toggleLike(program);
                                const snackBar =
                                    SnackBar(content: Text('Favorite Pressed'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
