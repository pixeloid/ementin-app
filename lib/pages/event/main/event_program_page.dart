import 'package:eventapp/models/program_presentation_model.dart';
import 'package:eventapp/models/program_section_model.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class EventProgramPage extends StatelessWidget {
  const EventProgramPage({
    Key? key,
  }) : super(key: key);

  Future<void> _refreshProgram(BuildContext context) async {
    final selectedEvent =
        Provider.of<EventProvider>(context, listen: false).selectedEvent;

    await Provider.of<ProgramProvider>(context, listen: false)
        .getProgram(selectedEvent!.id);
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
              : Consumer<ProgramProvider>(
                  builder: (ctx, programData, _) => ListView.builder(
                    itemCount: programData.numItems,
                    itemBuilder: (_, i) {
                      var section = programData.programSections[i];
                      return ProgramSection(section: section);
                    },
                  ),
                ),
    );
  }
}

class ProgramItem extends StatelessWidget {
  const ProgramItem({
    Key? key,
    required this.presentation,
  }) : super(key: key);

  final ProgramPresentationModel presentation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        ProgramHero(
          presentation: presentation,
          showBody: false,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                fullscreenDialog: true,
                builder: (BuildContext context) {
                  return Scaffold(
                    body: Container(
                      // The blue background emphasizes that it's a new route.
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 16),
                      alignment: Alignment.topLeft,
                      child: ProgramHero(
                        presentation: presentation,
                        showBody: true,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class ProgramHero extends StatelessWidget {
  final ProgramPresentationModel presentation;
  final VoidCallback onTap;
  final bool showBody;

  const ProgramHero(
      {Key? key,
      required this.presentation,
      required this.onTap,
      required this.showBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loggedIn = Provider.of<AuthProvider>(context, listen: false).isAuth;

    return Hero(
      tag: presentation.iri,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      presentation.start.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "${presentation.duration!.inMinutes} perc",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        presentation.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    loggedIn
                        ? LoveButton(presentation: presentation)
                        : Container(),
                  ],
                ),
                if (showBody && presentation.body != null)
                  Expanded(
                      child: SingleChildScrollView(
                    child: Html(
                      data: presentation.body,
                    ),
                  )),
              ],
            ),
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
      onRatingUpdate: (rating) {},
    );
  }
}

class LoveButton extends StatelessWidget {
  const LoveButton({
    Key? key,
    required this.presentation,
  }) : super(key: key);

  final ProgramPresentationModel presentation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(presentation.isLiked != null
            ? Icons.favorite
            : Icons.favorite_border),
        iconSize: 30,
        color: presentation.isLiked != null
            ? const Color(0xFFf172ac)
            : Colors.grey[400],
        // 5
        onPressed: () {
          Provider.of<ProgramProvider>(context, listen: false)
              .toggleLike(presentation.id);
          //   const snackBar = SnackBar(content: Text('Favorite Pressed'));
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}

class ProgramSection extends StatelessWidget {
  final ProgramSectionModel section;

  const ProgramSection({
    Key? key,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${section.start.toString()}-${section.end.toString()}',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  section.name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          Column(
            children: [
              ListView.builder(
                itemCount: section.presentations.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return ProgramItem(
                    presentation: section.presentations[i],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
