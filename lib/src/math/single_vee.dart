// To parse this JSON data, do
//
//     final sInglevee = sIngleveeFromJson(jsonString);

import 'dart:convert';

import 'dart:math';

List<Singlevee> sIngleveeFromJson(String str) => List<Singlevee>.from(json.decode(str).map((x) => Singlevee.fromJson(x)));

String sIngleveeToJson(List<Singlevee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Singlevee {
    Singlevee({
        required this.weldCap,
        required this.height,
        required this.rootGap,
        required this.a1,
        required this.a2,
        required this.a3,
        required this.aTotal,
        required this.t,
        required this.radians,
    });

    num weldCap;
    num height;
    num rootGap;
    num a1;
    num a2;
    num a3;
    num aTotal;
    num t;
    num radians;

    num luasSatu(num t, num radians){
      return 1/2 * t * (t /tan(radians));
    }
    num luasDua(num t, num radians){
      return (2 * (t /tan(radians)) + 4) *3;
    }
    num luasTiga(num t){
      return t*4;
    }
    num luasTtotal(num t, num radians){
      return luasSatu(t, radians)*2+luasDua(t, radians)+luasTiga(t);
    }
    factory Singlevee.fromJson(Map<String, dynamic> json) => Singlevee(
        weldCap: json["weld_cap"],
        height: json["height"],
        rootGap: json["root_gap"],
        a1: json["a1"],
        a2: json["a2"],
        a3: json["a3"],
        aTotal: json["a_total"],
        t: json["T"],
        radians: json["radians"],
    );

    Map<String, dynamic> toJson() => {
        "weld_cap": weldCap,
        "height": height,
        "root_gap": rootGap,
        "a1": a1,
        "a2": a2,
        "a3": a3,
        "a_total": aTotal,
        "T": t,
        "radians": radians,
    };
}
