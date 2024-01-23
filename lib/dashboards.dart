import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


// AdminDashboard Screen
class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Text('Admin Dashboard Content'),
      ),
    );
  }
}

// UserDashboard Screen
class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.4219999, -122.0862462), // Example location
          zoom: 15,
        ),
      ),
    );
  }
}

// DriverDashboard Screen
class DriverDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Dashboard'),
      ),
      body: Center(
        child: Text('Driver Dashboard Content'),
      ),
    );
  }
}
