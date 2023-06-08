import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> _signOut() async {
  await _auth.signOut();
}

bool isUserLoggedIn() {
  return _auth.currentUser != null;
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      backgroundColor: const Color(0xFF501261),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.fromLTRB(20, 2, 2, 10),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide.none,
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'lib/images/logo-terracart.png',
                  height: 70,
                  width: 70,
                ),
                // add google font k2d

                Text(
                  'TerraCart',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.purple
                        : Colors.white,
                    fontFamily: 'K2D',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.article,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Orders',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // Navigator.popAndPushNamed(context, '/signup');
              // Then close the drawer
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Cart',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // Navigator.popAndPushNamed(context, '/signup');
              // Then close the drawer
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.person_outline_outlined,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Profile',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
            onTap: () {
              // Update the state of the app
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                          initialIndex: 2))); // Then close the drawer
              // Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.center,
            child: isUserLoggedIn() ? LogoutWidget() : LoginSignupWidget(),
          )
        ],
      ),
    );
  }
}

class LoginSignupWidget extends StatelessWidget {
  const LoginSignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Text('Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          onTap: () {
            // Update the state of the app
            Navigator.popAndPushNamed(context, '/signup');
            // Then close the drawer
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Login'),
          onTap: () {
            // Update the state of the app
            // Navigator.pushNamed(context, '/login');
            Navigator.popAndPushNamed(context, '/login');
            // Then close the drawer
            // Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Logout'),
      onTap: _signOut,
    );
  }
}
