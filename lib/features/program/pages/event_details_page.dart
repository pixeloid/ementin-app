import 'package:auto_route/auto_route.dart';
import 'package:eventapp/app_define/app_route.gr.dart';
import 'package:eventapp/features/event/application/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../utils/widgets/w_header.dart';
import '../domain/program_item_model.dart';

class EventDetailsPage extends ConsumerWidget with HeaderDelegate {
  const EventDetailsPage({
    Key? key,
    ProgramItemModel? selectedProgramItem,
  }) : super(key: key);

  @override
  void onBack(context) {
    AutoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentEvent = ref.watch(currentEventProvider);
    return Scaffold(
      body: Column(
        children: [
          WHeader(
            title: currentEvent!.name,
            isShowBackButton: false,
            delegate: this,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Összes esemény listja'),
              onTap: () {
                AutoRouter.of(context).replace(const EventListRoute());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
