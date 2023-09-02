import 'package:flutter/material.dart';
import 'screens.dart';
import 'signup_screen.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    // appBar: AppBar(
    //   title: Image.asset('Images/logo.png',
    //   width: 105,
    //   height: 80,),
    //   // Text('Triumphh'),
    //
    //   centerTitle: true,
    //   backgroundColor: Colors.blueGrey[900],
    // ),
    body:  Center(
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
          SizedBox(height: 10,),
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
          }),// Add more widgets or content below the image as needed
        ],
      ),
    ),
    backgroundColor: Color(0xFF231F20),
    floatingActionButton: FloatingActionButton(
      onPressed: () {  },
      child: Text('next'),
    ),
  )
));



class RoundedButton extends StatelessWidget {
  final String text;
  final bool isGradient;

  RoundedButton({required this.text, required this.isGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(53),
        color: isGradient
            ? null
            : Colors.grey[300], // Use gradient background for center button, otherwise use light grey
        gradient: isGradient
            ? LinearGradient(
          colors: [
            Color(0xFFC89A4B), // Golden color
            Color(0xFFF6E795), // Light golden color
            Color(0xFFCDA154), // Dark golden color
          ], // Customize the gradient colors here
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
            : null,
      ),
      child: TextButton(
        onPressed: () {
          // Add navigation logic here for each button
          if (text == 'User Sign In') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserSignInScreen()),
            );
          } else if (text == 'Admin Sign In') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminSignInScreen()),
            );
          } else if (text == 'Driver Sign In') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DriverSignInScreen()),
            );
          }
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}


class CombinedGradientBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xFFC89A4B),
            Color(0xFFF6E795),
            Color(0xFFCDA154),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}


class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Add the onPressed parameter here

  TransparentButton({required this.text, required this.onPressed}); // Add onPressed to the constructor

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, // Use the provided onPressed callback
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
// {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
