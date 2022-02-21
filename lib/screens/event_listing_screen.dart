import 'package:eventapp/main.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../event_card.dart';

class EventListingScreen extends StatefulWidget {
  const EventListingScreen({Key? key}) : super(key: key);

  @override
  _EventListingScreen createState() => _EventListingScreen();
}

class _EventListingScreen extends State<EventListingScreen> {
  final String allEventsGraphQL = r'''
    query {
      events {
        edges {
          node {
            id
            name
          }
        }
      }
    }
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Események')),
      body: Query(
        options: QueryOptions(
          document: gql(allEventsGraphQL),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final eventList = result.data?['events']['edges'];
          return Column(
            children: [
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                var event = eventList[index]['node'];
                return EventCard(id: event['id'], name: event['name']);
              }))
            ],
          );
        },
      ),
    );
  }
}
