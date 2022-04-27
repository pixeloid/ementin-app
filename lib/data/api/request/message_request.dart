import 'package:eventapp/data/api/graphql_client.dart';
import 'package:eventapp/models/message_model.dart';

class MessageRequest extends GraphQLAPIClient {
  Future<List<MessageModel>> getMessages() async {
    /// Query
    String fetchMessages = """
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
    final result = await execute(queries: fetchMessages);
    if (result.hasException) {
      handleException(result);
      return [];
    }
    final Map<String, dynamic>? data = result.data;
    return (data?["messages"]["edges"] as List<dynamic>)
        .map((e) => MessageModel.fromJson(e["node"] as Map<String, dynamic>))
        .toList();
  }
}
