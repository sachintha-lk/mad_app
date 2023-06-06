import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_app/screens/cart_screen.dart';

import 'package:mad_app/screens/home_screen.dart';
import 'package:mad_app/screens/login_screen.dart';
import 'package:mad_app/screens/orders_screen.dart';
import 'package:mad_app/screens/profile.dart';
import 'package:mad_app/screens/signup_screen.dart';

import 'themes/color_schemes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // It is the root widget of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terra Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: GoogleFonts.publicSansTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        // textTheme: GoogleFonts.publicSansTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        // todo font

        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terra Cart"),
        centerTitle: true,
      ),
      drawer: Drawer(
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
                    'assets/images/logo-terracart.png',
                    height: 70,
                    width: 70,
                  ),
                  // add google font k2d

                  const Text(
                    'TerraCart',
                    style: TextStyle(
                        fontSize: 30, color: Colors.white, fontFamily: 'K2D'),
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
                // Navigator.popAndPushNamed(context, '/signup');
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
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
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onTabTapped,
      ),
    );
  }
}
