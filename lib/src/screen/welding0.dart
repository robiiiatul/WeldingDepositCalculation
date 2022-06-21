import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nov/src/math/double_bevel.dart';
import 'package:nov/src/screen/welding1.dart';
import 'package:nov/src/screen/welding2.dart';
import 'package:nov/themes.dart';
import 'package:vector_math/vector_math.dart';
import 'package:timelines/timelines.dart';

import '../math/data.dart';
import '../math/data.dart';
import '../math/data2.dart';
import '../math/single_vee.dart';
import 'login.dart';

import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final auth = FirebaseAuth.instance;
  DataObj data = DataObj(
      jointNumber: '',
      jointType: '',
      name: '',
      nozzleSize: '',
      tagNum: 0,
      bevelType: '',
      weldPassType: '',
      mats: '',
      dia: 0,
      steelDensity: 0,
      weldLength: 0);
  BevelType data2 = BevelType(
      a1: 0,
      a2: 0,
      a3: 0,
      bevelAngle: 0,
      rad: 0,
      t1: 0,
      t2: 0,
      thickness: 0,
      x1: 0,
      x2: 0,
      y1: 0,
      y2: 0,
      area: 0,
      lossFactor: 0,
      puchaseWeight: 0,
      totWeight: 0,
      unit: 0,
      weight: 0,
      weldingProccess: '',
      a1t2: 0,
      a2t2: 0,
      a3t2: 0);

  var nameController = TextEditingController();
  var tagNumController = TextEditingController();
  var jointTypeController = TextEditingController();
  var nozzleSizeController = TextEditingController();
  var jointNumController = TextEditingController();
  @override
  Widget build1(BuildContext context) {
    return Timeline.tileBuilder(
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Timeline Event $index'),
        ),
        itemCount: 10,
      ),
    );
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
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Vessel Name',
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
                  controller: tagNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Tag Number',
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
                  controller: jointTypeController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Joint Type',
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
                  controller: nozzleSizeController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Nozzle Size',
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
                  controller: jointNumController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Joint Number',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              //   ElevatedButton(
              //       onPressed: () {
              //         data.name = nameController.text.toString();

              //         data.tagNum = num.parse(tagNumController.text.toString());

              //         data.jointType = jointTypeController.text.toString();

              //         data.nozzleSize = nozzleSizeController.text.toString();

              //         data.jointNumber = jointNumController.text.toString();

              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => CalculatorScreen1(
              //                       data: data,
              //                       data2: data2,
              //                     )));
              //       },
              //       child: Text("Back")),
              // ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    onPressed: () {
                      data.name = nameController.text.toString();

                      data.tagNum = num.parse(tagNumController.text.toString());

                      data.jointType = jointTypeController.text.toString();

                      data.nozzleSize = nozzleSizeController.text.toString();

                      data.jointNumber = jointNumController.text.toString();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalculatorScreen1(
                                    data: data,
                                    data2: data2,
                                  )));
                    },
                    child: Text("Next")),
              ]),
              Column(
                children: [Text("\r\r\r\r")],
              )
            ],
          ),
          Column(
            children: [Text("\r")],
          ),
        ]),
      ),
    );
  }
}
