import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../components/input_widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
               
                Center(
                  child: Container(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 1, 126),
                      ),
                    ),
                  ),
                ),
                const TextInputField(label: 'Email'),
                const TextInputField(label: 'Password'),
                
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
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: const Center(
                    child:  Text(
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
