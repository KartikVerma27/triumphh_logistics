import 'package:flutter/material.dart';
import 'main.dart';
import 'signup_screen.dart';
import 'user_sign_up_screen.dart'; // Import the new UserSignUpScreen file

// Screen 1: UserSignInScreen
class UserSignInScreen extends StatelessWidget {
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
                RoundedButton(text: 'User Sign In', isGradient: true),
                SizedBox(width: 10),
                RoundedButton(text: 'Admin Sign In', isGradient: false),
                SizedBox(width: 10),
                RoundedButton(text: 'Driver Sign In', isGradient: false),
              ],
            ),
            SizedBox(height: 40),
            CombinedGradientBox(),
            SizedBox(height: 10),
            TransparentButton(text: 'Forgot Password?', onPressed: () {
              // Add your logic for "Forgot Password?" button here
            }),
            TransparentButton(text: 'Sign-up', onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSignUpScreen()), // Navigate to UserSignUpScreen
              );
            }),
          ],
        ),
      ),
      backgroundColor: Color(0xFF231F20),
    );
  }
}

// Screen 2: AdminSignInScreen
class AdminSignInScreen extends StatelessWidget {
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
            CombinedGradientBox(),
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

class DriverSignInScreen extends StatelessWidget {
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
              CombinedGradientBox(),
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