
import 'package:catalogo_video/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'catalog.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Catalog(),
    User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: 
        BottomNavigationBar(
          backgroundColor: Color(0xF2030000),
          selectedItemColor: Color(0xFFFFF400), // Cor do item selecionado
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(top: 13), child: Icon(Feather.home)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(top: 13), child: Icon(Feather.user)),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
