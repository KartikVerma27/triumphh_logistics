import 'package:flutter/material.dart';
import 'driver_details.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF231F20), // Set the background color
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100, // Decrease the width of the strip
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
            child: Center(
              child: Image.asset(
                'Images/whitetruck.jpg',
                width: 140, // Set the desired width of the image
                height: 140, // Set the desired height of the image
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 60), // Increase the gap between logo and heading
                      Center(
                        child: Text(
                          'Create New Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Increase the gap between heading and form fields
                      _buildFormTextField('Email Address', 'Email Address', controller: _emailController, validator: _validateEmail),
                      SizedBox(height: 20),
                      _buildFormTextField('Set Your Username', 'Set Your Username', controller: _usernameController, validator: _validateRequired),
                      SizedBox(height: 20),
                      _buildFormTextField('Set Your Password', 'Set Your Password', controller: _passwordController, isObscure: true, validator: _validateRequired),
                      SizedBox(height: 20),
                      _buildFormTextField('Confirm Password', 'Confirm Password', controller: _confirmPasswordController, isObscure: true, validator: _validatePasswordMatch),
                      SizedBox(height: 40), // Increase the gap between form fields and the "Next" button
                      ElevatedButton(
                        onPressed: _onNextButtonPressed,
                        child: Text('Next'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFC89A4B), // Set the button color to match the gradients used in driver sign-in or user sign-in buttons
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Rest of the code...
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Invalid email address.';
    }
    return null;
  }

  String? _validatePasswordMatch(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  void _onNextButtonPressed() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DriverDetailsScreen()),
      );
    }
  }

  Widget _buildFormTextField(String label, String hint, {TextEditingController? controller, bool isObscure = false, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    TextFormField(
    controller: controller,
    obscureText: isObscure,
    validator: validator,
    decoration: InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.grey[300],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    ),
    SizedBox(height: 20),
    ],
    );


    }
}