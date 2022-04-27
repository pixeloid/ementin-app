import 'package:eventapp/app_define/app_config.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/pages/base/base_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class EventInfoPage extends StatelessWidget {
  const EventInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: GraphQLProvider(
        client: client,
        child: Subscription(
          options: SubscriptionOptions(
            document: gql('''
                subscription UpdateEventComment{
                  updateEventCommentSubscribe(input: {id: "/api/event_comments/1", clientSubscriptionId: "myId"}) {
                    clientSubscriptionId
                    mercureUrl
                    eventComment{
                      body
                      id
                      updated
                    }
                  }
                }
              '''),
          ),
          builder: (result) {
            print('BUILD');
            if (result.hasException) {
              return Text("Error occured: " + result.exception.toString());
            }

            if (result.isLoading) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }

            return ResultAccumulator.appendUniqueEntries(
                latest: result.data,
                builder: (context, {results}) => const Text('results!.length'));
          },
        ),
      ),
    );
  }
}

final httpLink = HttpLink(AppConfig.shared.env!.graphQLEndPoint);

ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
    link: httpLink));
