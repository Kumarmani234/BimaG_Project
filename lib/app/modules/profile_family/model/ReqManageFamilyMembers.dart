// To parse this JSON data, do
//
//     final reqManageFamilyMembers = reqManageFamilyMembersFromJson(jsonString);

import 'dart:convert';

ReqManageFamilyMembers reqManageFamilyMembersFromJson(String str) => ReqManageFamilyMembers.fromJson(json.decode(str));

String reqManageFamilyMembersToJson(ReqManageFamilyMembers data) => json.encode(data.toJson());

class ReqManageFamilyMembers {
    int? memberId;
    int? relationShipType;
    String? fullName;
    DateTime? dob;
    String? gender;

    ReqManageFamilyMembers({
        this.memberId,
        this.relationShipType,
        this.fullName,
        this.dob,
        this.gender,
    });

    factory ReqManageFamilyMembers.fromJson(Map<String, dynamic> json) => ReqManageFamilyMembers(
        memberId: json["MemberId"],
        relationShipType: json["relationShipType"],
        fullName: json["fullName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "MemberId": memberId,
        "relationShipType": relationShipType,
        "fullName": fullName,
        "dob": dob?.toIso8601String(),
        "gender": gender,
    };
}
