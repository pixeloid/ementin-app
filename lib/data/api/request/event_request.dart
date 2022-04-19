import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/data/api/graphql_client.dart';

class EventRequest extends GraphQLAPIClient {
  Future<List<EventModel>> getEvents() async {
    /// Query
    String fetchEvents = """
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
    """;
    final result = await execute(queries: fetchEvents);
    if (result.hasException) {
      handleException(result);
      return [];
    }
    final Map<String, dynamic>? data = result.data;
    return (data?["events"]["edges"] as List<dynamic>)
        .map((e) => EventModel.fromJson(e["node"] as Map<String, dynamic>))
        .toList();
  }
}
