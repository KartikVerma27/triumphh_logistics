import 'dart:convert';

import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:http/http.dart' as http; // Add this import

class UserSignUpScreen extends StatefulWidget {
  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 95, // Adjust the width to control the thickness of the strip
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFC89A4B),
                  Color(0xFFF6E795),
                  Color(0xFFCDA154),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFF231F20),
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          'Images/logo.png', // Replace with the actual path to your logo.png image asset
                          width: 150, // Set the desired width
                          height: 150, // Set the desired height
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildFormTextField('Name', _nameController),
                          _buildFormTextField('Email Address', _emailController, emailValidation: true),
                          _buildFormTextField('Phone Number', _phoneNumberController),
                          _buildFormTextField('Password', _passwordController, obscureText: true),
                          _buildFormTextField('Confirm Password', _confirmPasswordController, obscureText: true, confirmPassword: _passwordController.text),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _onSubmit,
                            child: Text('Submit'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFC89A4B),
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Check if passwords match
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;
      if (password != confirmPassword) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error', style: TextStyle(color: Colors.white)),
              content: Text('Passwords do not match. Please try again.', style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC89A4B), // Set the primary color to the gradient's first color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Apply rounded corners to the button
                  ),
                ),
              ],
              backgroundColor: Color(0xFF231F20), // Set background color of the dialog
            );
          },
        );
      } else {
        // Show the confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmation', style: TextStyle(color: Colors.white)),
              content: Text('Are you sure you want to submit the form?', style: TextStyle(color: Colors.white)), // Customize the content here
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Yes'),
                  onPressed: () {

                    Navigator.of(context).pop(); // Close the dialog
                    _submitUserData(); // Send user data to the server
                    _showSecondDialog(); // Show the second dialog
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC89A4B), // Set the primary color to the gradient's first color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Apply rounded corners to the button
                  ),
                ),
                ElevatedButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC89A4B), // Set the primary color to the gradient's first color (same as "Yes" button)
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Apply rounded corners to the button
                  ),
                ),
              ],
              backgroundColor: Color(0xFF231F20), // Set background color of the dialog
            );
          },
        );
      }
    }
  }

  void _showSecondDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 120), // Reduce the vertical inset to make it smaller
          backgroundColor: Color(0xFF231F20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFC89A4B),
                      Color(0xFFF6E795),
                      Color(0xFFCDA154),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  'Hi ${_nameController.text}!',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Welcome to Triumphh Logistics!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    // Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserSignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC89A4B), // Set the primary color to the gradient's first color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Apply rounded corners to the button
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Set padding for the button
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormTextField(String label, TextEditingController controller,
      {bool obscureText = false, bool emailValidation = false, String? confirmPassword}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label.';
            }
            if (emailValidation && !value.contains('@')) {
              return 'Please enter a valid email address.';
            }
            return null;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
  void _submitUserData() async {
    String aname=_nameController.text;
    print(aname);


    // Convert data to JSON format
    Map<String, dynamic> userData = {
      'Name': _nameController.text,
      'email_address': _emailController.text,
      'phone_number': _phoneNumberController.text,
      'password': _passwordController.text,
    };

    final url = Uri.parse('http://192.168.56.1:3000/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'}, // Set the request headers
      body: jsonEncode(userData), // Encode data as JSON
    );

      print(response.body);
    if (response.statusCode == 200) {

      // Show success dialog and navigate to login screen
      print('done');
      print(response.body);
    } else {
      // Show error dialog
      print('not done');
    }
  }
}
