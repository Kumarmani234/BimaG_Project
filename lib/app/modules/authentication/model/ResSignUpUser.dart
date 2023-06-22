// To parse this JSON data, do
//
//     final resSignUpUser = resSignUpUserFromJson(jsonString);

import 'dart:convert';

ResSignUpUser resSignUpUserFromJson(String str) => ResSignUpUser.fromJson(json.decode(str));

String resSignUpUserToJson(ResSignUpUser data) => json.encode(data.toJson());

class ResSignUpUser {
    int? code;
    int? subcode;
    String? message;
    Data? data;

    ResSignUpUser({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResSignUpUser.fromJson(Map<String, dynamic> json) => ResSignUpUser(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? uniqueUserId;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    String? userEmail;
    String? userName;
    String? dob;
    String? gender;
    String? accessToken;

    Data({
        this.uniqueUserId,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.userEmail,
        this.userName,
        this.dob,
        this.gender,
        this.accessToken,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        uniqueUserId: json["uniqueUserId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        userEmail: json["userEmail"],
        userName: json["userName"],
        dob: json["dob"],
        gender: json["gender"],
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "uniqueUserId": uniqueUserId,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "userEmail": userEmail,
        "userName": userName,
        "dob": dob,
        "gender": gender,
        "accessToken": accessToken,
    };
}
