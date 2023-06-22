// To parse this JSON data, do
//
//     final resGetFamilyMembers = resGetFamilyMembersFromJson(jsonString);

import 'dart:convert';

ResGetFamilyMembers resGetFamilyMembersFromJson(String str) => ResGetFamilyMembers.fromJson(json.decode(str));

String resGetFamilyMembersToJson(ResGetFamilyMembers data) => json.encode(data.toJson());

class ResGetFamilyMembers {
    int code;
    int subcode;
    dynamic message;
    Data data;

    ResGetFamilyMembers({
        required this.code,
        required this.subcode,
        this.message,
        required this.data,
    });

    factory ResGetFamilyMembers.fromJson(Map<String, dynamic> json) => ResGetFamilyMembers(
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
    List<FamilyMember> familyMembers;
    Pagination pagination;

    Data({
        required this.familyMembers,
        required this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        familyMembers: List<FamilyMember>.from(json["familyMembers"].map((x) => FamilyMember.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "familyMembers": List<dynamic>.from(familyMembers.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class FamilyMember {
    int memberId;
    int relationShipType;
    String fullName;
    DateTime dob;
    String gender;
    dynamic totalRecords;

    FamilyMember({
        required this.memberId,
        required this.relationShipType,
        required this.fullName,
        required this.dob,
        required this.gender,
        this.totalRecords,
    });

    factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
        memberId: json["memberId"],
        relationShipType: json["relationShipType"],
        fullName: json["fullName"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "relationShipType": relationShipType,
        "fullName": fullName,
        "dob": dob.toIso8601String(),
        "gender": gender,
        "totalRecords": totalRecords,
    };
}

class Pagination {
    int totalRecords;
    bool nextPage;

    Pagination({
        required this.totalRecords,
        required this.nextPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalRecords: json["totalRecords"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords,
        "nextPage": nextPage,
    };
}
