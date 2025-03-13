import 'package:auto_route/auto_route.dart';
import 'package:ementin_flutter/pages/event/main/widgets/program_item.dart';
import 'package:ementin_flutter/providers/program_provider.dart';
import 'package:ementin_flutter/utils/widgets/w_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ementin_flutter/l10n/app_localizations.dart';

@RoutePage()
class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<ProgramProvider>(context).favourites;

    return Column(
      children: [
        WHeader(
          title: AppLocalizations.of(context)!.page_title_favourites,
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
                return ScheduleEventWidget(
                  scheduleEvent: favourites[i],
                  prefix: 'likes-',
                  showDayName: true,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
