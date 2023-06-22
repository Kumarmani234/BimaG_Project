// To parse this JSON data, do
//
//     final resCities = resCitiesFromJson(jsonString);

import 'dart:convert';

ResCities resCitiesFromJson(String str) => ResCities.fromJson(json.decode(str));

String resCitiesToJson(ResCities data) => json.encode(data.toJson());

class ResCities {
    int? code;
    int? subcode;
    dynamic message;
    List<CitiesList>? data;

    ResCities({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResCities.fromJson(Map<String, dynamic> json) => ResCities(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CitiesList>.from(json["data"]!.map((x) => CitiesList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CitiesList {
    int? masterId;
    String? city;
    int? pincode;

    CitiesList({
        this.masterId,
        this.city,
        this.pincode,
    });

    factory CitiesList.fromJson(Map<String, dynamic> json) => CitiesList(
        masterId: json["masterId"],
        city: json["city"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "masterId": masterId,
        "city": city,
        "pincode": pincode,
    };
}
