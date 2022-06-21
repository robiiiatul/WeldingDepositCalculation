import 'dart:math';

import 'package:nov/src/math/double_bevel.dart';
import 'package:flutter/material.dart';
import 'package:nov/src/screen/welding3.dart';
import 'package:nov/src/screen/welding1.dart';
import 'package:nov/themes.dart';
import 'package:vector_math/vector_math.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../math/data.dart';
import '../math/data2.dart';
import 'login.dart';

class WeldingPage2 extends StatefulWidget {
  final DataObj data;
  final BevelType data2;
  const WeldingPage2({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  State<WeldingPage2> createState() => _WeldingPage2State();
}

class _WeldingPage2State extends State<WeldingPage2> {
  final auth = FirebaseAuth.instance;

  var thicknessController = TextEditingController();
  var t1Controller = TextEditingController();
  var t2Controller = TextEditingController();
  var bevelAngleController = TextEditingController();
  var radiansController = TextEditingController();
  var x1Controller = TextEditingController();
  var y1Controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.data.toJson().toString());
    print(widget.data2.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Text(""),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Logout'),
                onPressed: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              )
            ],
          ),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: thicknessController,
                  onChanged: (value) {
                    _t2();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Thickness Material',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: thicknessController,
                  onChanged: (value) {
                    _t2();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'T1',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: t2Controller,
                  onChanged: (value) {
                    _t2();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'T2',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: bevelAngleController,
                  onChanged: (value) {
                    _radians();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Bevel Angle',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: radiansController,
                  onChanged: (value) {
                    _radians();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Radians',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back")),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        widget.data2.thickness =
                            num.parse(thicknessController.text.toString());
                        widget.data2.t1 =
                            num.parse(thicknessController.text.toString());
                        widget.data2.t2 =
                            num.parse(t2Controller.text.toString());
                        widget.data2.bevelAngle =
                            num.parse(bevelAngleController.text.toString());
                        widget.data2.rad =
                            num.parse(radiansController.text.toString());
                        widget.data2.a2 =
                            num.parse(thicknessController.text.toString()) * 4;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeldingPage3(
                                      data: widget.data,
                                      data2: widget.data2,
                                    )));
                      },
                      child: Text("Next")),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }

  void _t2() {
    if (thicknessController.text.trim().isNotEmpty) {
      final firstValue = double.parse(thicknessController.text);

      t2Controller.text = (firstValue - firstValue).toString();
    }
  }

  void _radians() {
    if (bevelAngleController.text.trim().isNotEmpty) {
      if (widget.data.bevelType == "DB" || widget.data.bevelType == "SB") {
        final firstValue = double.parse(bevelAngleController.text);

        radiansController.text = (radians(firstValue)).toStringAsFixed(2);
      } else {
        final firstValue = double.parse(bevelAngleController.text);

        radiansController.text = (radians(firstValue) / 2).toStringAsFixed(2);
      }
    }
  }
}
