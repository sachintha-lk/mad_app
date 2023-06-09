import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   child: const Text(
            //     'Profile',
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: Orientation.portrait == MediaQuery.of(context).orientation
                  ? 20
                  : 0,
            ),
            CircleAvatar(
              radius: Orientation.portrait == MediaQuery.of(context).orientation
                  ? 50
                  : 25,
              // backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              // decoration: BoxDecoration(
              //   border:
              //       Border.all(color: const Color.fromARGB(255, 131, 131, 131)),
              //   color: Theme.of(context).cardTheme.color,
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'janedoe@example.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Contact Number',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '+91 9876543210',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        ' 99,\n Example Street,\n Colombo,\n Sri Lanka - 0001',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Payment Methods',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      // visa logo font awesome
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ccVisa,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '**** **** **** 1234',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ccMastercard,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '**** **** **** 1234',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FilledButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
