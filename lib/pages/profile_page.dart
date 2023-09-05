import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Center(
      child: ElevatedButton(
        child: const Text('LOGOUT'),
        onPressed: () {
          auth.logout();
        },
      ),
    );
  }
}
