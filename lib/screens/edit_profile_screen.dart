import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mad_app/components/bottom_nav_bar_other_pgs.dart';
import 'package:mad_app/components/input_widgets/text_input_field.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import '../components/botton_nav_bar_stateless.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String homeNo;
  final String street;
  final String city;
  final String country;
  final String postalCode;
  final String profilePicFilePath;
  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.homeNo,
    required this.street,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.profilePicFilePath,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _homeNoController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _postcodeController = TextEditingController();

  // final ImagePicker _picker = ImagePicker();
  bool _is_profile_pic_from_camera = false;
  File? _image;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    _homeNoController.text = widget.homeNo;
    _streetController.text = widget.street;
    _cityController.text = widget.city;
    _countryController.text = widget.country;
    _postcodeController.text = widget.postalCode;
  }

  // void loadImage() async {
  //   var _imageFromString = await widget.profilePicFilePath.isNotEmpty
  //       ? File(widget.profilePicFilePath)
  //       : null;
  //   print(
  //       'widget.profilePicFilePath: ${widget.profilePicFilePath}  image: ${_image?.path}');

  //   setState(() {
  //     _image = _imageFromString;
  //   });
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _homeNoController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _postcodeController.dispose();
    super.dispose();
  }

  Future<void> _takePhotoWithCamera() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
        return;
      }

      final imageTemporary = File(image.path);

      setState(() {
        _image = imageTemporary;
        _is_profile_pic_from_camera = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: () {
              _updateProfile(context);
            },
            icon: const Icon(FontAwesomeIcons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: Orientation.portrait ==
                            MediaQuery.of(context).orientation
                        ? 50
                        : 30,
                    backgroundImage: _is_profile_pic_from_camera
                        ? (_image != null
                            ? FileImage(File(_image!.path))
                            : null)
                        : AssetImage(widget.profilePicFilePath)
                            as ImageProvider,
                  ),
                  IconButton(
                    onPressed: _takePhotoWithCamera,
                    icon: const Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            TextInputField(label: 'Name', controller: _nameController),
            TextInputField(label: 'Email', controller: _emailController),
            TextInputField(
                label: 'Contact Number', controller: _phoneController),
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
              controller: _homeNoController,
            ),
            TextInputField(
              label: 'Street  ',
              controller: _streetController,
            ),
            TextInputField(
              label: 'City',
              controller: _cityController,
            ),
            TextInputField(
              label: 'Country',
              controller: _countryController,
            ),
            TextInputField(
              label: 'Postal Code',
              controller: _postcodeController,
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
                  _updateProfile(context);
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
                  Navigator.pop(context);
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

  void _saveAndSendDataBack(BuildContext context) {
    // check the profile pic and save it to the app directory
    String profilePicFilePath = widget.profilePicFilePath;
    if (_is_profile_pic_from_camera) {
      profilePicFilePath = _image!.path;
    }

    // send the data back to the previous screen
    final savedProfileData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'homeNo': _homeNoController.text,
      'street': _streetController.text,
      'city': _cityController.text,
      'country': _countryController.text,
      'postalCode': _postcodeController.text,
      'profilePicFilePath': profilePicFilePath,
    };
    Navigator.pop(context, savedProfileData);
  }

  void _updateProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Profile'),
          content: Text('Are you sure you want to update your profile?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _saveAndSendDataBack(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
