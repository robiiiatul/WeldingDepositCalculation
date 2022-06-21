// To parse this JSON data, do
//
//     final doublevee = doubleveeFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

Doublevee doubleveeFromJson(String str) => Doublevee.fromJson(json.decode(str));

String doubleveeToJson(Doublevee data) => json.encode(data.toJson());

class Doublevee {
    Doublevee({
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
    });

    int weldCap;
    int height;
    int rootGap;
    int rootReinforcement;
    int t;
    int t2;
    int radians;
    int a1;
    int a2;
    int a3;
    int a4;
    int a5;
    int atotal;

    num luasSatu(num t, num radians) {
    return 1 / 2 * t * (t / tan(radians));
  }

  num luasDua(num t2, num radians) {
    return 1 / 2 * t2 * (t2 / tan(radians));
  }

  num luasTiga(num t, num radians) {
    return (2*(t/tan(radians)+4))*3;
  }

   num luasEmpat(num t2, num radians) {
    return (2*(t2/tan(radians)+4))*3;
  }

  num luasLima(num t) {
    return (t+t2)*4;
  }

  num luasTotal(num t, num radians) {
    return luasSatu(t, radians)*2 + luasDua(t, radians)*2 + luasTiga(t,radians) + luasEmpat(t, radians) + luasLima(t);
  }


    factory Doublevee.fromJson(Map<String, dynamic> json) => Doublevee(
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
    };
}


    
    