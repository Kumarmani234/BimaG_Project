// To parse this JSON data, do
//
//     final resGetCityRto = resGetCityRtoFromJson(jsonString);

import 'dart:convert';

ResGetCityRto resGetCityRtoFromJson(String str) => ResGetCityRto.fromJson(json.decode(str));

String resGetCityRtoToJson(ResGetCityRto data) => json.encode(data.toJson());

class ResGetCityRto {
    int? code;
    int? subcode;
    dynamic message;
    List<String>? data;

    ResGetCityRto({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetCityRto.fromJson(Map<String, dynamic> json) => ResGetCityRto(
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
