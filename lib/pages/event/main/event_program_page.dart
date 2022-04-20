import 'package:eventapp/providers/event_provider.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
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
                  itemCount: programData.program?.length,
                  itemBuilder: (_, i) {
                    var program = programData.program![i];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                program!.name,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(Icons.favorite_border),
                              iconSize: 30,
                              color: Colors.grey[400],
                              // 5
                              onPressed: () {
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
