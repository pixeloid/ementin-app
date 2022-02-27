// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
          title: const Text('Title'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category_outlined),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.abc_sharp),
                text: 'ABC',
              )
            ],
          ),
        )));
  }
}
