import 'package:flutter/cupertino.dart';

class Event with ChangeNotifier {
  final String id;
  final String name;

  Event(this.id, this.name);
}
