//import 'package:ementin_flutter/app_define/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Not logged in'),
            //   automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list_sharp),
            title: const Text('Események listája'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(AppRoute.routeEvent);
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Orders'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(OrdersScreen.routeName);
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.edit),
          //   title: Text('Manage Products'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(UserProductsScreen.routeName);
          //   },
          // ),
          const Divider(),
          auth.isAuth
              ? ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/');

                    // Navigator.of(context)
                    //     .pushReplacementNamed(UserProductsScreen.routeName);
                    auth.logout();
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.login_outlined),
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/auth');
                  },
                ),
        ],
      ),
    );
  }
}
