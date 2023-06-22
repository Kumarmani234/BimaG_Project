// To parse this JSON data, do
//
//     final reqManageProperty = reqManagePropertyFromJson(jsonString);

import 'dart:convert';

ReqManageProperty reqManagePropertyFromJson(String str) => ReqManageProperty.fromJson(json.decode(str));

String reqManagePropertyToJson(ReqManageProperty data) => json.encode(data.toJson());

class ReqManageProperty {
    int? propertyType;
    int? propertyId;
    String? propertyCity;
    int? propertyAge;
    int? propertyValue;
    bool? isInsured;
    DateTime? policyExpiryDate;

    ReqManageProperty({
        this.propertyType,
        this.propertyId,
        this.propertyCity,
        this.propertyAge,
        this.propertyValue,
        this.isInsured,
        this.policyExpiryDate,
    });

    factory ReqManageProperty.fromJson(Map<String, dynamic> json) => ReqManageProperty(
        propertyType: json["propertyType"],
        propertyId: json["propertyId"],
        propertyCity: json["propertyCity"],
        propertyAge: json["propertyAge"],
        propertyValue: json["propertyValue"],
        isInsured: json["isInsured"],
        policyExpiryDate: json["policyExpiryDate"] == null ? null : DateTime.parse(json["policyExpiryDate"]),
    );

    Map<String, dynamic> toJson() => {
        "propertyType": propertyType,
        "propertyId": propertyId,
        "propertyCity": propertyCity,
        "propertyAge": propertyAge,
        "propertyValue": propertyValue,
        "isInsured": isInsured,
        "policyExpiryDate": policyExpiryDate?.toIso8601String(),
    };
}
