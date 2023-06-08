import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mad_app/screens/cart_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'package:mad_app/screens/home_screen.dart';
import 'package:mad_app/screens/login_screen.dart';
import 'package:mad_app/screens/orders_screen.dart';
import 'package:mad_app/screens/product_screen.dart';
import 'package:mad_app/screens/profile.dart';
import 'package:mad_app/screens/signup_screen.dart';

import 'components/drawer.dart';
import 'themes/color_schemes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(CartItemAdapter());
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
      initialRoute: '/login',
      routes: {
        '/': (context) => MyHomePage(
              initialIndex: 0, // Home page
            ),
        '/cart': (context) => MyHomePage(
              initialIndex: 1,
            ),
        '/orders': (context) => MyHomePage(
              initialIndex: 2,
            ),
        '/profile': (context) => MyHomePage(
              initialIndex: 3,
            ),
        // '/home': (context) => const HomeScreen(), // delete later

        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final initialIndex;

  const MyHomePage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final int startIndex = 0;

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
  void initState() {
    super.initState();

    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terra Cart"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      // body: _screens[_currentIndex],
      // body: ProductScreen(),

      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
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
        // onTap: _onTabTapped,
        onTap: _onTabTapped,
      ),
    );
  }
}
