import 'package:eventapp/environments/environement.dart';

extension DevelopmentEnvironment on Environment {
  /// Product environment
  static Environment development() {
    return Environment(
        graphQLEndPoint: 'https://home.ementin.hu/api/graphql',
        restEndPoint: 'http://home.ementin.hu/api',
        googleApiKey: '',
        websocketEndpoint: 'ws://');
  }
}
