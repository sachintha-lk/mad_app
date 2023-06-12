import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../components/input_widgets/text_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  // final _focusEmail = FocusNode();
  // final _focusPassword = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _errorMessage = '';

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    // _focusEmail.dispose();
    // _focusPassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _focusEmail.addListener(() {
    //   setState(() {});
    // });
    // _focusPassword.addListener(() {
    //   setState(() {});
    // });

    User? user = _auth.currentUser;

    if (user != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/');
      });
    }
  }

  void _signin() async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      User? user = result.user;
      print('User: $user');

      if (user != null) {
        Navigator.popAndPushNamed(context, '/');
      }
    } on FirebaseAuthException catch (e) {
      if (mounted && e.code == 'user-not-found') {
        setState(() {
          _errorMessage = 'No user found for that email.';
        });
      } else if (mounted && e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Wrong password provided for that user.';
        });
      } else {
        if (mounted) {
          setState(() {
            _errorMessage = e.message.toString();
          });
          print('Error: $_errorMessage');
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 600,
                child: Expanded(
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    padding: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? const EdgeInsets.fromLTRB(20, 20, 20, 0)
                        : const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'lib/images/logo-terracart.png',
                              height: 70,
                              width: 70,
                            ),
                            // add google font k2d

                            // Text(
                            //   'TerraCart',
                            //   style: TextStyle(
                            //     fontSize: 30,
                            //     color:
                            //         Theme.of(context).brightness == Brightness.light
                            //             ? Theme.of(context).primaryColor
                            //             : Colors.white,
                            //     fontFamily: 'K2D',
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 20
                            : 0,
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              // color: Color.fromARGB(255, 82, 1, 126),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 20
                            : 0,
                      ),
                      if (_errorMessage.isNotEmpty)
                        Center(
                          child: Container(
                            child: Text(
                              _errorMessage,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          children: [],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextInputField(
                              label: 'Email',
                              controller: _emailTextController,
                            ),
                            TextInputField(
                              label: 'Password',
                              controller: _passwordTextController,
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      FilledButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )),
                        onPressed: _signin,
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Center(
                          child: Text(
                            "Don't have an account?",
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Color.fromARGB(255, 82, 1, 126),
                            )),
                      ),
                      // const Center(
                      //   child: Padding(
                      //     padding: EdgeInsets.fromLTRB(0, 20, 0, 8),
                      //     child: Text("Or"),
                      //   ),
                      // ),
                      // SignInButton(
                      //   Buttons.Google,
                      //   text: "Continue With Google",
                      //   padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8.0)),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
