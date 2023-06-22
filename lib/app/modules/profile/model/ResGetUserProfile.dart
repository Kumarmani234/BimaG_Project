// To parse this JSON data, do
//
//     final resGetUserProfile = resGetUserProfileFromJson(jsonString);

import 'dart:convert';

ResGetUserProfile resGetUserProfileFromJson(String str) => ResGetUserProfile.fromJson(json.decode(str));

String resGetUserProfileToJson(ResGetUserProfile data) => json.encode(data.toJson());

class ResGetUserProfile {
    int? code;
    int? subcode;
    dynamic message;
    ProfileData? data;

    ResGetUserProfile({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetUserProfile.fromJson(Map<String, dynamic> json) => ResGetUserProfile(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data?.toJson(),
    };
}

class ProfileData {
    String? phoneNumber;
    String? countryCode;
    String? userName;
    String? profileImage;
    String? city;
    String? pincode;
    String? firstName;
    String? lastName;
    String? userEmail;
    String? gender;
    String? streetAddress;
    int? pincodeId;
    DateTime? dob;

    ProfileData({
        this.phoneNumber,
        this.countryCode,
        this.userName,
        this.profileImage,
        this.city,
        this.pincode,
        this.firstName,
        this.lastName,
        this.userEmail,
        this.gender,
        this.streetAddress,
        this.pincodeId,
        this.dob,
    });

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"],
        userName: json["userName"],
        profileImage: json["profileImage"],
        city: json["city"],
        pincode: json["pincode"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userEmail: json["userEmail"],
        gender: json["gender"],
        streetAddress: json["streetAddress"],
        pincodeId: json["pincodeId"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "userName": userName,
        "profileImage": profileImage,
        "city": city,
        "pincode": pincode,
        "firstName": firstName,
        "lastName": lastName,
        "userEmail": userEmail,
        "gender": gender,
        "streetAddress": streetAddress,
        "pincodeId": pincodeId,
        "dob": dob?.toIso8601String(),
    };
}
