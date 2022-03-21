// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eventapp/navigation/app_router.dart';
import 'package:eventapp/providers/auth.dart';
import 'package:eventapp/providers/navigation/bottom_navigation.dart';
import 'package:eventapp/screens/event/main/event_listing_screen.dart';
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
        ),
        ChangeNotifierProvider.value(
          value: BottomNavigationProvider(),
        ),
      ],
      child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  textTheme: GoogleFonts.poppinsTextTheme(
                    Theme.of(ctx)
                        .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
                  ),
                ),
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: EventListingScreen.route,
              )),
    );
  }
}
