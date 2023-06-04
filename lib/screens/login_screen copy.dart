import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name TDB"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
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
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        )),
                    // create an input text field with a height

                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: -5),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        )),
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
                    Center(
                      child: Container(
                        child: const Text(
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
        ),
      ),
    );
  }
}
