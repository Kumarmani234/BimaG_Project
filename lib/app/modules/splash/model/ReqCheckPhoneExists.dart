// To parse this JSON data, do
//
//     final reqCheckPhoneExists = reqCheckPhoneExistsFromJson(jsonString);

import 'dart:convert';

ReqCheckPhoneExists reqCheckPhoneExistsFromJson(String str) => ReqCheckPhoneExists.fromJson(json.decode(str));

String reqCheckPhoneExistsToJson(ReqCheckPhoneExists data) => json.encode(data.toJson());

class ReqCheckPhoneExists {
    ReqCheckPhoneExists({
        required this.phoneNumber,
    });

    String phoneNumber;

    factory ReqCheckPhoneExists.fromJson(Map<String, dynamic> json) => ReqCheckPhoneExists(
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
    };
}
