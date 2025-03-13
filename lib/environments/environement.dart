import 'package:ementin_flutter/environments/development/development_env.dart';
import 'package:ementin_flutter/environments/production/production_env.dart';
import 'package:ementin_flutter/environments/staging/staging_env.dart';

class Environment {
  Environment({
    required this.graphQLEndPoint,
    required this.googleApiKey,
    required this.websocketEndpoint,
    required this.restEndPoint,
    required this.isProd,
  });

  /// Prod environment
  factory Environment.production() {
    return ProductionEnvironment.production();
  }

  /// Dev environment
  factory Environment.development() {
    return DevelopmentEnvironment.development();
  }

  /// Dev environment
  factory Environment.staging() {
    return StagingEnvironment.staging();
  }

  final String graphQLEndPoint;
  final String googleApiKey;
  final String websocketEndpoint;
  final String restEndPoint;
  final bool isProd;
}
