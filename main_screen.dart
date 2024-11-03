import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'book.dart';
import 'information.dart';
import 'topluluk.dart';
import 'colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<Widget> _navigationItem = [
  const Icon(Icons.info),
  const Icon(Icons.calendar_month),
  const Icon(Icons.people),
];

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    InfoScreen(),
    const book(),
    ToplulukScreen(),
  ];

  final List<Color> _backgroundColors = [
    color1,
    color2,
    color3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColors[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: _backgroundColors[_currentIndex],
        items: _navigationItem,
        index: _currentIndex,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
