import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mad_app/screens/login_screen.dart';
import 'package:mad_app/screens/signup_screen.dart';
import 'themes/color_schemes.dart';
import 'components/cards/product_item_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // It is the root widget of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketPlace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Public Sans',
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Public Sans',
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarketPlace"),
        centerTitle: true,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        backgroundColor: Color(0xFF501261),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('TerraCart'),
            ),
            ListTile(
              title: const Text('Sign Up'),
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 2, 0, 10),
            child: const Text(
              'Featured Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: GridView.count(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: const Card(
                    child: ListTile(
                      title: Text("Test"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ProductItemCard(
            productName: "This is product",
            productPrice: 2134,
            productRating: 3.4,
          ),
          ProductItemCard(
            productName:
                "This is product This is product This is product This is product This is product This is product ",
            productPrice: 2134,
            productRating: 3.4,
          ),
          const SizedBox(
            child: const CircularProgressIndicator(),
          ),

          // grid with colored boxes
          // Expanded(
          //   child: OrientationBuilder(builder: (context, orientaion) {
          //     return GridView.count(
          //       crossAxisCount: orientaion == Orientation.portrait ? 2 : 3,
          //       scrollDirection: Axis.vertical,
          //       children: [
          //         Container(
          //           height: 200,
          //           width: 100,
          //           color: Colors.red,
          //           child: Text("1"),
          //         ),
          //         Container(
          //           height: 200,
          //           width: 100,
          //           color: Colors.blue,
          //           child: Text("2"),
          //         ),
          //         Container(
          //           height: 200,
          //           width: 100,
          //           color: Colors.green,
          //           child: Text("3"),
          //         ),
          //         Container(
          //           height: 200,
          //           width: 100,
          //           color: Colors.yellow,
          //           child: Text("4"),
          //         ),
          //         Container(
          //           height: 200,
          //           width: 100,
          //           color: Colors.orange,
          //           child: Text("5"),
          //         ),
          //         Container(
          //           height: 200,
          //           width: 100,
          //           color: Colors.pink,
          //           child: Text("6"),
          //         ),
          //       ],
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
}
