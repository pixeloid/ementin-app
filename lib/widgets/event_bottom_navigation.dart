import 'package:flutter/material.dart';

class EventBottomNavigation extends StatefulWidget {
  const EventBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<EventBottomNavigation> createState() => _EventBottomNavigationState();
}

class _EventBottomNavigationState extends State<EventBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Az esemény',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.headphones),
          label: 'Kedvencek',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
