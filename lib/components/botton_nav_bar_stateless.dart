import 'package:flutter/material.dart';
import 'package:mad_app/main.dart';
import 'package:mad_app/screens/home_screen.dart';

class BottomNavBarStateless extends StatefulWidget {
  const BottomNavBarStateless({
    super.key,
  });

  @override
  State<BottomNavBarStateless> createState() => _BottomNavBarStatelessState();
}

class _BottomNavBarStatelessState extends State<BottomNavBarStateless> {
  @override
  Widget build(BuildContext context) {
    var _currentIndex = 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
      currentIndex: _currentIndex,
      // selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: _onTabTapped,
    );
  }

  void _onTabTapped(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
        // settings: const RouteSettings(
        //     arguments: 0), // Set the initial index to 1 (page 2)
      ),
    );
  }
}
