// To parse this JSON data, do
//
//     final resGetVehicleVariantList = resGetVehicleVariantListFromJson(jsonString);

import 'dart:convert';

ResGetVehicleVariantList resGetVehicleVariantListFromJson(String str) => ResGetVehicleVariantList.fromJson(json.decode(str));

String resGetVehicleVariantListToJson(ResGetVehicleVariantList data) => json.encode(data.toJson());

class ResGetVehicleVariantList {
    int? code;
    int? subcode;
    dynamic message;
    List<VehicleVariantList>? data;

    ResGetVehicleVariantList({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetVehicleVariantList.fromJson(Map<String, dynamic> json) => ResGetVehicleVariantList(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<VehicleVariantList>.from(json["data"]!.map((x) => VehicleVariantList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class VehicleVariantList {
    int? id;
    String? name;

    VehicleVariantList({
        this.id,
        this.name,
    });

    factory VehicleVariantList.fromJson(Map<String, dynamic> json) => VehicleVariantList(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
