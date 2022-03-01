import 'package:flutter/material.dart';

class PushedScreen extends StatelessWidget {
  static const route = '/first/pushed';

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
