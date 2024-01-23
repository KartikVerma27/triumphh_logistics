import 'package:flutter/material.dart';
import 'main.dart';
import 'signup_screen.dart';
import 'user_sign_up_screen.dart'; // Import the UserSignUpScreen file
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dashboards.dart'; // Ensure this file exists with appropriate dashboard widgets

// Screen 1: UserSignInScreen
class UserSignInScreen extends StatefulWidget {
  @override
  _UserSignInScreenState createState() => _UserSignInScreenState();
}
class _UserSignInScreenState extends State<UserSignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'Images/logo.png', // Your image asset for the logo
              width: 200, height: 200, fit: BoxFit.contain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(text: 'User Sign In', isGradient: true),
                SizedBox(width: 10),
                RoundedButton(text: 'Admin Sign In', isGradient: false),
                SizedBox(width: 10),
                RoundedButton(text: 'Driver Sign In', isGradient: false),
              ],
            ),
            SizedBox(height: 40),
            CombinedGradientBox(onUsernameChanged: (value) {
              setState(() {
                _usernameController.text = value;
              });
            },
              onPasswordChanged: (value) {
                setState(() {
                  _passwordController.text = value;
                });
              },
            ),
            SizedBox(height: 10),
            TransparentButton(
                text: 'Forgot Password?',
                onPressed: () {
                  // Logic for "Forgot Password?" button
                }
            ),
            TransparentButton(
                text: 'Sign-up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserSignUpScreen()),
                  );
                }
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF231F20),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _authenticateUser(context),
        child: Icon(Icons.lock_open),
        backgroundColor: Color(0xFFC89A4B), // Adjust color as needed
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }



  Future<void> _authenticateUser(BuildContext context) async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Username or password cannot be empty.');
      return;
    }

    try {
      Map<String, dynamic> authData = {
        'userType': 'user',
        'email_address': username,
        'password': password,
      };

      final url = Uri.parse('http://192.168.56.1:3000/signin');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(authData),
      );

      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => UserDashboard()),
        );// Your existing success logic
      } else {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        _showErrorDialog(context, 'Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error occurred: $error');
      _showErrorDialog(context, 'An error occurred: $error');
    }
  }


  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign In Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Screen 2: AdminSignInScreen
class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'Images/logo.png', // Replace with the actual path to your image asset
              width: 200, // Set the desired width
              height: 200, // Set the desired height
              fit: BoxFit.contain, // Adjust how the image fits the available space
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(text: 'User Sign In', isGradient: false),
                SizedBox(width: 10),
                RoundedButton(text: 'Admin Sign In', isGradient: true),
                SizedBox(width: 10),
                RoundedButton(text: 'Driver Sign In', isGradient: false),
              ],
            ),
            SizedBox(height: 40),
            CombinedGradientBox(onUsernameChanged: (value) {
              setState(() {
                _usernameController.text = value;
              });
            },
              onPasswordChanged: (value) {
                setState(() {
                  _passwordController.text = value;
                });
              },
            ),
            SizedBox(height: 10),
            TransparentButton(text: 'Forgot Password?', onPressed: () {
              // Add your logic for "Forgot Password?" button here
            }),
          ],
        ),
      ),
      backgroundColor: Color(0xFF231F20),
    );
  }
}

// Screen 3: DriverSignInScreen
class DriverSignInScreen extends StatefulWidget {
  @override
  _DriverSignInScreenState createState() => _DriverSignInScreenState();
}

class _DriverSignInScreenState extends State<AdminSignInScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Images/logo.png', // Replace with the actual path to your image asset
                width: 200, // Set the desired width
                height: 200, // Set the desired height
                fit: BoxFit.contain, // Adjust how the image fits the available space
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(text: 'User Sign In', isGradient: false),
                  SizedBox(width: 10),
                  RoundedButton(text: 'Admin Sign In', isGradient: false),
                  SizedBox(width: 10),
                  RoundedButton(text: 'Driver Sign In', isGradient: true),
                ],
              ),
              SizedBox(height: 40),
              CombinedGradientBox(onUsernameChanged: (value) {
                setState(() {
                  _usernameController.text = value;
                });
              },
                onPasswordChanged: (value) {
                  setState(() {
                    _passwordController.text = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TransparentButton(text: 'Forgot Password?', onPressed: () {
                // Add your logic for "Forgot Password?" button here
              }),
              TransparentButton(text: 'Sign-up', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              }),
            ],
          ),
        ),
        backgroundColor: Color(0xFF231F20),
       );
   }

}
class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  TransparentButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, // The action to perform when the button is pressed
      child: Text(
        text,
        style: TextStyle(color: Colors.white), // Text color is set to white
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent, // Background color is set to transparent
        padding: EdgeInsets.zero, // No padding to the button
      ),
    );
  }
}