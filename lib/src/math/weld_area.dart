// To parse this JSON data, do
//
//     final weldArea = weldAreaFromJson(jsonString);

import 'dart:convert';

WeldArea weldAreaFromJson(String str) => WeldArea.fromJson(json.decode(str));

String weldAreaToJson(WeldArea data) => json.encode(data.toJson());

class WeldArea {
    WeldArea({
        required this.a,
        required this.t,
    });

    int a;
    int t;

    factory WeldArea.fromJson(Map<String, dynamic> json) => WeldArea(
        a: json["a"],
        t: json["t"],
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "t": t,
    };
}
