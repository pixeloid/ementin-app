import 'package:eventapp/main.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EventListingPage extends StatefulWidget {
  const EventListingPage({Key? key}) : super(key: key);

  @override
  _EventListingPage createState() => _EventListingPage();
}

class _EventListingPage extends State<EventListingPage> {
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
              Button(),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                var event = eventList[index]['node'];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8.0),
                    child: Text(
                      event['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }))
            ],
          );
        },
      ),
    );
  }
}
