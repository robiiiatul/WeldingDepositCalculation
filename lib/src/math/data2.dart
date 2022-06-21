// To parse this JSON data, do
//
//     final bevelType = bevelTypeFromJson(jsonString);

import 'dart:convert';

BevelType bevelTypeFromJson(String str) => BevelType.fromJson(json.decode(str));

String bevelTypeToJson(BevelType data) => json.encode(data.toJson());

class BevelType {
  BevelType({
    required this.thickness,
    required this.t1,
    required this.t2,
    required this.bevelAngle,
    required this.rad,
    required this.y1,
    required this.x1,
    required this.y2,
    required this.x2,
    required this.a1,
    required this.a2,
    required this.a3,
    required this.a1t2,
    required this.a2t2,
    required this.a3t2,
    required this.area,
    required this.weight,
    required this.unit,
    required this.totWeight,
    required this.weldingProccess,
    required this.lossFactor,
    required this.puchaseWeight,
  });

  num thickness;
  num t1;
  num t2;
  num bevelAngle;
  num rad;
  num y1;
  num x1;
  num y2;
  num x2;
  num a1;
  num a2;
  num a3;
  num a1t2;
  num a2t2;
  num a3t2;
  num area;
  num weight;
  num unit;
  num totWeight;
  String weldingProccess;
  num lossFactor;
  num puchaseWeight;

  factory BevelType.fromJson(Map<String, dynamic> json) => BevelType(
        thickness: json["thickness"],
        t1: json["t1"],
        t2: json["t2"],
        bevelAngle: json["bevelAngle"],
        rad: json["rad"],
        y1: json["y1"],
        x1: json["x1"],
        y2: json["y2"],
        x2: json["x2"],
        a1: json["a1"],
        a2: json["a2"],
        a3: json["a3"],
        a1t2: json["a1t2"],
        a2t2: json["a2t2"],
        a3t2: json["a3t2"],
        area: json["area"],
        weight: json["weight"],
        unit: json["unit"],
        totWeight: json["totWeight"],
        weldingProccess: json["weldingProccess"],
        lossFactor: json["lossFactor"],
        puchaseWeight: json["puchaseWeight"],
      );

  Map<String, dynamic> toJson() => {
        "thickness": thickness,
        "t1": t1,
        "t2": t2,
        "bevelAngle": bevelAngle,
        "rad": rad,
        "y1": y1,
        "x1": x1,
        "y2": y2,
        "x2": x2,
        "a1": a1,
        "a2": a2,
        "a3": a3,
        "a1t2": a1t2,
        "a2t2": a2t2,
        "a3t2": a3t2,
        "area": area,
        "weight": weight,
        "unit": unit,
        "totWeight": totWeight,
        "weldingProccess": weldingProccess,
        "lossFactor": lossFactor,
        "puchaseWeight": puchaseWeight,
      };
}
