import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'screens.dart'; // Import the screens.dart file that contains the UserSignInScreen, AdminSignInScreen, and DriverSignInScreen.

class DriverDetailsScreen extends StatefulWidget {
  @override
  _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _mcNumberController = TextEditingController();
  TextEditingController _dotNumberController = TextEditingController();
  TextEditingController _sascCodeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _primaryContactController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _faxController = TextEditingController();
  TextEditingController _factoringCompanyNameController = TextEditingController();

  Map<String, PlatformFile?> _files = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF231F20),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thick border on the left side
          Container(
            width: 110, // Adjust the width to control the thickness of the border
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.asset(
                            'Images/logo.png',
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Fill Up Details',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildFormTextField('Company Name', 'Enter Company Name', controller: _companyNameController),
                      _buildFormTextField('MC Number', 'Enter MC Number', controller: _mcNumberController),
                      _buildFormTextField('DOT Number', 'Enter DOT Number', controller: _dotNumberController),
                      _buildFormTextField('SASC Code', 'Enter SASC Code', controller: _sascCodeController),
                      _buildFormTextField('Address', 'Enter Address', controller: _addressController),
                      _buildFormTextField('Primary Contact', 'Enter Primary Contact', controller: _primaryContactController),
                      _buildFormTextField('Contact Number', 'Enter Contact Number', controller: _contactNumberController),
                      _buildFormTextField('Fax', 'Enter Fax', controller: _faxController),
                      _buildFormTextField('Factoring Company Name', 'Enter Factoring Company Name', controller: _factoringCompanyNameController),
                      SizedBox(height: 20),
                      _buildFileUpload('Insurance'),
                      _buildFileUpload('Certificate of Authority'),
                      _buildFileUpload('W9 Form'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _onDoneButtonPressed,
                        child: Text('Done'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFC89A4B),
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

  void _onDoneButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _showConfirmationDialog();
    }
  }

  Widget _buildFormTextField(String label, String hint, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
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

  Widget _buildFileUpload(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: double.infinity, // Make the button fill the entire width
          child: ElevatedButton(
            onPressed: () => _pickFile(label),
            child: Text('Upload $label'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFC89A4B),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
        SizedBox(height: 20),
        if (_files[label] != null)
          Text(
            'Selected File: ${_files[label]!.name}',
            style: TextStyle(color: Colors.white),
          ),
      ],
    );
  }

  Future<void> _pickFile(String field) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _files[field] = result.files.first;
      });
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation', style: TextStyle(color: Colors.white)), // Set text color to white
          content: Text(
            'Are you sure you want to submit the form?',
            style: TextStyle(color: Colors.white), // Set text color to white
          ), // Customize the content here
          actions: <Widget>[
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _showThanksDialog(); // Show the "Thanks" pop-up window
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
                primary: Color(0xFFCDA154), // Set the primary color to the gradient's third color
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Apply rounded corners to the button
              ),
            ),
          ],
          backgroundColor: Color(0xFF231F20), // Set background color of the dialog
        );
      },
    );
  }

  void _showThanksDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFC89A4B),
                    Color(0xFFF6E795),
                    Color(0xFFCDA154),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thanks!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Thanks for registering at Triumphh Logistics. We will verify your details and get back to you soon.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DriverSignInScreen())); // Navigate to the UserSignInScreen page
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF231F20), // Set background color of the button
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Apply rounded corners to the button
                    ),
                  ),
                ],
              ),
            ),
          );
         },
        );
    }
}