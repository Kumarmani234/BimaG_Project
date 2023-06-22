// To parse this JSON data, do
//
//     final resStates = resStatesFromJson(jsonString);

import 'dart:convert';

ResStates resStatesFromJson(String str) => ResStates.fromJson(json.decode(str));

String resStatesToJson(ResStates data) => json.encode(data.toJson());

class ResStates {
    int? code;
    int? subcode;
    dynamic message;
    List<String>? data;

    ResStates({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResStates.fromJson(Map<String, dynamic> json) => ResStates(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    };
}
