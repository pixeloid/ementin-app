import 'package:eventapp/environments/environement.dart';

extension DevelopmentEnvironment on Environment {
  /// Product environment
  static Environment development() {
    return Environment(
        graphQLEndPoint: 'http://192.168.0.59:8095/api/graphql',
        restEndPoint: 'http://192.168.0.59:8095/api',
        googleApiKey: '',
        websocketEndpoint: 'http://192.168.0.59:3000/.well-known/mercure');
  }
}
