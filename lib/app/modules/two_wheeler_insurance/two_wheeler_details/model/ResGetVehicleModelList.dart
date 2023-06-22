// To parse this JSON data, do
//
//     final resGetVehicleModelList = resGetVehicleModelListFromJson(jsonString);

import 'dart:convert';

ResGetVehicleModelList resGetVehicleModelListFromJson(String str) => ResGetVehicleModelList.fromJson(json.decode(str));

String resGetVehicleModelListToJson(ResGetVehicleModelList data) => json.encode(data.toJson());

class ResGetVehicleModelList {
    int? code;
    int? subcode;
    dynamic message;
    List<VehicleModelList>? data;

    ResGetVehicleModelList({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetVehicleModelList.fromJson(Map<String, dynamic> json) => ResGetVehicleModelList(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<VehicleModelList>.from(json["data"]!.map((x) => VehicleModelList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class VehicleModelList {
    int? id;
    String? name;

    VehicleModelList({
        this.id,
        this.name,
    });

    factory VehicleModelList.fromJson(Map<String, dynamic> json) => VehicleModelList(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
