import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/profile.dart';

class BottomNavBarOtherPgs extends StatefulWidget {
  const BottomNavBarOtherPgs({super.key});

  @override
  State<BottomNavBarOtherPgs> createState() => _BottomNavBarOtherPgsState();
}

class _BottomNavBarOtherPgsState extends State<BottomNavBarOtherPgs> {
  int _selectedIndex = -1;

  void _onTabTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });

    switch (index) {
      case 0:
        Navigator.popAndPushNamed(
          context,
          '/',
        );
        break;
      case 1:
        Navigator.popAndPushNamed(
          context,
          '/cart',
        );
        break;
      case 2:
        Navigator.popAndPushNamed(
          context,
          '/orders',
        );
        break;
      case 3:
        Navigator.popAndPushNamed(
          context,
          '/profile',
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      // selectedItemColor: Colors.white,
      onTap: _onTabTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
