import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String id;

  final String name;

  const EventCard({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  void selectEvent(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/event', arguments: {'id': id, 'name': name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectEvent(context),
      splashColor: Theme.of(context).primaryColor,
      child: GridTile(
        child: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
