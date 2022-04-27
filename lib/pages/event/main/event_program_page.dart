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
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8),
                    child: ProgramList(),
                  ));
  }
}

class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => scrollToActive(context));
  }

  @override
  Widget build(BuildContext context) {
    final programList =
        Provider.of<ProgramProvider>(context, listen: false).program;
    return ListView.builder(
      itemCount: programList.length,
      controller: scrollController,
      itemBuilder: (context, i) {
        var program = programList[i];
        var item = ProgramItem(programSection: program);

        return item;
      },
    );
  }

  scrollToActive(BuildContext context) {
    final targetContext = Provider.of<ProgramProvider>(context, listen: false)
        .program[4]
        .key
        .currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(targetContext,
          duration: const Duration(milliseconds: 500));
    }
  }
}

class ProgramItem extends StatelessWidget {
  const ProgramItem({Key? key, required this.programSection}) : super(key: key);

  final ProgramSectionModel programSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      key: programSection.key,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                programSection.start.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${programSection.duration.inMinutes} perc",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                programSection.name,
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
                onRatingUpdate: (rating) {},
              )
            ],
          ),
          IconButton(
              icon: Icon(programSection.isLiked
                  ? Icons.favorite
                  : Icons.favorite_border),
              iconSize: 30,
              color: Colors.grey[400],
              // 5
              onPressed: () {
                Provider.of<ProgramProvider>(context, listen: false)
                    .toggleLike(programSection);
                const snackBar = SnackBar(content: Text('Favorite Pressed'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ],
      ),
    );
  }
}
