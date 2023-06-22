// To parse this JSON data, do
//
//     final reqCreatePolicy = reqCreatePolicyFromJson(jsonString);

import 'dart:convert';

ReqCreatePolicy reqCreatePolicyFromJson(String str) => ReqCreatePolicy.fromJson(json.decode(str));

String reqCreatePolicyToJson(ReqCreatePolicy data) => json.encode(data.toJson());

class ReqCreatePolicy {
    String? enquiryId;
    int? insuranceCompany;
    bool? isMockPolicy;
    ProposerDetails? proposerDetails;

    ReqCreatePolicy({
        this.enquiryId,
        this.insuranceCompany,
        this.isMockPolicy,
        this.proposerDetails,
    });

    factory ReqCreatePolicy.fromJson(Map<String, dynamic> json) => ReqCreatePolicy(
        enquiryId: json["enquiryId"],
        insuranceCompany: json["insuranceCompany"],
        isMockPolicy: json["isMockPolicy"],
        proposerDetails: json["ProposerDetails"] == null ? null : ProposerDetails.fromJson(json["ProposerDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "enquiryId": enquiryId,
        "insuranceCompany": insuranceCompany,
        "isMockPolicy": isMockPolicy,
        "ProposerDetails": proposerDetails?.toJson(),
    };
}

class ProposerDetails {
    String? firstName;
    String? lastName;
    String? email;
    String? phoneNumber;
    DateTime? dob;

    ProposerDetails({
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.dob,
    });

    factory ProposerDetails.fromJson(Map<String, dynamic> json) => ProposerDetails(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "DOB": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    };
}
