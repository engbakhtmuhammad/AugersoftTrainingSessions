import 'package:flutter/material.dart';

import 'callsPage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      CallsPage(),
      Icon(
        Icons.camera,
        size: 150,
      ),
      Icon(
        Icons.chat,
        size: 150,
      ),
    ];

    return Scaffold(
      
      appBar: AppBar(
        title: const Text('BottomNavigationBar Demo'),
      ),
      body: Center(
    child: _pages.elementAt(_selectedIndex), //New
  ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


