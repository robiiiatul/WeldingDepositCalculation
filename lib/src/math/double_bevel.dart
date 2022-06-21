// To parse this JSON data, do
//
//     final doublebevel = doublebevelFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

Doublebevel doublebevelFromJson(String str) =>
    Doublebevel.fromJson(json.decode(str));

String doublebevelToJson(Doublebevel data) => json.encode(data.toJson());

class Doublebevel {
  Doublebevel({
    required this.weldCap,
    required this.height,
    required this.rootGap,
    required this.rootReinforcement,
    required this.t,
    required this.t2,
    required this.radians,
    required this.a1,
    required this.a2,
    required this.a3,
    required this.a4,
    required this.a5,
    required this.atotal,
    required this.y1,
    required this.x1,
    required this.y2,
    required this.x2,
  });

  num weldCap;
  num height;
  num rootGap;
  num rootReinforcement;
  num t;
  num t2;
  num radians;
  num a1;
  num a2;
  num a3;
  num a4;
  num a5;
  num atotal;
  num y1;
  num x1;
  num y2;
  num x2;

  num luasSatu(num t, num radians) {
    return 0.5 * t * (t / tan(radians));
  }

  num luasDua(num t2, num radians) {
    return 1 / 2 * t2 * (t2 / tan(radians));
  }

  num luasTiga(num t, num radians) {
    return (2 * (t / tan(radians) + 4)) * 3;
  }

  num luasEmpat(num t2, num radians) {
    return (2 * (t2 / tan(radians) + 4)) * 3;
  }

  num luasLima(num t, num t2) {
    return (t + t2) * 4;
  }

  num luasTotal(num t, num radians) {
    return luasSatu(t, radians) * 2 +
        luasDua(t, radians) * 2 +
        luasTiga(t, radians) +
        luasEmpat(t, radians) +
        luasLima(t, t2);
  }

  factory Doublebevel.fromJson(Map<String, dynamic> json) => Doublebevel(
        weldCap: json["weldCap"],
        height: json["height"],
        rootGap: json["rootGap"],
        rootReinforcement: json["rootReinforcement"],
        t: json["t"],
        t2: json["t2"],
        radians: json["radians"],
        a1: json["A1"],
        a2: json["A2"],
        a3: json["A3"],
        a4: json["A4"],
        a5: json["A5"],
        atotal: json["Atotal"],
        y1: json["y1"],
        x1: json["x1"],
        y2: json["y2"],
        x2: json["x2"],
      );

  Map<String, dynamic> toJson() => {
        "weldCap": weldCap,
        "height": height,
        "rootGap": rootGap,
        "rootReinforcement": rootReinforcement,
        "t": t,
        "t2": t2,
        "radians": radians,
        "A1": a1,
        "A2": a2,
        "A3": a3,
        "A4": a4,
        "A5": a5,
        "Atotal": atotal,
        "y1": y1,
        "x1": x1,
        "y2": y2,
        "x2": x2,
      };
}
