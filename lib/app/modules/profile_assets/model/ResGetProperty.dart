// To parse this JSON data, do
//
//     final resGetProperties = resGetPropertiesFromJson(jsonString);

import 'dart:convert';

ResGetProperties resGetPropertiesFromJson(String str) => ResGetProperties.fromJson(json.decode(str));

String resGetPropertiesToJson(ResGetProperties data) => json.encode(data.toJson());

class ResGetProperties {
    int code;
    int subcode;
    dynamic message;
    Data data;

    ResGetProperties({
        required this.code,
        required this.subcode,
        this.message,
        required this.data,
    });

    factory ResGetProperties.fromJson(Map<String, dynamic> json) => ResGetProperties(
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
    List<UserProperty> userProperties;
    Pagination pagination;

    Data({
        required this.userProperties,
        required this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userProperties: List<UserProperty>.from(json["userProperties"].map((x) => UserProperty.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "userProperties": List<dynamic>.from(userProperties.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
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

class UserProperty {
    int propertyId;
    int propertyType;
    String propertyCity;
    int propertyAge;
    int propertyValue;
    bool isInsured;
    DateTime policyExpiryDate;

    UserProperty({
        required this.propertyId,
        required this.propertyType,
        required this.propertyCity,
        required this.propertyAge,
        required this.propertyValue,
        required this.isInsured,
        required this.policyExpiryDate,
    });

    factory UserProperty.fromJson(Map<String, dynamic> json) => UserProperty(
        propertyId: json["propertyId"],
        propertyType: json["propertyType"],
        propertyCity: json["propertyCity"],
        propertyAge: json["propertyAge"],
        propertyValue: json["propertyValue"],
        isInsured: json["isInsured"],
        policyExpiryDate: DateTime.parse(json["policyExpiryDate"]),
    );

    Map<String, dynamic> toJson() => {
        "propertyId": propertyId,
        "propertyType": propertyType,
        "propertyCity": propertyCity,
        "propertyAge": propertyAge,
        "propertyValue": propertyValue,
        "isInsured": isInsured,
        "policyExpiryDate": policyExpiryDate.toIso8601String(),
    };
}
