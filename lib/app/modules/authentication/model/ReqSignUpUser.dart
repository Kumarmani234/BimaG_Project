// To parse this JSON data, do
//
//     final reqSignUpUser = reqSignUpUserFromJson(jsonString);

import 'dart:convert';

ReqSignUpUser reqSignUpUserFromJson(String str) => ReqSignUpUser.fromJson(json.decode(str));

String reqSignUpUserToJson(ReqSignUpUser data) => json.encode(data.toJson());

class ReqSignUpUser {
    String? phoneNumber;
    String? countryCode;
    String? userName;
    String? firstName;
    String? lastName;
    String? userEmail;
    String? streetAddress;
    int? pincodeId;
    String? gender;
    String? dob;
    String? passcode;

    ReqSignUpUser({
        this.phoneNumber,
        this.countryCode,
        this.userName,
        this.firstName,
        this.lastName,
        this.userEmail,
        this.streetAddress,
        this.pincodeId,
        this.gender,
        this.dob,
        this.passcode,
    });

    factory ReqSignUpUser.fromJson(Map<String, dynamic> json) => ReqSignUpUser(
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userEmail: json["userEmail"],
        streetAddress: json["streetAddress"],
        pincodeId: json["pincodeId"],
        gender: json["gender"],
        dob: json["dob"],
        passcode: json["passcode"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "userEmail": userEmail,
        "streetAddress": streetAddress,
        "pincodeId": pincodeId,
        "gender": gender,
        "dob": dob,
        "passcode": passcode,
    };
}
