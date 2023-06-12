import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String name;
  late String email;
  late String phone;
  late String homeNo;
  late String street;
  late String city;
  late String country;
  late String postalCode;

  late String profilePicFilePath;

  @override
  void initState() {
    super.initState();
    name = 'John Doe';
    email = 'johndoe@gmail.com';
    phone = '1234567890';
    homeNo = '123';
    street = 'Main Street';
    city = 'Colombo';
    country = 'Sri Lanka';
    postalCode = '12345';
    profilePicFilePath = 'lib/images/product_imgs/nike.png';
  }

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
            Container(
              child: CircleAvatar(
                radius:
                    Orientation.portrait == MediaQuery.of(context).orientation
                        ? 50
                        : 35,
                backgroundImage: profilePicFilePath.isNotEmpty
                    ? AssetImage(profilePicFilePath)
                    : AssetImage('lib/images/profile_pic_placeholder.png'),
              ),
            ),

            SizedBox(
              height: Orientation.portrait == MediaQuery.of(context).orientation
                  ? 20
                  : 5,
            ),
            Text(
              name,
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
                child: Padding(
                  padding: MediaQuery.of(context).size.width > 600
                      ? const EdgeInsets.fromLTRB(40, 20, 30, 40)
                      : const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        direction: MediaQuery.of(context).size.width > 600
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: [
                          Column(
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
                                email,
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
                                phone,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                ' $homeNo,\n $street,\n $city,\n $country - $postalCode',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
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
                  _showEditProfileScreen(context);
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

  void _showEditProfileScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          name: name,
          email: email,
          phone: phone,
          homeNo: homeNo,
          street: street,
          city: city,
          country: country,
          postalCode: postalCode,
          profilePicFilePath: profilePicFilePath,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        name = result['name'];
        email = result['email'];
        phone = result['phone'];
        homeNo = result['homeNo'];
        street = result['street'];
        city = result['city'];
        country = result['country'];
        postalCode = result['postalCode'];
        profilePicFilePath = result['profilePicFilePath'];
      });
    }
  }
}
