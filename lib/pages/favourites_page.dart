import 'package:eventapp/pages/event/main/event_program_page.dart';
import 'package:eventapp/providers/program_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<ProgramProvider>(context).favourites;

    return Center(
        child: Column(
      children: [
        ListView.builder(
          itemCount: favourites.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, i) {
            return SizedBox(
              width: 300,
              child: ProgramItem(presentation: favourites[i]),
            );
          },
        )
      ],
    ));
  }
}
