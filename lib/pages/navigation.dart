import 'package:catalogo_video/pages/login.dart';
import 'package:catalogo_video/pages/userpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../model/user.dart';
import 'catalog.dart';

class NavBar extends StatefulWidget {
  final User? user;

  NavBar({
    this.user, 
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  
  final List<Widget> _pages = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _pages.clear();
    if(widget.user != null){
      _pages.addAll([
        Catalog(),
        UserPage(user: widget.user!),
      ]);
    }else{
      _pages.addAll([
        Catalog(),
        LoginPage(),
      ]);
    }

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: 
        BottomNavigationBar(
          backgroundColor: Color(0xF2030000),
          selectedItemColor: Color(0xFFFFF400),
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
              icon: Padding(padding: EdgeInsets.only(top: 13), child: Icon(widget.user != null ? Feather.user : Feather.log_in)),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}