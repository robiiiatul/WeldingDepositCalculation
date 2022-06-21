import 'dart:math';

import 'package:nov/src/math/data.dart';
import 'package:nov/src/math/data2.dart';
import 'package:nov/src/math/double_bevel.dart';
import 'package:flutter/material.dart';
import 'package:nov/src/screen/welding4.dart';
import 'package:nov/themes.dart';
import 'package:vector_math/vector_math.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class WeldingPage3 extends StatefulWidget {
  final DataObj data;
  final BevelType data2;
  const WeldingPage3({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  State<WeldingPage3> createState() => _WeldingPage3State();
}

class _WeldingPage3State extends State<WeldingPage3> {
  final auth = FirebaseAuth.instance;

  var y1Controller = TextEditingController();
  var x1Controller = TextEditingController();
  var y2Controller = TextEditingController();
  var x2Controller = TextEditingController();
  var a1Controller = TextEditingController();
  var a2Controller = TextEditingController();
  var a3Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.data.toJson().toString());
    print(widget.data2.toJson().toString());
    a2Controller.value = TextEditingValue(text: widget.data2.a2.toString());
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
                  controller: y1Controller,
                  onChanged: (value) {
                    _x1_a3();
                    _a1();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'y1',
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
                  controller: x1Controller,
                  onChanged: (value) {
                    _x1_a3();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'x1',
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
                  controller: y2Controller,
                  onChanged: (value) {
                    _x2();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'y2',
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
                  controller: x2Controller,
                  onChanged: (value) {
                    _x2();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'x2',
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
                  controller: a1Controller,
                  onChanged: (value) {
                    _a1();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'A1-T1',
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
                  controller: a2Controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'A2-T1',
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
                  controller: a3Controller,
                  onChanged: (value) {
                    _x1_a3();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'A3-T1',
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
                        widget.data2.x1 =
                            num.parse(x1Controller.text.toString());
                        widget.data2.y1 =
                            num.parse(y1Controller.text.toString());
                        widget.data2.x2 =
                            num.parse(x2Controller.text.toString());
                        widget.data2.y2 =
                            num.parse(y2Controller.text.toString());
                        widget.data2.a1 =
                            num.parse(a1Controller.text.toString());
                        widget.data2.a2 =
                            num.parse(a2Controller.text.toString());
                        widget.data2.a3 =
                            num.parse(a3Controller.text.toString());
                        if (widget.data.bevelType == "SV" ||
                            widget.data.bevelType == "DV") {
                          widget.data2.a1t2 =
                              num.parse(y2Controller.text.toString()) *
                                  num.parse(widget.data2.t2.toString());
                        } else {
                          widget.data2.a1t2 =
                              num.parse(y2Controller.text.toString()) *
                                  num.parse(widget.data2.t2.toString()) /
                                  2;
                        }
                        widget.data2.a2t2 =
                            4 * num.parse(widget.data2.t2.toString());
                        widget.data2.a3t2 =
                            3 * num.parse(x2Controller.text.toString());

                        widget.data2.area =
                            num.parse(widget.data2.a1.toString()) +
                                num.parse(widget.data2.a2.toString()) +
                                num.parse(widget.data2.a3.toString()) +
                                num.parse(widget.data2.a1t2.toString()) +
                                num.parse(widget.data2.a2t2.toString()) +
                                num.parse(widget.data2.a3t2.toString());
                        widget.data2
                            .weight = (num.parse(widget.data2.area.toString()) *
                                num.parse(widget.data.weldLength.toString())) /
                            1000000000 *
                            num.parse(widget.data.steelDensity.toString());

                        // objDataKalkulasi.t = num.parse(number1Controller.text);
                        // objDataKalkulasi.t2 = num.parse(number2Controller.text);
                        // objDataKalkulasi.radians = num.parse(number4Controller.text);
                        // objDataKalkulasi.y1 = tan(objDataKalkulasi.radians) * objDataKalkulasi.t;
                        // objDataKalkulasi.x1 = objDataKalkulasi.y1 + 4;
                        // objDataKalkulasi.y2 = tan(objDataKalkulasi.radians) * objDataKalkulasi.t2;
                        // objDataKalkulasi.x2 = objDataKalkulasi.y2 + 4;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeldingPage4(
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

  void _x2() {
    if (y2Controller.text.trim().isNotEmpty) {
      if (widget.data.bevelType == "FW") {
        x2Controller.text = "0";
      } else if (widget.data.bevelType == "SV" ||
          widget.data.bevelType == "SB") {
        x2Controller.text = "0";
      } else if (widget.data.bevelType == "DV") {
        //y2*2+4
        final firstValue = double.parse(y2Controller.text);

        x2Controller.text = (firstValue * 2 + 4).toString();
      } else {
        //y2+4
        final firstValue = double.parse(y2Controller.text);

        x2Controller.text = (firstValue + 4).toString();
      }
    }
  }

  void _x1_a3() {
    if (y1Controller.text.trim().isNotEmpty) {
      if (widget.data.bevelType == "FW") {
        x1Controller.text = "0";
        final x1 = double.parse(x1Controller.text);
        a3Controller.text = (3 * x1).toString();
      } else if (widget.data.bevelType == "DB" ||
          widget.data.bevelType == "SB") {
        //y1+4
        final firstValue = double.parse(y1Controller.text);

        x1Controller.text = (firstValue + 4).toString();
        final x1 = double.parse(x1Controller.text);
        a3Controller.text = (3 * x1).toString();
      } else {
        //y1*2+4
        final firstValue = double.parse(y1Controller.text);

        x1Controller.text = (firstValue * 2 + 4).toString();

        final x1 = double.parse(x1Controller.text);
        a3Controller.text = (3 * x1).toString();
      }
    }
  }

  void _a1() {
    if (y1Controller.text.trim().isNotEmpty) {
      if (widget.data.bevelType == "SV" || widget.data.bevelType == "DV") {
        //y1*t1
        final firstValue = double.parse(y1Controller.text);

        a1Controller.text = (firstValue * widget.data2.t1).toString();
      } else {
        //y1*t1/2
        final firstValue = double.parse(y1Controller.text);

        a1Controller.text = (firstValue * widget.data2.t1 / 2).toString();
      }
    }
  }

  void _a2() {
    a2Controller.value = TextEditingValue(text: widget.data2.a2.toString());
  }
}
