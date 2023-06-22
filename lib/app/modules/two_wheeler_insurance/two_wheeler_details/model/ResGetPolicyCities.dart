// To parse this JSON data, do
//
//     final resGetPolicyCities = resGetPolicyCitiesFromJson(jsonString);

import 'dart:convert';

ResGetPolicyCities resGetPolicyCitiesFromJson(String str) => ResGetPolicyCities.fromJson(json.decode(str));

String resGetPolicyCitiesToJson(ResGetPolicyCities data) => json.encode(data.toJson());

class ResGetPolicyCities {
    int? code;
    int? subcode;
    dynamic message;
    List<String>? data;

    ResGetPolicyCities({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetPolicyCities.fromJson(Map<String, dynamic> json) => ResGetPolicyCities(
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
