// To parse this JSON data, do
//
//     final reqEditUserProfile = reqEditUserProfileFromJson(jsonString);

import 'dart:convert';

ReqEditUserProfile reqEditUserProfileFromJson(String str) => ReqEditUserProfile.fromJson(json.decode(str));

String reqEditUserProfileToJson(ReqEditUserProfile data) => json.encode(data.toJson());

class ReqEditUserProfile {
    String? firstName;
    String? lastName;
    String? userEmail;
    String? gender;
    String? streetAddress;
    int? pincodeId;
    DateTime? dob;

    ReqEditUserProfile({
        this.firstName,
        this.lastName,
        this.userEmail,
        this.gender,
        this.streetAddress,
        this.pincodeId,
        this.dob,
    });

    factory ReqEditUserProfile.fromJson(Map<String, dynamic> json) => ReqEditUserProfile(
        firstName: json["firstName"],
        lastName: json["lastName"],
        userEmail: json["userEmail"],
        gender: json["gender"],
        streetAddress: json["streetAddress"],
        pincodeId: json["pincodeId"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "userEmail": userEmail,
        "gender": gender,
        "streetAddress": streetAddress,
        "pincodeId": pincodeId,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    };
}
