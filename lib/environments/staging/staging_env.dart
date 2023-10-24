import 'package:eventapp/environments/environement.dart';

extension StagingEnvironment on Environment {
  /// Product environment
  static Environment staging() {
    return Environment(
      graphQLEndPoint: 'https://home.ementin.hu/api/graphql',
      restEndPoint: 'https://home.ementin.hu/api',
      googleApiKey: '',
      websocketEndpoint: 'https://mercure.ementin.hu/.well-known/mercure',
      isProd: false,
    );
  }
}
