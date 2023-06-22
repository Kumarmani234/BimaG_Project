// To parse this JSON data, do
//
//     final resDistricts = resDistrictsFromJson(jsonString);

import 'dart:convert';

ResDistricts resDistrictsFromJson(String str) => ResDistricts.fromJson(json.decode(str));

String resDistrictsToJson(ResDistricts data) => json.encode(data.toJson());

class ResDistricts {
    int? code;
    int? subcode;
    dynamic message;
    List<String>? data;

    ResDistricts({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResDistricts.fromJson(Map<String, dynamic> json) => ResDistricts(
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
