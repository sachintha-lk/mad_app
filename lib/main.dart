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
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Login")),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("Sign Up")),
        ],
      )),
    );
  }
}
