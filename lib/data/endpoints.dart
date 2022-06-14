import '../app_define/app_config.dart';

class EndPoints {
  static final String baseUrl = AppConfig.shared.env!.restEndPoint;
  static const String allEvents = '/events';
  static const String eventProgram = '/program';
  static const String login = '/login_check';
  static const String checkIn = '/check_in';
  static const String profile = '/users/profile';
  static const String register = '/users/register';
  static const String loginWithCode = '/check-reg-code';
  static const String presentationFavorite = '/presentation_favorites';
  static const String presentationRate = '/presentation_rates';
  static const String refreshToken = '/token/refresh';
}
