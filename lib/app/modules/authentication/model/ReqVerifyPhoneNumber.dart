// To parse this JSON data, do
//
//     final reqVerifyPhoneNumber = reqVerifyPhoneNumberFromJson(jsonString);

import 'dart:convert';

ReqVerifyPhoneNumber reqVerifyPhoneNumberFromJson(String str) => ReqVerifyPhoneNumber.fromJson(json.decode(str));

String reqVerifyPhoneNumberToJson(ReqVerifyPhoneNumber data) => json.encode(data.toJson());

class ReqVerifyPhoneNumber {
    String? phoneNumber;
    int? verificationType;

    ReqVerifyPhoneNumber({
        this.phoneNumber,
        this.verificationType,
    });

    factory ReqVerifyPhoneNumber.fromJson(Map<String, dynamic> json) => ReqVerifyPhoneNumber(
        phoneNumber: json["phoneNumber"],
        verificationType: json["verificationType"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "verificationType": verificationType,
    };
}
