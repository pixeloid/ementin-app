import 'package:eventapp/environments/environement.dart';

extension DevelopmentEnvironment on Environment {
  /// Product environment
  static Environment development() {
    return Environment(
      graphQLEndPoint: 'http://0.0.0.0:8096/api/graphql',
      restEndPoint: 'http://0.0.0.0:8096/api',
      googleApiKey: '',
      websocketEndpoint: 'http://0.0.0.0:3000/.well-known/mercure',
      isProd: false,
    );
  }
}
