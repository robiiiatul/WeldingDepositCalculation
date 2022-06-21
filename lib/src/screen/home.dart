import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nov/src/screen/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Center(
        child: FlatButton(
          child: Text('Logout'),
          onPressed: () {
            auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      )
    ]));
  }
}

// class HomeScreen extends StatelessWidget {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [

//         Center(
//           child: FlatButton(
//             child: Text('Logout'),
//             onPressed: () {
//               auth.signOut();
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => LoginScreen()));
//             },
//           ),
//         )
//       ]),
//     );
//   }
// }
