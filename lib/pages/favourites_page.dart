import 'package:eventapp/features/program/application/program_provider.dart';
import 'package:eventapp/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/program/widgets/program_item.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<ProgramProvider>(context).favourites;

    return Column(
      children: [
        const WHeader(
          title: 'Kedvelt előadások',
          isShowBackButton: false,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(color: Color(0xFFFcFcFc)),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: favourites.length,
              itemBuilder: (_, i) {
                return ProgramItem(
                  presentation: favourites[i],
                  prefix: 'likes-',
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
