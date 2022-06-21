import 'package:flutter/material.dart';
import 'package:nov/src/screen/coba.dart';
import 'package:nov/src/screen/kalkulator.dart';

import 'package:nov/src/screen/login.dart';
import 'package:nov/src/screen/register.dart';
import 'package:nov/src/screen/welding0.dart';
import 'package:nov/src/screen/welding1.dart';
import 'package:nov/src/screen/coba.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(accentColor: Colors.white, primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
