import 'package:ementin_flutter/environments/environement.dart';

extension ProductionEnvironment on Environment {
  /// Product environment
  static Environment production() {
    return Environment(
        graphQLEndPoint: 'https://home.ementin.hu/api/graphql',
        restEndPoint: 'https://home.ementin.hu/api',
        googleApiKey: '',
        websocketEndpoint: 'https://mercure.ementin.hu/.well-known/mercure',
        isProd: true);
  }
}
