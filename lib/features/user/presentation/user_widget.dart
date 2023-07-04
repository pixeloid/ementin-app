import 'package:eventapp/features/user/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app_define/app_theme.dart';

class UserWidget extends ConsumerWidget {
  final UserModel user;
  const UserWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: ref.watch(themeProvider).accentTxt,
        border: Border.all(
          color: ref.watch(themeProvider).greyWeaker,
          width: 1,
        ),
      ),
      child: Text(user.username),
    );
  }
}
