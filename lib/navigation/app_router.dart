import 'package:eventapp/screens/event/main/event_listing_screen.dart';
import 'package:eventapp/screens/event/main/event_main_info_screen.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';
const String feedRoute = '/feed';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EventListingScreen.route:
        return MaterialPageRoute(builder: (_) => const EventListingScreen());
      case EventMainInfoScreen.route:
        return MaterialPageRoute(builder: (_) => const EventMainInfoScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
