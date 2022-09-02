import 'package:eventapp/app_define/app_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLAPIClient {
  GraphQLClient get client => _client();

  GraphQLClient _client() {
    final HttpLink httpLink = HttpLink(
      AppConfig.shared.env!.graphQLEndPoint,
    );

    /// Auth link
    final AuthLink authLink = AuthLink(getToken: () async {
      final prefs = await SharedPreferences.getInstance();

      if (!prefs.containsKey('token')) {
        return null;
      }

      String? token = prefs.getString('token');

      if (JwtDecoder.isExpired(token!)) {
        return null;
      }

      return 'Bearer $token';
    });

    /// Link
    final Link link = authLink.concat(httpLink);

    /// Policies
    /// - Remove cache
    final policies = Policies(
      fetch: FetchPolicy.networkOnly,
    );

    return GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }

  /// Start execute
  Future<QueryResult> execute(
      {required String queries, dynamic variables}) async {
    final WatchQueryOptions options = WatchQueryOptions(
      document: gql(queries),
      pollInterval: const Duration(seconds: 15),
      fetchResults: true,
      variables: variables ?? {},
    );
    return await _client().query(options);
  }

  /// Handle exception
  void handleException(QueryResult queryResult) {
    if (queryResult.exception?.linkException is HttpLinkServerException) {
      HttpLinkServerException httpLink =
          queryResult.exception?.linkException as HttpLinkServerException;
      if (httpLink.parsedResponse?.errors?.isNotEmpty == true) {
        // ignore: avoid_print
        print(
            "::: GraphQL error message log: ${httpLink.parsedResponse?.errors?.first.message}");
      }

      if (httpLink.response.statusCode == 401) {}
      return;
    }
    if (queryResult.exception?.linkException is NetworkException) {
      NetworkException networkException =
          queryResult.exception?.linkException as NetworkException;
      // ignore: avoid_print
      print("::: GraphQL error message log: ${networkException.message}");
      return;
    }
  }
}
