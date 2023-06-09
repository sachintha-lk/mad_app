import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../components/input_widgets/text_input_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  final _confirmPasswordTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _errorMessage = '';

  // if user is signed in Already, go to home screen
  @override
  void initState() {
    super.initState();
    User? user = _auth.currentUser;

    if (user != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/');
      });
    }
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    print("Sign up");
    try {
      if (_passwordTextController.text != _confirmPasswordTextController.text) {
        throw Exception("Passwords do not match");
      }

      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      User? user = result.user;
      print('Registered user: ${user?.email}');

      // Success - go to home screen
      if (user != null) {
        Navigator.popAndPushNamed(context, '/');
      }
    } catch (e) {
      // Registration failed, handle the error
      setState(() {
        _errorMessage = e.toString();
      });
      print('Error: $_errorMessage');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 600,
          width: 350,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Column(
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
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.purple
                                    : Colors.white,
                            fontFamily: 'K2D',
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Color.fromARGB(255, 82, 1, 126),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: TextInputField(
                          label: 'Email',
                          controller: _emailTextController,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: TextInputField(
                          label: 'Password',
                          controller: _passwordTextController,
                          obscureText: true,
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: TextInputField(
                          label: 'Confirm Password',
                          controller: _confirmPasswordTextController,
                          obscureText: true,
                        )),
                    FilledButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      )),
                      onPressed: _signUp,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        child: const Text(
                          "Already have an account?",
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
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
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
            ],
          ),
        ),
      ),
    );
  }
}
