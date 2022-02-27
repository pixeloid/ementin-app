// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eventapp/providers/auth.dart';
import 'package:eventapp/screens/auth_screen.dart';
import 'package:eventapp/screens/event_listing_screen.dart';
import 'package:eventapp/screens/event_screen.dart';
import 'package:eventapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  final HttpLink httpLink =
      HttpLink("https://figyek2022.ementin.hu/api/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  var app = GraphQLProvider(client: client, child: const MyApp());
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  textTheme: GoogleFonts.poppinsTextTheme(
                    Theme.of(context)
                        .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
                  ),
                ),
                home: auth.isAuth
                    ? EventListingScreen()
                    : FutureBuilder(
                        future: auth.tryAutoLogin(),
                        builder: (ctx, authResultSnapshot) =>
                            authResultSnapshot.connectionState ==
                                    ConnectionState.waiting
                                ? SplashScreen()
                                : AuthScreen(),
                      ),
                routes: {
                  '/event': (ctx) => EventScreen(),
                },
              )),
    );
  }
}
