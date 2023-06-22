// To parse this JSON data, do
//
//     final resGetAuthenticationDetails = resGetAuthenticationDetailsFromJson(jsonString);

import 'dart:convert';

ResGetAuthenticationDetails resGetAuthenticationDetailsFromJson(String str) => ResGetAuthenticationDetails.fromJson(json.decode(str));

String resGetAuthenticationDetailsToJson(ResGetAuthenticationDetails data) => json.encode(data.toJson());

class ResGetAuthenticationDetails {
    int code;
    int subcode;
    String message;
    Data data;

    ResGetAuthenticationDetails({
        required this.code,
        required this.subcode,
        required this.message,
        required this.data,
    });

    factory ResGetAuthenticationDetails.fromJson(Map<String, dynamic> json) => ResGetAuthenticationDetails(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String uniqueUserId;
    String firstName;
    String lastName;
    String countryCode;
    String phoneNumber;
    String userEmail;
    String userName;
    String dob;
    String gender;
    String streetAddress;
    int pincodeId;
    String accessToken;

    Data({
        required this.uniqueUserId,
        required this.firstName,
        required this.lastName,
        required this.countryCode,
        required this.phoneNumber,
        required this.userEmail,
        required this.userName,
        required this.dob,
        required this.gender,
        required this.streetAddress,
        required this.pincodeId,
        required this.accessToken,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        uniqueUserId: json["uniqueUserId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
        userEmail: json["userEmail"],
        userName: json["userName"],
        dob: json["dob"],
        gender: json["gender"],
        streetAddress: json["streetAddress"],
        pincodeId: json["pincodeId"],
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "uniqueUserId": uniqueUserId,
        "firstName": firstName,
        "lastName": lastName,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "userEmail": userEmail,
        "userName": userName,
        "dob": dob,
        "gender": gender,
        "streetAddress": streetAddress,
        "pincodeId": pincodeId,
        "accessToken": accessToken,
    };
}
