// To parse this JSON data, do
//
//     final resGetVehicleCompanyList = resGetVehicleCompanyListFromJson(jsonString);

import 'dart:convert';

ResGetVehicleCompanyList resGetVehicleCompanyListFromJson(String str) => ResGetVehicleCompanyList.fromJson(json.decode(str));

String resGetVehicleCompanyListToJson(ResGetVehicleCompanyList data) => json.encode(data.toJson());

class ResGetVehicleCompanyList {
    int? code;
    int? subcode;
    dynamic message;
    List<ManufacturerModel>? data;

    ResGetVehicleCompanyList({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetVehicleCompanyList.fromJson(Map<String, dynamic> json) => ResGetVehicleCompanyList(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<ManufacturerModel>.from(json["data"]!.map((x) => ManufacturerModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ManufacturerModel {
    int? id;
    String? name;

    ManufacturerModel({
        this.id,
        this.name,
    });

    factory ManufacturerModel.fromJson(Map<String, dynamic> json) => ManufacturerModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
