import 'package:flutter/material.dart';

class PushedScreen extends StatelessWidget {
  static const route = '/first/pushed';

  const PushedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pushed screen')),
      body: const Center(
        child: Text('Hello world!'),
      ),
    );
  }
}
