import 'package:china_garden/favourites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'login.dart';
import 'notification.dart';
import 'phone_call.dart';
import 'profile.dart';
import 'homepage.dart';

class NaviBottom extends StatefulWidget {
  @override
  _NaviBottomState createState() => _NaviBottomState();
}

class _NaviBottomState extends State<NaviBottom> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Favourite(),
    Notification_Page(),
    Profile_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFF4500),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.favorite), label: 'favourites'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
      ),
    );
  }
}