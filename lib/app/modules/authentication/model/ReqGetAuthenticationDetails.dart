// To parse this JSON data, do
//
//     final reqGetAuthenticationDetails = reqGetAuthenticationDetailsFromJson(jsonString);

import 'dart:convert';

ReqGetAuthenticationDetails reqGetAuthenticationDetailsFromJson(String str) => ReqGetAuthenticationDetails.fromJson(json.decode(str));

String reqGetAuthenticationDetailsToJson(ReqGetAuthenticationDetails data) => json.encode(data.toJson());

class ReqGetAuthenticationDetails {
    ReqGetAuthenticationDetails({
        required this.phoneNumber,
        required this.password,
    });

    String phoneNumber;
    String password;

    factory ReqGetAuthenticationDetails.fromJson(Map<String, dynamic> json) => ReqGetAuthenticationDetails(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
    };
}
