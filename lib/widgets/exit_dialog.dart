import 'package:flutter/material.dart';

class ExitAlertDialog extends StatelessWidget {
  const ExitAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.button!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Exit'),
        ),
      ],
    );
  }
}
