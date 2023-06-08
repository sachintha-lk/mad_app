import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../components/input_widgets/text_input_field.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color.fromARGB(255, 82, 1, 126),
                        // color: Color.fromARGB(255, 82, 1, 126),
                      ),
                    ),
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
                  onPressed: () {
                    // alert box hello world
                  },
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
                  child: const Text('Sign Up'),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 8),
                    child: Text("Or"),
                  ),
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Continue With Google",
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
