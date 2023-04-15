import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_app/screens/login_screen.dart';
import 'package:mad_app/screens/signup_screen.dart';

void main() => runApp(MyApp());

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
        primarySwatch: Colors.blue,
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
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
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
          // Card(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       const ListTile(
          //         leading: Icon(Icons.album, size: 45),
          //         title: Text('Sonu Nigam'),
          //         subtitle: Text('Best of Sonu Nigam Song'),
          //       ),
          //     ],
          //   ),
          // ),

          Card(
            child: SizedBox(
              height: 200,
              width: 100,
              child: Column(
                children: [
                  // Image.network('https://picsum.photos/250?image=9'),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://images.unsplash.com/photo-1572635196237-14b3f281503f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Product 1 is th best',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('5000 LKR'),
                  ),
                ],
              ),
            ),
          ),
          // Image.network('https://picsum.photos/250?image=9'),
        ],
      ),
    );
  }
}
