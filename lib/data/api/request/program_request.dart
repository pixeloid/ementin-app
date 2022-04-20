import 'package:eventapp/data/api/graphql_client.dart';
import 'package:eventapp/models/program_model.dart';

class ProgramRequest extends GraphQLAPIClient {
  Future<List<ProgramModel>> getProgram(eventId) async {
    /// Query
    String fetchProgram = """
   query GetPresentationSections(\$input: String!){
      presentationSections(event: \$input){
        edges {
            node {
                name
                event{
                    id
                }
                presentations {
                    totalCount
                    pageInfo {
                    endCursor
                    hasNextPage
                    }
                    edges{
                        cursor
                        node{
                        id
                        title
                        authors {
                            edges {
                                node {
                                    name
                                    institution
                                }
                            }
                        }
                        presentationFavorites{
                        edges{
                            node{
                            id
                            }
                        }
                        }
                    }
                    }
                }
            }
        }
      }
    }

    """;
    final result =
        await execute(queries: fetchProgram, variables: {"input": eventId});
    if (result.hasException) {
      handleException(result);
      return [];
    }
    final Map<String, dynamic>? data = result.data;
    return (data?["presentationSections"]["edges"] as List<dynamic>)
        .map((e) => ProgramModel.fromJson(e["node"] as Map<String, dynamic>))
        .toList();
  }
}
