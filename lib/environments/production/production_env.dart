import 'package:eventapp/environments/environement.dart';

extension ProductionEnvironment on Environment {
  /// Product environment
  static Environment production() {
    return Environment(
        graphQLEndPoint: 'https://home.ementin.hu/api/graphql',
        restEndPoint: 'https://home.ementin.hu/api',
        googleApiKey: '',
        websocketEndpoint: 'http://192.168.0.59:3000/.well-known/mercure');
  }
}
