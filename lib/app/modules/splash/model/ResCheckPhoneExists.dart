// To parse this JSON data, do
//
//     final resCheckPhoneExists = resCheckPhoneExistsFromJson(jsonString);

import 'dart:convert';

ResCheckPhoneExists resCheckPhoneExistsFromJson(String str) => ResCheckPhoneExists.fromJson(json.decode(str));

String resCheckPhoneExistsToJson(ResCheckPhoneExists data) => json.encode(data.toJson());

class ResCheckPhoneExists {
    ResCheckPhoneExists({
        required this.code,
        required this.subcode,
        required this.message,
        this.data,
    });

    int code;
    int subcode;
    String message;
    dynamic data;

    factory ResCheckPhoneExists.fromJson(Map<String, dynamic> json) => ResCheckPhoneExists(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data,
    };
}
