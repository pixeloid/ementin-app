import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../widgets/event_card.dart';

class EventListingScreen extends StatefulWidget {
  const EventListingScreen({Key? key}) : super(key: key);
  static const route = '/event/list';

  @override
  _EventListingScreen createState() => _EventListingScreen();
}

class _EventListingScreen extends State<EventListingScreen> {
  var _isInit = true;
  var _isLoading = false;

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
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: eventList.length,
            itemBuilder: (ctx, i) => EventCard(
                id: eventList[i]['node']['id'],
                name: eventList[i]['node']['name']),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
        },
      ),
    );
  }
}
