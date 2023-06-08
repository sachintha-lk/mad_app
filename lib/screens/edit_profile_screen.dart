import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mad_app/components/bottom_nav_bar_other_pgs.dart';
import 'package:mad_app/components/input_widgets/text_input_field.dart';

import '../components/botton_nav_bar_stateless.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: Orientation.portrait == MediaQuery.of(context).orientation
                  ? 20
                  : 0,
            ),
            Center(
              child: CircleAvatar(
                radius:
                    Orientation.portrait == MediaQuery.of(context).orientation
                        ? 50
                        : 25,
                // backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextInputField(
                label: 'Name',
                controller: TextEditingController(text: 'John Doe')),
            TextInputField(
                label: 'Email',
                controller: TextEditingController(text: 'jane@example.com')),
            TextInputField(
                label: 'Contact Number',
                controller: TextEditingController(text: '544544464')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Address',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            TextInputField(
              label: 'House No',
              controller: TextEditingController(),
            ),
            TextInputField(
              label: 'Street  ',
              controller: TextEditingController(),
            ),
            TextInputField(
              label: 'City',
              controller: TextEditingController(),
            ),
            TextInputField(
              label: 'Country',
              controller: TextEditingController(),
            ),
            TextInputField(
              label: 'Postal Code',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Payment Methods',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Add a card',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextInputField(
              label: 'Card Number',
              controller: TextEditingController(),
            ),
            TextInputField(
              label: 'Card Holder Name',
              controller: TextEditingController(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextInputField(
                    label: 'Expiry Date',
                    controller: TextEditingController(),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextInputField(
                    label: 'CVV',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
              ),
              child: Text(
                'Add Card',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
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
                  // alert box hello world
                },
                child: const Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )),
                onPressed: () {
                  // alert box hello world
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black87
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarOtherPgs(),
    );
  }
}
