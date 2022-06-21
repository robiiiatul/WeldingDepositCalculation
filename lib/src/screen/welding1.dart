import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nov/src/math/double_bevel.dart';
import 'package:nov/src/screen/welding2.dart';
import 'package:nov/themes.dart';
import 'package:vector_math/vector_math.dart';

import '../math/data.dart';
import '../math/data.dart';
import '../math/data2.dart';
import '../math/single_vee.dart';
import 'login.dart';

import 'dart:math';

class CalculatorScreen1 extends StatefulWidget {
  final DataObj data;
  final BevelType data2;
  const CalculatorScreen1({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  State<CalculatorScreen1> createState() => _CalculatorScreen1State();
}

class _CalculatorScreen1State extends State<CalculatorScreen1> {
  final auth = FirebaseAuth.instance;

  var diaController = TextEditingController();
  var weldLengthController = TextEditingController();
  var sdController = TextEditingController();
  var bevelTypeController = TextEditingController();
  var weldPasController = TextEditingController();
  var number6Controller = TextEditingController();
  String? _valMats;
  List _mats = [
    "SS",
    "CS",
  ];
  String? _valBevel;
  List _bevel = [
    "DB",
    "SB",
    "DV",
    "SV",
    "FW",
  ];
  String? _valWeldpass;
  List _weldpass = [
    "Root-Hotpass",
    "Filler-Capping",
    "Root-Capping",
  ];
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
                child: DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text("Bevel Type"),
                  value: _valBevel,
                  items: _bevel.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    widget.data.bevelType = value.toString();
                    setState(() {
                      _valBevel = value as String;
                    });
                  },
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
                child: DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text("Weld Pass Type"),
                  value: _valWeldpass,
                  items: _weldpass.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    widget.data.weldPassType = value.toString();
                    setState(() {
                      _valWeldpass = value as String;
                    });
                  },
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
                  controller: diaController,
                  onChanged: (value) {
                    calculate();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Diameter',
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
                  controller: weldLengthController,
                  onChanged: (value) {
                    calculate();
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Weld Length',
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
                child: DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text("Material"),
                  value: _valMats,
                  items: _mats.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    widget.data.mats = value.toString();
                    if (value == "CS") {
                      sdController.text = 8000.toString();
                    }
                    if (value == "SS") {
                      sdController.text = 7870.toString();
                    }
                    setState(() {
                      _valMats = value as String;
                    });
                  },
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
                  controller: sdController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Steel Density',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back")),
              ]),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        widget.data.dia =
                            num.parse(diaController.text.toString());
                        widget.data.weldLength =
                            num.parse(weldLengthController.text.toString());
                        widget.data.steelDensity =
                            num.parse(sdController.text.toString());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeldingPage2(
                                      data: widget.data,
                                      data2: widget.data2,
                                    )));
                      },
                      child: Text("Next")),
                ],
              )
            ],
          ),
          // Center(
          //   child: FlatButton(
          //     child: Text('Logout'),
          //     onPressed: () {
          //       auth.signOut();
          //       Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(builder: (context) => LoginScreen()));
          //     },
          //   ),
          // )
        ]),
      ),
    );
  }

  void calculate() {
    if (diaController.text.trim().isNotEmpty) {
      final firstValue = double.parse(diaController.text);

      weldLengthController.text = ((pi) * firstValue).toString();
    }
  }
}
