import 'package:eventapp/features/user/presentation/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/users_provider.dart';

class CheckedInUsersListPage extends ConsumerWidget {
  const CheckedInUsersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkedInUsers = ref.watch(checkedInUsersProvider);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: () =>
                  ref.read(checkedInUsersProvider.notifier).getCheckedInUsers(),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: checkedInUsers.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return UserWidget(checkedInUsers[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
