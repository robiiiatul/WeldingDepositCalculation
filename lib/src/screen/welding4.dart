import 'dart:math';

import 'package:nov/src/math/data.dart';
import 'package:nov/src/math/data2.dart';

import 'package:flutter/material.dart';
import 'package:nov/src/screen/welding5.dart';
import 'package:nov/themes.dart';
import 'package:vector_math/vector_math.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class WeldingPage4 extends StatefulWidget {
  final DataObj data;
  final BevelType data2;
  const WeldingPage4({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  State<WeldingPage4> createState() => _WeldingPage4State();
}

class _WeldingPage4State extends State<WeldingPage4> {
  final auth = FirebaseAuth.instance;

  var a1t2Controller = TextEditingController();
  var a2t2Controller = TextEditingController();
  var a3t2Controller = TextEditingController();
  var areaController = TextEditingController();
  var weightController = TextEditingController();
  var unitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.data.toJson().toString());
    print(widget.data2.toJson().toString());
    a1t2Controller.value = TextEditingValue(text: widget.data2.a1t2.toString());
    a2t2Controller.value = TextEditingValue(text: widget.data2.a2t2.toString());
    a3t2Controller.value = TextEditingValue(text: widget.data2.a3t2.toString());
    areaController.value = TextEditingValue(text: widget.data2.area.toString());
    weightController.value =
        TextEditingValue(text: widget.data2.weight.toString());
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
                  controller: a1t2Controller,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'A1-T2',
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
                  controller: a2t2Controller,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'A2-T2',
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
                  controller: a3t2Controller,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'A3-T2',
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
                  controller: areaController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Area',
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
                  controller: weightController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Weight',
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
                  controller: unitController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Unit',
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
                        widget.data2.a1t2 =
                            num.parse(a1t2Controller.text.toString());
                        widget.data2.a2t2 =
                            num.parse(a2t2Controller.text.toString());
                        widget.data2.a3t2 =
                            num.parse(a3t2Controller.text.toString());
                        widget.data2.area =
                            num.parse(areaController.text.toString());
                        widget.data2.weight =
                            num.parse(weightController.text.toString());
                        widget.data2.unit =
                            num.parse(unitController.text.toString());
                        widget.data2.totWeight =
                            num.parse(areaController.text.toString()) *
                                num.parse(unitController.text.toString());

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
                                builder: (context) => WeldingPage5(
                                      data: widget.data,
                                      data2: widget.data2,
                                    )));
                      },
                      child: Text("Next")),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
