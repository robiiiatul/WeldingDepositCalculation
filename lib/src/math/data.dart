// To parse this JSON data, do
//
//     final DataObj = DataObjFromJson(jsonString);

import 'dart:convert';

DataObj DataObjFromJson(String str) => DataObj.fromJson(json.decode(str));

String DataObjToJson(DataObj data) => json.encode(data.toJson());

class DataObj {
  DataObj({
    required this.name,
    required this.tagNum,
    required this.jointType,
    required this.nozzleSize,
    required this.jointNumber,
    required this.bevelType,
    required this.weldPassType,
    required this.mats,
    required this.dia,
    required this.weldLength,
    required this.steelDensity,
  });

  String name;
  num tagNum;
  String jointType;
  String nozzleSize;
  String jointNumber;
  String bevelType;
  String weldPassType;
  String mats;
  num dia;
  num weldLength;
  num steelDensity;

  factory DataObj.fromJson(Map<String, dynamic> json) => DataObj(
        name: json["name"],
        tagNum: json["tagNum"],
        jointType: json["jointType"],
        nozzleSize: json["nozzleSize"],
        jointNumber: json["jointNumber"],
        bevelType: json["bevelType"],
        weldPassType: json["weldPassType"],
        mats: json["mats"],
        dia: json["dia"],
        weldLength: json["weldLength"],
        steelDensity: json["steelDensity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "tagNum": tagNum,
        "jointType": jointType,
        "nozzleSize": nozzleSize,
        "jointNumber": jointNumber,
        "bevelType": bevelType,
        "weldPassType": weldPassType,
        "mats": mats,
        "dia": dia,
        "weldLength": weldLength,
        "steelDensity": steelDensity,
      };
}
