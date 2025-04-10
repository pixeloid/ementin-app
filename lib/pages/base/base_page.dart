import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () {
          _dismiss(unfocus: context);
        },
        child: child,
      ),
    );
  }

  void _dismiss({BuildContext? unfocus}) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (unfocus != null) {
      FocusScope.of(unfocus).unfocus();
    }
  }
}
