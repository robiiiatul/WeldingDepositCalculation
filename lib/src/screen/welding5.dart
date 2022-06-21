import 'dart:math';

import 'package:nov/src/math/data.dart';
import 'package:nov/src/math/data2.dart';

import 'package:flutter/material.dart';
import 'package:nov/themes.dart';
import 'package:vector_math/vector_math.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class WeldingPage5 extends StatefulWidget {
  final DataObj data;
  final BevelType data2;
  const WeldingPage5({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  State<WeldingPage5> createState() => _WeldingPage5State();
}

class _WeldingPage5State extends State<WeldingPage5> {
  final auth = FirebaseAuth.instance;

  var totWeightController = TextEditingController();
  var lossFactorController = TextEditingController();
  var purchaseWeightController = TextEditingController();

  String? _valWeldingProccess;
  List _weldingProccess = [
    "SMAW",
    "GTAW",
    "GMAW",
    "SAW",
    "FCAW",
    "ESW",
  ];

  @override
  void initState() {
    super.initState();
    print(widget.data.toJson().toString());
    print(widget.data2.toJson().toString());
    totWeightController.value =
        TextEditingValue(text: widget.data2.totWeight.toString());
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
                  controller: totWeightController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Total Weight',
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
                  hint: Text("Welding Proccess"),
                  value: _valWeldingProccess,
                  items: _weldingProccess.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == "SMAW") {
                      lossFactorController.text = 1.5.toString();
                    } else if (value == "GTAW") {
                      lossFactorController.text = 1.1.toString();
                    } else if (value == "GMAW") {
                      lossFactorController.text = 1.05.toString();
                    } else if (value == "SAW") {
                      lossFactorController.text = 1.02.toString();
                    } else if (value == "FCAW") {
                      lossFactorController.text = 1.2.toString();
                    } else if (value == "ESW") {
                      lossFactorController.text = 1.1.toString();
                    }

                    widget.data2.weldingProccess = value.toString();
                    purchaseWeightController.text =
                        (num.parse(lossFactorController.text) *
                                num.parse(widget.data2.totWeight.toString()))
                            .toString();
                    setState(() {
                      _valWeldingProccess = value as String;
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
                  controller: lossFactorController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Loss Factor',
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
                  controller: purchaseWeightController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Purchase Weight',
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
                        widget.data2.totWeight =
                            num.parse(totWeightController.text.toString());
                        widget.data2.lossFactor =
                            num.parse(lossFactorController.text.toString());
                        widget.data2.puchaseWeight =
                            num.parse(purchaseWeightController.text.toString());

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
                      child: Text("Finish")),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
